//
//  Helper.swift
//  Task
//
//  Created by Ahmed on 6/1/21.
//  Copyright © 2021 eramint.com. All rights reserved.
//

import Foundation
import UIKit


extension  UIViewController {

    func showAlert(withTitle title: String, withMessage message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "cancel", style: .default, handler: nil)
        alert.addAction(cancel)
        self.present(alert, animated: true)
        
    }
    
    func poshWithoutData (identifire : String) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: identifire)
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func poshWithoutDataAndAnimation (identifire : String) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: identifire)
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    func poshWithData <T:UIViewController>(identifire : String , myView : T.Type ,completion:@escaping (T?) -> Void) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: identifire) as! T?
        completion(vc)
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    func popVC () {
        navigationController?.popViewController(animated: true)
    }
    
    func present (identifire : String ) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: identifire)
        vc?.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        vc?.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        self.present(vc!,animated: true, completion: nil)
    }
    
    func dismiss () {
        dismiss(animated: true, completion: nil)
    }
    
    func changeRoot (identifire : String) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: identifire)
        self.view.window?.rootViewController = vc
    }

}

//MARK:- ICollectionView.
extension UICollectionView{
    func register<T: UICollectionViewCell>(cellType:T.Type, bundle:Bundle? = nil){
        let className = String(describing: cellType.self)
        let nib = UINib(nibName: className, bundle: bundle)
        self.register(nib, forCellWithReuseIdentifier: className)
    }
    func dequeueReusableCell<T: UICollectionViewCell>(with type:T.Type, for indexPath:IndexPath) -> T{
        let className = String(describing: type.self)
        return self.dequeueReusableCell(withReuseIdentifier: className, for: indexPath) as! T
    }
}
