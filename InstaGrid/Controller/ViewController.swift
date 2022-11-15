//
//  ViewController.swift
//  InstaGrid
//
//  Created by Charlène JERENT-BELDINEAU on 01/11/2022.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var leftButton: UIButton!
    
    @IBOutlet weak var centerButton: UIButton!
    
    @IBOutlet weak var rightButton: UIButton!
    
    @IBOutlet weak var blueView: BlueView!
    


    @IBOutlet weak var photoPreview: UIImageView?

    private var photoPicker = UIImagePickerController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoPicker.delegate = self
        

        
    }
    
    private func selected(btn: UIButton) {
        UIView.animate(withDuration: 0.3){
            btn.isHighlighted = true
            btn.isSelected = true
        }
    }
    
    private func unSelected(btn1: UIButton, btn2: UIButton){
        
        UIView.animate(withDuration: 0.3){
            btn1.isSelected = false
            btn2.isSelected = false
            btn1.isHighlighted = false
            btn2.isHighlighted = false
        }
        
    }
    
    @IBAction func didTapLeftButton() {
        applyLeftLayout()
    }
    
    private func applyLeftLayout() {
        blueView.style = .left
        selected(btn: leftButton)
        unSelected(btn1: centerButton, btn2: rightButton)
        
    }
    
    @IBAction func didTapCenterButton() {
        applyCenterLayout()
    }
    
    private func applyCenterLayout() {
        blueView.style = .center
        selected(btn: centerButton)
        unSelected(btn1: leftButton, btn2: rightButton)
        
    }
    
    @IBAction func didTapRightButton() {
        applyRightLayout()
    }
    
    private func applyRightLayout() {
        blueView.style = .right
        selected(btn: rightButton)
        unSelected(btn1: centerButton, btn2: leftButton)
    }
    
    @IBAction func pickPhotos(_ sender: UIButton){
            photoPicker.sourceType = .photoLibrary
            photoPicker.allowsEditing = false
            present(photoPicker, animated: true, completion: nil)

    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedPhoto = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photoPreview?.contentMode = .scaleAspectFill
            photoPreview?.clipsToBounds = true
            photoPreview?.image = pickedPhoto
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
