//
//  RecipeCell.swift
//  BrightskiesTask
//
//  Created by Ahmed on 6/8/21.
//  Copyright © 2021 eramint.com. All rights reserved.
//

import UIKit
import Kingfisher

class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var RecipeName : UILabel!
    @IBOutlet weak var RecipeImage : UIImageView!
    @IBOutlet weak var RecipeDescription : UILabel!
    @IBOutlet weak var FavBtn : UIButton!
    var FavTapped :(() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func favBtnTappe(_ sender : Any){
        FavTapped?()
    }
    
    func configureCell(recipe : RecipeModelElement){
        if recipe.isSelected{
             FavBtn.setImage(UIImage(named: "heart"), for: .normal)
        }else {
            FavBtn.setImage(UIImage(named: "like"), for: .normal)
        }
        self.RecipeDescription.text = recipe.headline ?? ""
        self.RecipeName.text = recipe.name ?? ""
        RecipeImage.kf.indicatorType = .activity
        let path = recipe.image?.components(separatedBy: "w_1080,f_webp,q_auto/")
        if let first = path?.first , let last = path?.last{
            if let url = URL(string:"\(first)\(last)"){
                       self.RecipeImage.kf.setImage(with: ImageResource(downloadURL: url))
                   }
        }
    }
}
