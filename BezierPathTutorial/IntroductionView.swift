//
//  UIIntroductionView.swift
//  BezierPathTutorial
//
//  Created by Кирилл Нескоромный on 22.08.2021.
//

import UIKit

class IntroductionView: UIView {
    override func draw(_ rect: CGRect) {
        // обрезает нижние фигуры по своему размеру
        let pathRect3 = CGRect(x: 40, y: 40, width: 120, height: 120)
        let path3 = UIBezierPath(roundedRect: pathRect3, cornerRadius: 24)
        path3.addClip()
        
        // устанавливаем границы фигуры
        let pathRect1 = CGRect(x: 0, y: 0, width: 200, height: 200)
        // создаем фигуру
        let path1 = UIBezierPath(roundedRect: pathRect1, cornerRadius: 24)
        let color1 = UIColor.red
        // задаем цвет для фигуры
        color1.setFill()
        // рисуем фигуру на вью
        path1.fill()
        
        let pathRect2 = CGRect(x: 50, y: 50, width: 100, height: 100)
        let path2 = UIBezierPath(roundedRect: pathRect2, cornerRadius: 24)
        let color2 = UIColor.green
        color2.setStroke()
        path2.stroke()
        
        
    }
    

}
