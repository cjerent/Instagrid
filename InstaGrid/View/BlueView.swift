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
    
    private func setStyle(style: Style) {
        switch style {
            case .right:
                topLeft.isHidden = false
                topRight.isHidden = false
                bottomLeft.isHidden = false
                bottomRight.isHidden = false
            case .center:
                topLeft.isHidden = false
                topRight.isHidden = false
                bottomLeft.isHidden = false
                bottomRight.isHidden = true
            case .left:
                topLeft.isHidden = false
                topRight.isHidden = true
                bottomLeft.isHidden = false
                bottomRight.isHidden = false
                
        }
    }
    
}
