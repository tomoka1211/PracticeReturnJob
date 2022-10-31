//
//  UIView+.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/18.
//

import UIKit
import Foundation

extension UIView {
    func borders(for edges: [UIRectEdge], width: CGFloat = 1, color: UIColor = .white) {
        
        if edges.contains(.all) {
            layer.borderWidth = width
            layer.borderColor = color.cgColor
        } else {
            let allSpecificBorders: [UIRectEdge] = [.top, .bottom, .left, .right]
            
            for edge in allSpecificBorders {
                if let v = viewWithTag(Int(edge.rawValue)) {
                    v.removeFromSuperview()
                }
                
                if edges.contains(edge) {
                    let v = UIView()
                    v.tag = Int(edge.rawValue)
                    v.backgroundColor = color
                    v.translatesAutoresizingMaskIntoConstraints = false
                    addSubview(v)
                    
                    var horizontalVisualFormat = "H:"
                    var verticalVisualFormat = "V:"
                    
                    switch edge {
                    case UIRectEdge.bottom:
                        horizontalVisualFormat += "|-(0)-[v]-(0)-|"
                        verticalVisualFormat += "[v(\(width))]-(0)-|"
                    case UIRectEdge.top:
                        horizontalVisualFormat += "|-(0)-[v]-(0)-|"
                        verticalVisualFormat += "|-(0)-[v(\(width))]"
                    case UIRectEdge.left:
                        horizontalVisualFormat += "|-(0)-[v(\(width))]"
                        verticalVisualFormat += "|-(0)-[v]-(0)-|"
                    case UIRectEdge.right:
                        horizontalVisualFormat += "[v(\(width))]-(0)-|"
                        verticalVisualFormat += "|-(0)-[v]-(0)-|"
                    default:
                        break
                    }
                    
                    self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalVisualFormat, options: .directionLeadingToTrailing, metrics: nil, views: ["v": v]))
                    self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalVisualFormat, options: .directionLeadingToTrailing, metrics: nil, views: ["v": v]))
                }
            }
        }
    }
    
    func setCornersRadius(
        shadowColor: UIColor = .clear,
        offSet: CGSize = .zero,
        opacity: Float = 0.0,
        shadowRadius: CGFloat = 0.0,
        fillColor: UIColor = .white,
        radius: CGFloat,
        roundingCorners: UIRectCorner) {
            layer.sublayers?.forEach { calayer in
                if calayer.name == "shadowLayer" || calayer.name == "boardLayer" {
                    calayer.removeFromSuperlayer()
                }
            }
            let shadowLayer = CAShapeLayer()
            let size = CGSize(width: radius, height: radius)
            let cgPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: roundingCorners, cornerRadii: size).cgPath // 1
            shadowLayer.path = cgPath
            shadowLayer.name = "shadowLayer"
            shadowLayer.fillColor = fillColor.cgColor
            
            if opacity > 0 {
                shadowLayer.shadowColor = shadowColor.cgColor
                shadowLayer.shadowPath = cgPath
                shadowLayer.shadowOffset = offSet
                shadowLayer.shadowOpacity = opacity
                shadowLayer.shadowRadius = shadowRadius
                layer.insertSublayer(shadowLayer, below: subviews.isEmpty ? layer : subviews[0].layer)
            } else {
                layer.mask = shadowLayer
            }
        }
    
    func setBoard(radius: CGFloat, roundingCorners: UIRectCorner, boardWidth: CGFloat = 0, boardColor: CGColor = UIColor.white.cgColor) {
        let size = CGSize(width: radius, height: radius)
        let cgPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: roundingCorners, cornerRadii: size).cgPath // 1
        let boardLayer = CAShapeLayer()
        boardLayer.name = "boardLayer"
        boardLayer.lineCap = CAShapeLayerLineCap.square
        boardLayer.lineWidth = boardWidth
        boardLayer.strokeColor = boardColor
        boardLayer.fillColor = UIColor.clear.cgColor
        boardLayer.frame = bounds
        boardLayer.path = cgPath
        layer.addSublayer(boardLayer)
    }
    
    func parentViewController() -> UIViewController? {
        var parentResponder: UIResponder? = self
        while true {
            guard let nextResponder = parentResponder?.next else { return nil }
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            parentResponder = nextResponder
        }
    }
    
    func parentView<T: UIView>(type: T.Type) -> T? {
        var parentResponder: UIResponder? = self
        while true {
            guard let nextResponder = parentResponder?.next else { return nil }
            if let view = nextResponder as? T {
                return view
            }
            parentResponder = nextResponder
        }
    }
}
