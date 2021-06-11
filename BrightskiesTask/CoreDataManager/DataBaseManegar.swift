//
//  DataBaseManegar.swift
//  BrightskiesTask
//
//  Created by Ahmed on 6/11/21.
//  Copyright © 2021 eramint.com. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class DataBaseManegar{
    static let sharedDB  = DataBaseManegar()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var favRecipe = [Recipe]()
    //MARK:- Save To Core Data
    func SaveToFav(model: RecipeModelElement ){
        
        if fetchFavRecipes().contains(where: {$0.recipeID == model.id})  {
             AMToaster.toast("Recipe already added To Favourite")
            return
        }
           let favRecipe = NSEntityDescription.insertNewObject(forEntityName: "Recipe", into: context)
        favRecipe.setValue(model.name ?? "" , forKey: "recipeName")
        favRecipe.setValue(model.image ?? "" , forKey: "RecipeAvatar")
        favRecipe.setValue(model.id, forKey: "recipeID")
        favRecipe.setValue(model.headline, forKey: "recipeHeadLine")
           do{
               try context.save()
            AMToaster.toast("Saved To Favourite")
           }catch{
               print("error")
           }
       }
    //MARK:- Remove From Core Data
    func remove( modelAt : RecipeModelElement){
        guard let modelId =  modelAt.id else {return}
        let Favoitems = fetchFavRecipes()
        guard let item = Favoitems.first(where: {$0.recipeID == modelId}) else {return}
        context.delete(item)
        do
        {
            try context.save()
            AMToaster.toast("Removed From Favourite")
        }
        catch{
            debugPrint("Error Could Not save\(error.localizedDescription)")
        }
    }
    //MARK:- Fetch Core Data
    func fetchFavRecipes() -> [Recipe]{
           do{
            return try context.fetch(Recipe.fetchRequest()) as! [Recipe]
           }catch{
               return []
           }
       }
}
