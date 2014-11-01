//
//  ViewController.swift
//  mimetionnaire
//
//  Created by Benjamin Dreux on 2014-10-24.
//  Copyright (c) 2014 Benjamin Dreux. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class ListerMimeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate  {

    @IBOutlet
    var tableView: UITableView!
    
    @IBOutlet
    var searchBar: UISearchBar!
    
    let store = MimeStore()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.searchBar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView( tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
            
            let model = self.store.listMime(searchBar.text)[indexPath.row]
            cell.textLabel.text = model.nom
            return cell

    }
    func tableView( tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int{
            return store.listMime(searchBar.text).count
    }

    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        self.performSegueWithIdentifier("playVideo", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if (segue.identifier == "playVideo") {
            let indexPath = tableView?.indexPathForSelectedRow()
            let model = self.store.listMime(searchBar?.text)[indexPath!.row] as MimeModel
            let url = NSURL(string: model.videoUrl)
            if let subVC = segue.destinationViewController as? AVPlayerViewController {
                subVC.player = AVPlayer(URL: url)
                subVC.player.play()
            }
        }
    }
    
    func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            let model = store.listMime(searchBar?.text)[indexPath.row]
            store.delete(model)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
}

