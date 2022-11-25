//
//  UIViewExtension.swift
//  InstaGrid
//
//  Created by Charlène JERENT-BELDINEAU on 25/11/2022.
//

import Foundation
import UIKit


extension UIView {
    
    // UIView can be copy in image
    func toImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0.0)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: false)
        let snapshotImageFromMyView = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return snapshotImageFromMyView!
    }
    
}
