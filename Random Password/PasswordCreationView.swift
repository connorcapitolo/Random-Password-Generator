//
//  PasswordCreationView.swift
//  Random Password
//
//  Created by Connor Capitolo on 4/18/18.
//  Copyright © 2018 Connor Capitolo. All rights reserved.
//

import UIKit

//@IBDesignable
class PasswordCreationView: UIView {
    
//   @IBInspectable
    //the string that is displays inside the Password Creation View's view
    var removeKeyboardLabel : String = "Click blue to remove keyboard" {
        didSet {
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    
    //creates a dynamic font size for the string
    private var dynamicString: NSAttributedString {
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(constantValues.placeHolderTextSize)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        return NSAttributedString(string: removeKeyboardLabel, attributes: [.font: font,.foregroundColor:UIColor.white])
    }
    
    //delays the creation of the variable until it is needed
    private lazy var centeredLabel = createLabel()
    
    //adds the label as a subview of the Main Creation View
    private func createLabel() -> UILabel {
        let label = UILabel()
        addSubview(label)
        return label
    }
    
    //sets the string text (label) for the view
    private func configureLabel (_ label: UILabel) {
        label.attributedText = dynamicString
        label.frame.size = CGSize.zero
        label.sizeToFit()
    }
    
    //lays out the subviews of the Password Creation View
    override func layoutSubviews() {
        super.layoutSubviews()
        configureLabel(centeredLabel)
        centeredLabel.center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
    }
    
    
    //constant values
    private struct constantValues {
        static let placeHolderTextSize: CGFloat = 15.0
        
    }
    
    //called when the trait's environment changes
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setNeedsDisplay()
        setNeedsLayout()
    }
}


// Only override draw() if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 16.0)
//        roundedRect.addClip()
//        UIColor.white.setFill()
//        roundedRect.fill()
//    }
