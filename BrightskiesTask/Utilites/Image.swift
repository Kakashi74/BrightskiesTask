//
//  Image.swift
//  Sallah
//
//  Created by Ahmed on 12/18/19.
//  Copyright © 2019 AhmedDev. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher


extension UIImageView {
    
    func setImageWith(_ linkString: String?)  {
        guard let linkString = linkString,
            let url = URL(string: linkString) else { return }
        self.kf.setImage(with: url)
    }
    
    func setImageWith(url: URL?) {
        guard let url = url else { return  }
        self.kf.setImage(with: url)
    }
    
    
    func downloadImage(from url: URL, contentMode mode: UIView.ContentMode) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
                self.contentMode = mode
            }
            }.resume()
    }
    
    
}

