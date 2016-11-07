//
//  Bean.swift
//  ZombieConga
//
//  Created by qiuhong on 07/11/2016.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit

class Bean: UIView {

    var color: UIColor!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        let shapeTypeRandom = Int(arc4random_uniform(4))
        let colorRandom = Int(arc4random_uniform(9))
        
        switch colorRandom {
        case 0:
            color = UIColor.colorFromRGB(rgbValue: 0xF937D0, alpha: 1)
        case 1:
            color = UIColor.colorFromRGB(rgbValue: 0xFF9A36, alpha: 1)
        case 2:
            color = UIColor.colorFromRGB(rgbValue: 0xFE5832, alpha: 1)
        case 3:
            color = UIColor.colorFromRGB(rgbValue: 0x2AA0C5, alpha: 1)
        case 4:
            color = UIColor.colorFromRGB(rgbValue: 0x62DA25, alpha: 1)
        case 5:
            color = UIColor.colorFromRGB(rgbValue: 0xFC2E3A, alpha: 1)
        case 6:
            color = UIColor.colorFromRGB(rgbValue: 0xCDDC2C, alpha: 1)
        case 7:
            color = UIColor.colorFromRGB(rgbValue: 0x00C47D, alpha: 1)
        case 8:
            color = UIColor.colorFromRGB(rgbValue: 0x6793FF, alpha: 1)
        default:
            color = UIColor.colorFromRGB(rgbValue: 0xFC2E3A, alpha: 1)
        }
        
        switch shapeTypeRandom {
        case 0:
            drawPentagon(rect)
        case 1:
            drawTriangle(rect)
        case 2:
            drawRhombus(rect)
        case 3:
            drawHexagonalShape(rect)
        default:
            drawTriangle(rect)
        }
        
    }
    
    func drawPentagon(_ rect: CGRect) {
        // 五边形
        let polygonPath = UIBezierPath()
        polygonPath.move(to: CGPoint(x: 9 / 18 * rect.width, y: 0))
        polygonPath.addLine(to: CGPoint(x: 17.56 / 18 * rect.width, y: 6.22 / 18 * rect.width))
        polygonPath.addLine(to: CGPoint(x: 14.29 / 18 * rect.width, y: 16.28 / 18 * rect.width))
        polygonPath.addLine(to: CGPoint(x: 3.71 / 18 * rect.width, y: 16.28 / 18 * rect.width))
        polygonPath.addLine(to: CGPoint(x: 0.44 / 18 * rect.width, y: 6.22 / 18 * rect.width))
        polygonPath.close()
        color.setFill()
        polygonPath.fill()
    }
    
    func drawTriangle(_ rect: CGRect) {
        // 三角形
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 9 / 18 * rect.width, y: 1 / 18 * rect.width))
        bezierPath.addCurve(to: CGPoint(x: 0, y: 16 / 18 * rect.width), controlPoint1: CGPoint(x: 1 / 18 * rect.width, y: 16 / 18 * rect.width), controlPoint2: CGPoint(x: 0, y: 16 / 18 * rect.width))
        bezierPath.addLine(to: CGPoint(x: 18 / 18 * rect.width, y: 16 / 18 * rect.width))
        color.setFill()
        bezierPath.fill()
    }

    func drawRhombus(_ rect: CGRect) {
        //菱形
        let context = UIGraphicsGetCurrentContext()!
        context.saveGState()
        context.translateBy(x: 0.01 / 18 * rect.width, y: 8.99 / 18 * rect.width)
        context.rotate(by: -45 * CGFloat(M_PI) / 180)
        let rectanglePath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 12.71 / 18 * rect.width, height: 12.74 / 18 * rect.width))
        color.setFill()
        rectanglePath.fill()
        context.restoreGState()
    }
    
    func drawHexagonalShape(_ rect: CGRect) {
        //六边形
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: 8.75 / 18 * rect.width, y: 0.5 / 18 * rect.width))
        bezier2Path.addCurve(to: CGPoint(x: 0.5 / 18 * rect.width, y: 4.51 / 18 * rect.width), controlPoint1: CGPoint(x: 8.75 / 18 * rect.width, y: 0.95 / 18 * rect.width), controlPoint2: CGPoint(x: 0.5 / 18 * rect.width, y: 4.51 / 18 * rect.width))
        bezier2Path.addLine(to: CGPoint(x: 0.5 / 18 * rect.width, y: 12.99 / 18 * rect.width))
        bezier2Path.addLine(to: CGPoint(x: 8.75 / 18 * rect.width, y: 17 / 18 * rect.width))
        bezier2Path.addLine(to: CGPoint(x: 17 / 18 * rect.width, y: 12.99 / 18 * rect.width))
        bezier2Path.addLine(to: CGPoint(x: 17 / 18 * rect.width, y: 4.51 / 18 * rect.width))
        bezier2Path.addLine(to: CGPoint(x: 8.48 / 18 * rect.width, y: 0.5 / 18 * rect.width))
        bezier2Path.addLine(to: CGPoint(x: 8.48 / 18 * rect.width, y: 0.5 / 18 * rect.width))
        color.setFill()
        bezier2Path.fill()
    }
    
    
}
