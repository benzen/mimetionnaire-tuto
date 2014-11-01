//
//  ViewController.swift
//  mimetionnaire
//
//  Created by Benjamin Dreux on 2014-10-24.
//  Copyright (c) 2014 Benjamin Dreux. All rights reserved.
//

import UIKit

class ListerMimeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet
    var tableView: UITableView!
    
    let store = MimeStore()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView( tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            var cell = self.tableView!.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
            
            let model = self.store.listMime("")[indexPath.row]
            cell.textLabel.text = model.nom
            return cell

    }
    func tableView( tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int{
            return store.listMime("").count
    }


}

