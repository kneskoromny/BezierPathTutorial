//
//  IntroductionView3.swift
//  BezierPathTutorial
//
//  Created by Кирилл Нескоромный on 23.08.2021.
//

import UIKit

class IntroductionView3: UIView {

    override func draw(_ rect: CGRect) {
        let padding: CGFloat = 40
        let pathRect = CGRect(x: padding, y: padding, width: rect.width - padding * 2, height: rect.height - padding * 2)
        let path = self.starIn(rect: pathRect)
        
        UIColor.magenta.setFill()
        path.fill()
    }
    private func starIn(rect: CGRect) -> UIBezierPath {
        let path = UIBezierPath()
        // центр звезды
        let center = CGPoint(x: rect.origin.x + rect.width / 2, y: rect.origin.y + rect.height / 2)
        // кол-во лучей
        let pointsOnStar: CGFloat = 5
        // стартовый угол
        var angle = CGFloat.pi / 2
        // инкремент для увеличения угла
        let angleIncrement = CGFloat.pi * 2 / pointsOnStar
        // большой радиус для дальних точек
        let radius: CGFloat = rect.width / 2
        // малый радиус для ближних точек
        let midRadius = 0.45 * radius
        var firstPoint = true
        
        for _ in 1...Int(pointsOnStar) {
           let point = pointFrom(angle: angle, radius: midRadius, offset: center) //1
           let nextPoint = pointFrom(angle: angle + angleIncrement, radius: midRadius, offset: center) //2
           let midPoint = pointFrom(angle: angle + angleIncrement / 2.0, radius: radius, offset: center) //3
                    
           //4
           if firstPoint {
              firstPoint = false
              path.move(to: point)
           }
           //5
           path.addLine(to: midPoint)
           path.addLine(to: nextPoint)
           
           angle += angleIncrement //6
        }
        path.close() //7
        
        
        return path
    }
    private func pointFrom(angle: CGFloat, radius: CGFloat, offset: CGPoint) -> CGPoint {
       let x = radius * cos(angle) + offset.x
       let y = radius * sin(angle) + offset.y
            
       return CGPoint(x: x, y: y)
    }

}
