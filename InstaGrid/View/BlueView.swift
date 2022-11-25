//
//  BlueView.swift
//  InstaGrid
//
//  Created by Charlène JERENT-BELDINEAU on 13/11/2022.
//

import UIKit

class BlueView: UIView {
    @IBOutlet private var topLeft: UIView!
    @IBOutlet private var topRight: UIView!
    @IBOutlet private var bottomLeft: UIView!
    @IBOutlet private var bottomRight: UIView!
    
    
    enum Style {
        case left, center, right
    }
    
    var style: Style = .right {
        didSet {
            setStyle(style: style)
        }
    }
    
    
    /// Set blueView layout
    /// - Parameter style: Style
    private func setStyle(style: Style) {
        UIView.animate(withDuration: 0.4){
            switch style {
                case .right:
                    self.topLeft.isHidden = false
                    self.topRight.isHidden = false
                    self.bottomLeft.isHidden = false
                    self.bottomRight.isHidden = false
                case .center:
                    self.topLeft.isHidden = false
                    self.topRight.isHidden = false
                    self.bottomLeft.isHidden = false
                    self.bottomRight.isHidden = true
                case .left:
                    self.topLeft.isHidden = false
                    self.topRight.isHidden = true
                    self.bottomLeft.isHidden = false
                    self.bottomRight.isHidden = false
            }
        }
    }
    
    
}

// UIView can be copy in image
extension UIView {
    
    func toImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0.0)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: false)
        let snapshotImageFromMyView = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return snapshotImageFromMyView!
    }
    
}



