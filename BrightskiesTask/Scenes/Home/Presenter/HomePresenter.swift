//
//  HomePresenter.swift
//  BrightskiesTask
//
//  Created by Ahmed on 6/8/21.
//  Copyright © 2021 eramint.com. All rights reserved.
//

import Foundation

class HomePresenter {
    weak var view: HomeVC?
    
    init() {
        getRecipeData()
    }
    func attachView(view:HomeVC){
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
    //MARK:- getRecipes.
    var recipes = [RecipeModelElement]()
    func getRecipeCount()-> Int{
        return recipes.count
    }
    func getRecipesAt(index: Int)-> RecipeModelElement{
        return recipes[index]
    }
    
    func selectRecipeAt(index: Int){
        recipes[index].isSelected.toggle()
        view?.RecipetblView.reloadData()
        if recipes[index].isSelected {
            //MARK:- Save To Core
            DataBaseManegar.sharedDB.SaveToFav(model: recipes[index])
        } else {
            //MARK:-  Delete From Core
            DataBaseManegar.sharedDB.remove(modelAt: recipes[index])
        }
    }
    
    func getRecipeData(){
        let path = "https://api.npoint.io/43427003d33f1f6b51cc"
        let req = BaseRequest(path: path)
        APIRequest.shared.getAPIData(baseRequest: req, successBlock: { (data: [RecipeModelElement]) in
            self.recipes = data
            self.view?.didGetRecipeSuccess()
        }) { (error) in
            self.view?.didGetrecipeFailed()
        }
    }
    
}
