//
//  ListModel.swift
//  CYGNVSProject
//
//  Created by Vinitha Rao A on 08/09/23.
//

import Foundation

class AlbumListModel: NSObject {
    
    var albumList: [AlbumModel] = []
    
    override init() {
        super.init()
    }
    
    init(withJSON albumListDict: [Dictionary<String,Any>]) {
        super.init()
        
        self.extractList(listDict: albumListDict)
    }
    
    private func extractList(listDict: [Dictionary<String, Any>]) {
        
        for albumDict in listDict {
                let albumModel = AlbumModel(withJSON: albumDict)
                self.albumList.append(albumModel)
            }
    }

}
