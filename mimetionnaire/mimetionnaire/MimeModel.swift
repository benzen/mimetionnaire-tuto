//
//  MimeModel.swift
//  mimetionnaire
//
//  Created by Benjamin Dreux on 2014-10-31.
//  Copyright (c) 2014 Benjamin Dreux. All rights reserved.
//

import Foundation

class MimeModel{
    var nom = ""
    var videoUrl = ""

    init(){}
    
    init(nom: String, videoUrl: String){
        self.nom = nom
        self.videoUrl = videoUrl
    }
    
}