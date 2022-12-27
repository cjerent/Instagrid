//
//  BlueView.swift
//  InstaGrid
//
//  Created by Charlène JERENT-BELDINEAU on 13/11/2022.
//

import UIKit

class BlueView: UIView {
    //BlueView Square
    @IBOutlet private var topLeftSquareButton: UIButton!
    @IBOutlet private var topRightSquareButton: UIButton!
    @IBOutlet private var bottomLeftSquareButton: UIButton!
    @IBOutlet private var bottomRightSquareButton: UIButton!
    
    
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
        UIView.animate(withDuration: 0.2){
            switch style {
                case .right:
                    self.topLeftSquareButton.isHidden = false
                    self.topRightSquareButton.isHidden = false
                    self.bottomLeftSquareButton.isHidden = false
                    self.bottomRightSquareButton.isHidden = false
                case .center:
                    self.topLeftSquareButton.isHidden = false
                    self.topRightSquareButton.isHidden = false
                    self.bottomLeftSquareButton.isHidden = false
                    self.bottomRightSquareButton.isHidden = true
                case .left:
                    self.topLeftSquareButton.isHidden = false
                    self.topRightSquareButton.isHidden = true
                    self.bottomLeftSquareButton.isHidden = false
                    self.bottomRightSquareButton.isHidden = false
            }
        }
    }
    
}





