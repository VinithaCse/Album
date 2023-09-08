//
//  AlbumModel.swift
//  CYGNVSProject
//
//  Created by Vinitha Rao A on 08/09/23.
//

import Foundation

class AlbumModel: NSObject {
    
    var title: String = ""
    var albumId: String = ""
    var id: Int = 0
    var url: String = ""
    var thumbNailUrl: String = ""
    
    var jsonValue: [String: Any] {
        var json: [String: Any] = [:]
        json["albumId"] = albumId
        json["id"] = id
        json["title"] = title
        json["url"] = url
        json["thumbnailUrl"] = thumbNailUrl
        return json
    }
    
    override init() {
        super.init()
    }
    
    init(withJSON toDoDict: Dictionary<String, Any>) {
        
        super.init()
        self.extractDetail(detailDict: toDoDict)
    }
    
    private func extractDetail(detailDict: Dictionary<String, Any>) {
        
        self.title = detailDict["title"] as? String ?? ""
        self.albumId = detailDict["albumId"] as? String ?? ""
        self.id = detailDict["id"] as? Int ?? 0
        self.url = detailDict["url"] as? String ?? ""
        self.thumbNailUrl = detailDict["thumbnailUrl"] as? String ?? ""
    }
    
}
