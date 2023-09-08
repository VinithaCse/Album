//
//  AlbumDetailViewModel.swift
//  CYGNVSProject
//
//  Created by Vinitha Rao A on 08/09/23.
//

import UIKit


class AlbumDetailViewModel {
    
    let albumData = AlbumModel()
    
    func setDataFromListView(albumDataFromList: AlbumModel) {
        
        albumData.id = albumDataFromList.id
        albumData.albumId = albumDataFromList.albumId
        albumData.url = albumDataFromList.url
        albumData.thumbNailUrl = albumDataFromList.thumbNailUrl
        albumData.title = albumDataFromList.title
    }
    
    func generateImage(url: String) -> UIImage {
        
        if let urlLink = URL(string: url) {
            
            if let data = try? Data(contentsOf: urlLink) {
            // Create Image and Update Image View
                if let image = UIImage(data: data) {
                    return image
                } else {
                    return UIImage()
                }
            }
        }
        return UIImage()
    }
}
