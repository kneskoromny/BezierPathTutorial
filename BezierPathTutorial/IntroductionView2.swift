//
//  IntroductionView2.swift
//  BezierPathTutorial
//
//  Created by Кирилл Нескоромный on 23.08.2021.
//

import UIKit

class IntroductionView2: UIView {
    
    override func draw(_ rect: CGRect) {
        // делим исходную зону для рисования на 2 равные
//        let rect1 = CGRect(x: 0, y: 0, width: rect.width, height: rect.height / 2)
//        let rect2 = CGRect(x: 0, y: rect.height / 2, width: rect.width, height: rect.height / 2)
        let rect = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
        
//        drawCircular(in: rect1)
//        drawLines(in: rect2)
        drawCloud(in: rect)
    }
    // метод для рисования облака
    private func drawCloud(in rect: CGRect) {
        
        let point1 = CGPoint(x: rect.width * 0.1, y: rect.height * 0.6)
        let point2 = CGPoint(x: rect.width * 0.3, y: rect.height * 0.5)
        let point3 = CGPoint(x: rect.width * 0.6, y: rect.height * 0.45)
        let point4 = CGPoint(x: rect.width * 0.8, y: rect.height * 0.6)
        
        let controlPoint1 = CGPoint(x: rect.origin.x, y: rect.height * 0.4)
        let controlPoint2 = CGPoint(x: rect.width * 0.3, y: rect.height * 0.1)
        let controlPoint3 = CGPoint(x: rect.width, y: rect.height * 0.3)
        let controlPoint4 = CGPoint(x: rect.width * 0.5, y: rect.height)
        
        let path = UIBezierPath()
        
        path.move(to: point1)
        path.addQuadCurve(to: point2, controlPoint: controlPoint1)
        path.addQuadCurve(to: point3, controlPoint: controlPoint2)
        path.addQuadCurve(to: point4, controlPoint: controlPoint3)
        path.addQuadCurve(to: point1, controlPoint: controlPoint4)
        
        path.lineWidth = 3
        let color = UIColor.white
        
        color.setFill()
        path.fill()
        
    }
    //  метод для рисования окружности
    private func drawCircular(in rect: CGRect) {
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        print(center)
        let radius = (rect.width / 2) - 100
        print(radius)
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 3 * CGFloat.pi / 2, clockwise: false)
        path.lineWidth = 4
        path.lineCapStyle = .round
        let color = UIColor.green
        color.setStroke()
        path.stroke()
    }
    // метод для рисования линий
    private func drawLines(in rect: CGRect) {
        let path = UIBezierPath()
        // rect.origin.y - начало координат по у разделенного прямоугольника
        let point1 = CGPoint(x: 0, y: rect.origin.y)
        let point2 = CGPoint(x: rect.width / 2, y: rect.origin.y)
        let point3 = CGPoint(x: rect.width, y: rect.origin.y + rect.height / 2)
        
        // устанавливаем первую точку и перемещаемся в остальные
        path.move(to: point1)
        path.addLine(to: point2)
        path.addLine(to: point3)
        
        path.lineWidth = 4
        
        let color = UIColor.orange
        color.setStroke()
        path.stroke()
    }
    
}
