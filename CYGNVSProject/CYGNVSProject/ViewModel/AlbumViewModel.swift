//
//  ToDoViewModel.swift
//  CYGNVSProject
//
//  Created by Vinitha Rao A on 08/09/23.
//

import UIKit

class AlbumViewModel {
    
    var dataModel = AlbumListModel()
    
    func getData(completionHandler: @escaping(_ isCompleted: Bool) -> Void) {
        
        let apiConfig = APIConfigurator(jsonValue: [:], httpMethod: .get, urlToBeCalled: "https://jsonplaceholder.typicode.com/photos")
        
        AlbumListApi.getalbumListAPI(configuration: apiConfig) {
            [weak self] albumListModel in
            
            if let self = self {
                self.dataModel = albumListModel
                completionHandler(true)
            } else {
                completionHandler(false)
            }
        }
    }
}
