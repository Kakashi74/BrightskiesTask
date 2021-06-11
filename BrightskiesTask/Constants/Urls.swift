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
        let recipeBase = ""
        let imgBase = ""
        switch self {
        case .recipeBase:
            return "\(recipeBase)"
        case .imgBase:
            return imgBase
        }
    }
}
