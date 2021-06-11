//
//  Urls.swift
//  Movies
//
//  Created by Ahmed on 5/24/21.
//  Copyright © 2021 approc. All rights reserved.
//

import Foundation
enum Urls: String{
    
    case imgBase
    case recipeBase

    
    func getUrl()->String{
        
      // "https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}
      //app_id = 39be7465
      // app_key = c64a4d7173ea8856239ee2c731056041
        let recipeBase = "https://api.edamam.com/search"
        let imgBase = "https://www.edamam.com/web-img/e42/"
        switch self {
        case .recipeBase:
            return "\(recipeBase)"
        case .imgBase:
            return imgBase
        }
    }
}
