//
//  HomeVC.swift
//  BrightskiesTask
//
//  Created by Ahmed on 6/8/21.
//  Copyright © 2021 eramint.com. All rights reserved.
//

import UIKit
import CoreData

protocol  SearchViewControllerDelegate {
    func didGetRecipeSuccess()
    func didGetrecipeFailed()
}

class HomeVC: UIViewController {
    @IBOutlet weak var RecipetblView : UITableView! {
        didSet {
            RecipetblView.register(UINib(nibName: "RecipeCell", bundle: nil), forCellReuseIdentifier: "RecipeCell")
            RecipetblView.delegate = self
            RecipetblView.dataSource = self
        }
    }
    var presenter  = HomePresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
    }
}

extension HomeVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getRecipeCount()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as! RecipeCell
        cell.selectionStyle = .none
        cell.FavTapped = {
            self.presenter.selectRecipeAt(index: indexPath.row)
        }
        let item = presenter.getRecipesAt(index: indexPath.row)
        cell.configureCell(recipe: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsVC.instantiate(fromAppStoryboard: .home)
        vc.details = presenter.getRecipesAt(index: indexPath.row)
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

extension HomeVC : SearchViewControllerDelegate{
    
    func didGetRecipeSuccess() {
        self.RecipetblView.reloadData()
    }
    
    func didGetrecipeFailed() {
        AMToaster.toast("No Recipe Match")
    }
}
