//
//  IBDesignableView.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/18.
//

import Foundation
import UIKit
import QuartzCore

@IBDesignable open class IBDesignableView: UIView {
    var roundingCorners: UIRectCorner = [.topLeft, .topRight, .bottomRight, .bottomLeft]
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        if shadowOpacity > 0 {
            setCornersRadius(
                shadowColor: shadowColor,
                offSet: shadowOffset,
                opacity: shadowOpacity,
                shadowRadius: CGFloat(shadowRadius),
                fillColor: fillColor,
                radius: cornerRadius,
                roundingCorners: roundingCorners)
        } else {
            setCornersRadius(radius: cornerRadius, roundingCorners: roundingCorners)
        }
        
        if let borderColor = borderColor {
            setBoard(
                radius: cornerRadius,
                roundingCorners: roundingCorners,
                boardWidth: CGFloat(borderWidth),
                boardColor: borderColor.cgColor)
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0
    
    @IBInspectable var borderWidth: Double = 0.0
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            if let color = borderColor {
                setBoard(
                    radius: cornerRadius,
                    roundingCorners: roundingCorners,
                    boardWidth: CGFloat(borderWidth),
                    boardColor: color.cgColor)
            }
        }
    }
    
    @IBInspectable var fillColor: UIColor = .clear
    
    @IBInspectable var shadowColor: UIColor = .clear
    
    @IBInspectable var shadowOpacity: Float = 0.0
    
    @IBInspectable var shadowOffset: CGSize = .zero
    
    @IBInspectable var shadowRadius: Double = 0.0
}

private let animationDuration: TimeInterval = 1.0
private let deleyTime: TimeInterval = 0
private let springDamping: CGFloat = 0.25
private let lowSpringDamping: CGFloat = 0.50
private let springVelocity: CGFloat = 8.00

extension IBDesignableView {
    //MARK:- Default Animation here
    func AnimateView() {
        provideAnimation(animationDuration: animationDuration, deleyTime: deleyTime, springDamping: springDamping, springVelocity: springVelocity)
    }
    
    //MARK:- Custom Animation here
    func AnimateViewWithSpringDuration(_ name: UIView, animationDuration: TimeInterval, springDamping: CGFloat, springVelocity: CGFloat) {
        provideAnimation(animationDuration: animationDuration, deleyTime: deleyTime, springDamping: springDamping, springVelocity: springVelocity)
    }
    
    //MARK:- Low Damping Custom Animation here
    func AnimateViewWithSpringDurationWithLowDamping(_ name: UIView, animationDuration: TimeInterval, springVelocity: CGFloat) {
        provideAnimation(animationDuration: animationDuration, deleyTime: deleyTime, springDamping: lowSpringDamping, springVelocity: springVelocity)
    }
    
    private func provideAnimation(animationDuration: TimeInterval, deleyTime: TimeInterval, springDamping: CGFloat, springVelocity: CGFloat) {
        self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: animationDuration,
                       delay: deleyTime,
                       usingSpringWithDamping: springDamping,
                       initialSpringVelocity: springVelocity,
                       options: .allowUserInteraction,
                       animations: {
                        self.transform = CGAffineTransform.identity
        })
    }
}
