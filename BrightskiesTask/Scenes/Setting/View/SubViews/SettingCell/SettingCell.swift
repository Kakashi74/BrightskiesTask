//
//  SettingCell.swift
//  BrightskiesTask
//
//  Created by Ahmed on 6/8/21.
//  Copyright © 2021 eramint.com. All rights reserved.
//

import UIKit
import Kingfisher

class SettingCell: UITableViewCell {
    @IBOutlet weak var RecipeName : UILabel!
    @IBOutlet weak var RecipeImage : UIImageView!
    @IBOutlet weak var RecipeDescription : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func configureCell(recipe: Recipe){
        self.RecipeName.text = recipe.recipeName
        self.RecipeDescription.text = recipe.recipeHeadLine
        let path = recipe.recipeAvatar?.components(separatedBy: "w_1080,f_webp,q_auto/")
                  if let first = path?.first , let last = path?.last{
                      if let url = URL(string:"\(first)\(last)"){
                                 self.RecipeImage.kf.setImage(with: ImageResource(downloadURL: url))
                             }
                  }
    }
    
}
