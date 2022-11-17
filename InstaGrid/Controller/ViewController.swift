//
//  ViewController.swift
//  InstaGrid
//
//  Created by Charlène JERENT-BELDINEAU on 01/11/2022.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Layout choice buttons
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var centerButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    // BlueView customized view
    @IBOutlet weak var blueView: BlueView!
    //BlueView buttons
    @IBOutlet var topLeftSquare: UIButton!
    @IBOutlet var topRightSquare: UIButton!
    @IBOutlet var bottomLeftSquare: UIButton!
    @IBOutlet var bottomRightSquare: UIButton!
    
    private var currentSquare: UIButton!
    
    @IBOutlet var topLeftPlus: UIButton!
    @IBOutlet var topRightPlus: UIButton!
    @IBOutlet var bottomLeftPlus: UIButton!
    @IBOutlet var bottomRightPlus: UIButton!
    
    private var currentPlus: UIButton!
    
    private var photoPickerTopLeft = UIImagePickerController()
    private var photoPickerTopRight = UIImagePickerController()
    private var photoPickerBottomLeft = UIImagePickerController()
    private var photoPickerBottomRight = UIImagePickerController()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoPickerTopLeft.delegate = self
        photoPickerTopRight.delegate = self
        photoPickerBottomLeft.delegate = self
        photoPickerBottomRight.delegate = self
    
    }
    
    
    
    /// Layout button selected
    /// - Parameter btn: left, center or right button
    private func selected(btn: UIButton) {
        UIView.animate(withDuration: 0.3){
            btn.isHighlighted = true
            btn.isSelected = true
        }
    }
    
    /// Layout button unselected
    /// - Parameters:
    ///   - btn1: left, center or right button
    ///   - btn2: left, center or right button
    private func unSelected(btn1: UIButton, btn2: UIButton){
        
        UIView.animate(withDuration: 0.3){
            btn1.isSelected = false
            btn2.isSelected = false
            btn1.isHighlighted = false
            btn2.isHighlighted = false
        }
        
    }
    
    /// Tap left layout button
    @IBAction func didTapLeftButton() {
        applyLeftLayout()
    }
    
    /// Apply left layout
    private func applyLeftLayout() {
       
        blueView.style = .left
        selected(btn: leftButton)
        unSelected(btn1: centerButton, btn2: rightButton)
        
    }
    
    /// Tap center layout button
    @IBAction func didTapCenterButton() {
        applyCenterLayout()
    }
    
    /// Apply center layout
    private func applyCenterLayout() {
        blueView.style = .center
        selected(btn: centerButton)
        unSelected(btn1: leftButton, btn2: rightButton)
        
    }
    
    /// Tap right layout button
    @IBAction func didTapRightButton() {
        applyRightLayout()
    }
    
    /// Apply right layout
    private func applyRightLayout() {
        blueView.style = .right
        selected(btn: rightButton)
        unSelected(btn1: centerButton, btn2: leftButton)
    }
    
    /// Photo picker
    /// - Parameter picker: UIImagePickerController variable
    func pickPhotos(picker: UIImagePickerController) {
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        present(picker, animated: true, completion: nil)
        
    }
    
    /// Hide plus button when image preview
    /// - Parameter button: button to hide
    func hidden(_ button : UIButton) {
        button.isHidden = true
    }
    
    /// pick top left square or left plus button
    @IBAction func pickTopLeft() {
        pickPhotos(picker: photoPickerTopLeft)
        currentSquare = topLeftSquare
        currentPlus = topLeftPlus
    }
    
    /// pick top right square or right plus button
    @IBAction func pickTopRight() {
        pickPhotos(picker: photoPickerTopRight)
        currentSquare = topRightSquare
        currentPlus = topRightPlus

    }
    
    /// pick bottom left square or bottom left plus button
    @IBAction func pickBottomLeft() {
        pickPhotos(picker: photoPickerBottomLeft)
        currentSquare = bottomLeftSquare
        currentPlus = bottomLeftPlus

    }
    
    /// pick bottom right square or bottom right plus button
    @IBAction func pickBottomRight() {
        pickPhotos(picker: photoPickerBottomRight)
        currentSquare = bottomRightSquare
        currentPlus = bottomRightPlus

    }
    

    /// Preview image
    /// - Parameters:
    ///   - picker: IUImagePickerController
    ///   - info: IUImagePickerController.infoKey
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedPhoto = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            currentSquare.imageView?.contentMode = .scaleAspectFill
            currentSquare.imageView?.clipsToBounds = true
            currentSquare.setImage(pickedPhoto, for: .normal)
            hidden(currentPlus)
        }
        
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
