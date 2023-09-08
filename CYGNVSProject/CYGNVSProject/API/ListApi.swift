//
//  ToDoListApi.swift
//  CYGNVSProject
//
//  Created by Vinitha Rao A on 08/09/23.
//

import Foundation

class AlbumListApi {
    
    class func getalbumListAPI(configuration: APIConfigurator, completionHandler: @escaping(_ data: AlbumListModel) -> Void) {
        
        APIHandler.performRequest(with: configuration) {
            (data, urlResponse, error) in
            
            if error == nil, let receivedData = data {
                
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: receivedData, options: [.allowFragments]) as! [[String: Any]]
                    
                    let albumList = AlbumListModel(withJSON: jsonResult)
                    completionHandler(albumList)
                }
                catch {
                    completionHandler(AlbumListModel())
                }
            }
        }
    }
}
