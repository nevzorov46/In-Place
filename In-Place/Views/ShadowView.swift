//
//  ShadowView.swift
//  In-Place
//
//  Created by Иван Карамазов on 25.05.2021.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        self.layer.masksToBounds = cornerRadius > 0
    }

    @IBInspectable var useDefaultRadius: Bool = true {
        didSet {
            self.layer.masksToBounds = cornerRadius > 0
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            self.layer.cornerRadius = newValue

        }
        get {
            if (useDefaultRadius) {
                    // Set default radius
                    self.layer.cornerRadius = 23
                }

            return self.layer.cornerRadius
        }
    }

    @IBInspectable var addShadow:Bool = true{

        didSet(newValue) {
            if(newValue == true){
                self.layer.masksToBounds = false
                self.layer.shadowColor = UIColor.black.cgColor
                self.layer.shadowOpacity = 0.5
                self.layer.shadowOffset = CGSize(width: 2, height: 3)
                self.layer.shadowRadius = 3

                self.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
                self.layer.shouldRasterize = true
                self.layer.rasterizationScale =  UIScreen.main.scale
                print("trying to use shadow")
            }
        }

    }


}
