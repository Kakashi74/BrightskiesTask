//
//  SettingVC.swift
//  BrightskiesTask
//
//  Created by Ahmed on 6/8/21.
//  Copyright © 2021 eramint.com. All rights reserved.
//

import UIKit
import CoreData
class FavouritesVC: UIViewController {
    @IBOutlet weak var FavtblView : UITableView! {
        didSet {
            FavtblView.register(UINib(nibName: "SettingCell", bundle: nil), forCellReuseIdentifier: "SettingCell")
            FavtblView.delegate = self
            FavtblView.dataSource = self
        }
    }
    var favRecipe  = [Recipe](){
        didSet{
            FavtblView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favRecipe =  DataBaseManegar.sharedDB.fetchFavRecipes()
    }
}

extension FavouritesVC : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favRecipe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FavtblView.dequeueReusableCell(withIdentifier: "SettingCell") as! SettingCell
        cell.configureCell(recipe: favRecipe[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}
