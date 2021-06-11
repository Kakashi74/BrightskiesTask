//
//  DetailsVC.swift
//  BrightskiesTask
//
//  Created by Ahmed on 6/8/21.
//  Copyright © 2021 eramint.com. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsVC: UIViewController {

    var details : RecipeModelElement?
    @IBOutlet weak var RecipeName : UILabel!
    @IBOutlet weak var RecipeIngredients : UILabel!
    @IBOutlet weak var RecipeImage : UIImageView!
    @IBOutlet weak var FavBtn : UIButton!
    @IBOutlet weak var containerView : UIView! {
        didSet {
            containerView.roundCorners(corners: [.topLeft , .topRight], radius: 10.0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
              super.viewWillAppear(animated)
              navigationController?.setNavigationBarHidden(false, animated: false)
          }

       func UpdateUI(){
        if details?.isSelected == false {
            FavBtn.setImage(UIImage(named:"like"), for: .normal)
        } else {
            FavBtn.setImage(UIImage(named:"heart"), for: .normal)
        }
           let path = details?.image?.components(separatedBy: "w_1080,f_webp,q_auto/")
           if let first = path?.first , let last = path?.last{
               if let url = URL(string:"\(first)\(last)"){
                          self.RecipeImage.kf.setImage(with: ImageResource(downloadURL: url))
                      }
           }
           RecipeName.text = details?.name
           RecipeIngredients.numberOfLines = details?.ingredients?.count ?? 0
           RecipeIngredients.text = details?.ingredients?.joined(separator: "\n")
           RecipeIngredients.sizeToFit()
           
       }
}
