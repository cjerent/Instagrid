//
//  ViewController.swift
//  InstaGrid
//
//  Created by Charlène JERENT-BELDINEAU on 01/11/2022.
//

import UIKit


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Layout choice buttons
    @IBOutlet weak private var leftButton: UIButton!
    @IBOutlet weak private var centerButton: UIButton!
    @IBOutlet weak private var rightButton: UIButton!
    
    // BlueView customized view
    @IBOutlet weak private var blueView: BlueView!
    
    //BlueView buttons
    @IBOutlet private var topLeftSquare: UIButton!
    @IBOutlet private var topRightSquare: UIButton!
    @IBOutlet private var bottomLeftSquare: UIButton!
    @IBOutlet private var bottomRightSquare: UIButton!
    private var currentSquare: UIButton!
    
    @IBOutlet private var topLeftPlus: UIButton!
    @IBOutlet private var topRightPlus: UIButton!
    @IBOutlet private var bottomLeftPlus: UIButton!
    @IBOutlet private var bottomRightPlus: UIButton!
    private var currentPlus: UIButton!
    
    private var photoPickerTopLeft = UIImagePickerController()
    private var photoPickerTopRight = UIImagePickerController()
    private var photoPickerBottomLeft = UIImagePickerController()
    private var photoPickerBottomRight = UIImagePickerController()
    
    
    @IBOutlet weak private var blueStackView: UIStackView!
    private var initialCenter: CGRect = .zero
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoPickerTopLeft.delegate = self
        photoPickerTopRight.delegate = self
        photoPickerBottomLeft.delegate = self
        photoPickerBottomRight.delegate = self
        blueStackView.center = view.center
        
        
    }
    
    
    //======================
    // MARK: - LAYOUT BUTTONS
    //======================
    
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
    @IBAction private func didTapLeftButton() {
        applyLeftLayout()
    }
    
    /// Apply left layout
    private func applyLeftLayout() {
        
        blueView.style = .left
        selected(btn: leftButton)
        unSelected(btn1: centerButton, btn2: rightButton)
        
    }
    
    /// Tap center layout button
    @IBAction private func didTapCenterButton() {
        applyCenterLayout()
    }
    
    /// Apply center layout
    private func applyCenterLayout() {
        blueView.style = .center
        selected(btn: centerButton)
        unSelected(btn1: leftButton, btn2: rightButton)
        
    }
    
    /// Tap right layout button
    @IBAction private func didTapRightButton() {
        applyRightLayout()
    }
    
    /// Apply right layout
    private func applyRightLayout() {
        blueView.style = .right
        selected(btn: rightButton)
        unSelected(btn1: centerButton, btn2: leftButton)
    }
    
    
    //======================
    // MARK: - PHOTO PICKER
    //======================
    
    
    /// pick top left square or left plus button
    @IBAction private func pickTopLeft() {
        pickPhotos(picker: photoPickerTopLeft)
        currentSquare = topLeftSquare
        currentPlus = topLeftPlus
    }
    
    /// pick top right square or right plus button
    @IBAction private func pickTopRight() {
        pickPhotos(picker: photoPickerTopRight)
        currentSquare = topRightSquare
        currentPlus = topRightPlus
        
    }
    
    /// pick bottom left square or bottom left plus button
    @IBAction private func pickBottomLeft() {
        pickPhotos(picker: photoPickerBottomLeft)
        currentSquare = bottomLeftSquare
        currentPlus = bottomLeftPlus
        
    }
    
    /// pick bottom right square or bottom right plus button
    @IBAction private func pickBottomRight() {
        pickPhotos(picker: photoPickerBottomRight)
        currentSquare = bottomRightSquare
        currentPlus = bottomRightPlus
        
    }
    
    /// Photo picker
    /// - Parameter picker: UIImagePickerController variable
    private func pickPhotos(picker: UIImagePickerController) {
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
    }
    
    /// Hide plus button when image preview
    /// - Parameter button: button to hide
    private func hidden(_ button : UIButton) {
        button.isHidden = true
    }
    
    /// Preview image
    /// - Parameters:
    ///   - picker: IUImagePickerController
    ///   - info: IUImagePickerController.infoKey
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedPhoto = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            currentSquare.imageView?.contentMode = .scaleAspectFill
            currentSquare.imageView?.clipsToBounds = true
            currentSquare.setImage(pickedPhoto, for: .normal)
            hidden(currentPlus)
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    /// Cancel picker Controller
    /// - Parameter picker: UIImagePickerController
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //======================
    // MARK: - SWIPE GESTURE
    //======================
    
    
    /// Swipe gesture portrait device orientation
    /// - Parameter sender: UISwipeGestureRecognizer
    @IBAction private func didSwipePortrait(_ sender: UISwipeGestureRecognizer) {
        if UIDevice.current.orientation.isPortrait {
            swipeAnimation()
            swipeToShare()
        }
    }
    
    /// Swipe gesture landscape device orientation
    /// - Parameter sender: UISwipeGestureRecognizer
    @IBAction private func didSwipeLandscape(_ sender:UISwipeGestureRecognizer) {
        if UIDevice.current.orientation.isLandscape {
            swipeAnimation()
            swipeToShare()
        }
    }
    
    
    /// Animation for the swipe gesture
    private func swipeAnimation(){
        if UIDevice.current.orientation.isPortrait  {
            var frame = blueStackView.frame
            frame.origin.y -= 700.0
            UIView.animate(withDuration: 0.2) {
                self.blueStackView.frame = frame
                self.blueStackView.alpha = 0
            }
            
        } else if UIDevice.current.orientation.isLandscape {
            
            initialCenter = blueStackView.frame
            var frame = blueStackView.frame
            frame.origin.x -= 700.0
            UIView.animate(withDuration: 0.2) {
                self.blueStackView.frame = frame
                self.blueStackView.alpha = 0
            }
        }
        
    }
    
    
    //======================
    // MARK: - SHARE PHOTOS
    //======================
    
    /// UIActivityViewController for swiped blueStackView
    private func swipeToShare() {
        // transform blueView in image
        let blueViewImage = blueView.toImage()
        // share blueView
        let activity = UIActivityViewController(activityItems: [blueViewImage], applicationActivities: nil)
        activity.popoverPresentationController?.sourceView = self.blueView
        present(activity, animated: true)
        activity.completionWithItemsHandler = { activity, success, items, error in
            self.reinstateBlueStackView()
        }
        
    }
    
    
    //======================
    // MARK: - SWIPE BACK AFTER SHARING
    //======================
    
    
    /// Reposisioning blueStackView after sharing
    private func reinstateBlueStackView() {
        // blueStackView is coming from the top
        if UIDevice.current.orientation.isPortrait {
            blueStackView.center.y -= 700
            reinstateAnimation()
            // blueStackView is coming from the left
        } else if UIDevice.current.orientation.isLandscape {
            blueStackView.center.x -= 700
            reinstateAnimation()
            
        }
    }
    
    
    /// Animation for repositioning the blueStackView
    private func reinstateAnimation() {
        if UIDevice.current.orientation.isPortrait  {
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6) {
                self.blueStackView.center = self.view.center
                self.blueStackView.alpha = 1
            }
            
        } else if UIDevice.current.orientation.isLandscape{
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6) {
                self.blueStackView.frame = self.initialCenter
                self.blueStackView.alpha = 1
            }
            
        }
        
    }
    
}


