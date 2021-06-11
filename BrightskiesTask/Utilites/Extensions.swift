//
//  Extensions.swift
//  RecipeTask
//
//  Created by Ahmed on 6/2/21.
//  Copyright © 2021 eramint.com. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

enum Anchor<T> {
    case top
    case bottom
    case centreY
}

enum YAnchor {
    case top
    case bottom
    case centreY
}

enum XAnchor {
    case leading
    case trailing
    case centreX
}

enum Dimenssion {
    case width
    case height
}


extension UIView {
    
    func HideKeyboard() {
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Dissmiskeyboard))
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
    }
    
    @objc func Dissmiskeyboard(){
        self.endEditing(true)
    }
    
    func YAnchor(anchor:YAnchor ,view2:NSLayoutYAxisAnchor, constantNum:CGFloat,multiplierNum:CGFloat ) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // get autolayout
        var autolayout =  NSLayoutYAxisAnchor()
        switch anchor {
        case .bottom:
            autolayout = self.bottomAnchor
        case .top:
            autolayout = self.topAnchor
        case .centreY:
            autolayout = self.centerYAnchor
       
            
        }
        // calc constraint
        if constantNum == 0 && multiplierNum == 0 {
            autolayout.constraint(equalTo: view2).isActive = true
        }else  if constantNum == 0 {
            if #available(iOS 11.0, *) {
                autolayout.constraint(equalToSystemSpacingBelow: view2, multiplier: multiplierNum ).isActive = true
            } else {
                // Fallback on earlier versions
            }
        }else{
            autolayout.constraint(equalTo: view2, constant: constantNum).isActive = true
        }
        
    }
    
    func XAnchor(anchor:XAnchor ,view2:NSLayoutXAxisAnchor, constantNum:CGFloat,multiplierNum:CGFloat ) {
        
        // get autolayout
        var autolayout =  NSLayoutXAxisAnchor()
        switch anchor {
        case .trailing:
            autolayout = self.trailingAnchor
        case .leading:
            autolayout = self.leadingAnchor
        case .centreX:
            autolayout = self.centerXAnchor
          }
        // calc constraint
        if constantNum == 0 && multiplierNum == 0 {
            autolayout.constraint(equalTo: view2).isActive = true
        }else  if constantNum == 0 {
            if #available(iOS 11.0, *) {
                autolayout.constraint(equalToSystemSpacingAfter: view2, multiplier: multiplierNum).isActive = true
            } else {
                // Fallback on earlier versions
            }
        }else{
            autolayout.constraint(equalTo: view2, constant: constantNum).isActive = true
        }
        
    }
    
    func Dimenssions(anchor:Dimenssion ,second:NSLayoutDimension?, constantNum:CGFloat,multiplierNum:CGFloat ) {
        self.translatesAutoresizingMaskIntoConstraints = false
        guard let view2 = second else { return }
        
        // get autolayout
        var autolayout =  NSLayoutDimension()
        switch anchor {
        case .height:
            autolayout = self.heightAnchor
        case .width:
            autolayout = self.widthAnchor
        }
        
        // calc constraint
        if constantNum == 0 && multiplierNum == 0 {
            autolayout.constraint(equalTo: view2).isActive = true
        }else  if constantNum == 0 {
            autolayout.constraint(equalTo: view2, multiplier: multiplierNum).isActive = true
        }else{
            autolayout.constraint(equalToConstant: constantNum).isActive = true
        }
        
    }
    
    
    
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func shake() {
           AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
           let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
           animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
           animation.duration = 0.8
           animation.values = [-20, 20, -20, 20, -10, 10, -5, 5, 0]
           layer.add(animation, forKey: "shake")
       }
    
    /// loads a full view from a xib file
        static func loadFromNib() -> Self {
            func instantiateFromNib<T: UIView>() -> T {
                return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
            }
            return instantiateFromNib()
        }
    
    @IBInspectable var isCircled: Bool {
        get {
            return false
        }
        set {
            if newValue {
                self.cornerRadius = self.bounds.height / 2
            }
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor.init(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}



enum StoryboardsName:String {
    case home = "Main"
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(viewControllerClass : T.Type, function : String = #function, line : Int = #line, file : String = #file) -> T {
    
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else{
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        return scene
    }
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController{
    class var storyboardID : String {
        return "\(self)"
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: StoryboardsName) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}


extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}


enum ChooseFont:String {
    case Bold = "Cairo-Bold"
    case Regular = "Cairo-Regular"
    case Light = "Cairo-Light"
}

func CustomFont(index: ChooseFont) -> String {
    switch index {
    case .Bold:
        return "Cairo-Bold"
        
    case .Regular:
        return "Cairo-Regular"
        
    case .Light:
        return "Cairo-Light"
        
 
    }
    
}
extension UIButton {
    func initButton(title:String,titleColor :UIColor , backgroundColor:UIColor,roundValue :CGFloat, index:ChooseFont, fontSize:CGFloat , borderColor:UIColor = UIColor.clear , borderWidth :CGFloat = 0,target: Any? = nil, action: Selector? = nil )
    {
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont(name: CustomFont(index: index), size: fontSize)
        self.backgroundColor = backgroundColor
        self.setTitleColor(titleColor, for: .normal)
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = roundValue
        self.clipsToBounds = true
        
        if let action = action {
            addTarget(target, action: action, for: .touchUpInside)
        }
    }
}


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
