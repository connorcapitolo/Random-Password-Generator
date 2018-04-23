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
    var removeKeyboardLabel : String = "Click blue to remove keyboard" {
        didSet {
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    
    
    
    private func centerAttributedString (_ string : String) -> NSAttributedString {
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(constantValues.placeHolderTextSize)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        return NSAttributedString(string: string, attributes: [.font: font,.foregroundColor:UIColor.white])
    }
    
    private var cornerString: NSAttributedString {
        return centerAttributedString(removeKeyboardLabel)
    }
    
    private lazy var centeredLabel = createLabel()
    
    private func createLabel() -> UILabel {
        let label = UILabel()
        addSubview(label)
        return label
    }
    
    private func configureLabel (_ label: UILabel) {
        label.attributedText = cornerString
        label.frame.size = CGSize.zero
        label.sizeToFit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureLabel(centeredLabel)
        centeredLabel.center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
    }
    
    
    private struct constantValues {
        static let placeHolderTextSize: CGFloat = 15.0
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setNeedsDisplay()
        setNeedsLayout()
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 16.0)
//        roundedRect.addClip()
//        UIColor.white.setFill()
//        roundedRect.fill()
//    }
    

}
