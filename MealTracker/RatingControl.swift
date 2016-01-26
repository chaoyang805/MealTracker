//
//  RatingControl.swift
//  MealTracker
//
//  Created by chaoyang805 on 16/1/21.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    //MARK: Properties
    var rating = 0 {
        didSet{
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    var stars = 5
    var spacing = 5
    //MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let emptyImage = UIImage(named: "emptyStar")
        let filledImage = UIImage(named: "filledStar")
        for _ in 0..<stars {
            let button = UIButton()
            button.setImage(emptyImage, forState: .Normal)
            button.setImage(filledImage, forState: .Selected)
            button.setImage(filledImage, forState: [.Highlighted,.Selected])
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            ratingButtons.append(button)
            self.addSubview(button)
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(self.frame.size.height)
        let width = (buttonSize + spacing) * stars
        return CGSize(width: width, height: buttonSize)
    }
    
    override func layoutSubviews() {
        let buttonSize = Int(self.frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        for (index,button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        self.updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates(){

        for (index,button) in ratingButtons.enumerate() {
            button.selected = index < rating
            
        }
    }
    //MARK: Actions
    func ratingButtonTapped(button : UIButton){
        rating = ratingButtons.indexOf(button)! + 1
        self.updateButtonSelectionStates()
        
    }
    
}
