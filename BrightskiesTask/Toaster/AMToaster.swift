//
//  Toaster.swift
//  ChatBot
//
//  Created by Amr Mohamed on 8/29/18.
//  Copyright © 2018 MO4. All rights reserved.
//

import UIKit

public class AMToaster: UIView {
    @IBOutlet var textLabel: UILabel!
    
    public static func toast(_ text: String) {
        let view = AMToaster.loadFromNib()
        view.textLabel.text = text
        
        if let window = UIApplication.shared.keyWindow {
            window.subviews.first(where: {$0 is AMToaster})?.removeFromSuperview()
            window.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.leadingAnchor.constraint(greaterThanOrEqualTo: window.leadingAnchor).isActive = true
            view.trailingAnchor.constraint(lessThanOrEqualTo: window.trailingAnchor).isActive = true
            view.centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true
            if #available(iOS 11.0, *) {
                view.topAnchor.constraint(equalTo: window.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
            } else {
                // Fallback on earlier versions
            }
            
            view.transform = view.transform.translatedBy(x: 0, y: -(view.frame.height + 50))
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: [.curveEaseInOut], animations: {
                view.transform = view.transform.translatedBy(x: 0, y: (view.frame.height + 30))
            }) { (_) in
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: [.curveEaseInOut], animations: {
                        view.transform = view.transform.translatedBy(x: 0, y: -(view.frame.height + 100))
                    }) { (_) in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            view.removeFromSuperview()
                        }
                    }
                    
                }
            }
        }
    }
}
