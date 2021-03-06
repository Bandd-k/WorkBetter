//
//  ProgressView.swift
//  WorkBetter
//
//  Created by Denis Karpenko on 29.03.15.
//  Copyright (c) 2015 Denis Karpenko. All rights reserved.
//

import UIKit

let NoOfGlasses = 10
let π:CGFloat = CGFloat(M_PI)

@IBDesignable class CounterView: UIView {
    
    @IBInspectable var counter: Int = 5 {
        didSet {
            if counter <=  NoOfGlasses {
                //the view needs to be refreshed
                setNeedsDisplay()
            }
        }
    }
    
    @IBInspectable var outlineColor: UIColor = UIColor.blueColor()
    @IBInspectable var counterColor: UIColor = UIColor.orangeColor()
    
    override func drawRect(rect: CGRect) {
        // 1
        let center = CGPoint(x:self.bounds.width/2, y: self.bounds.height/2)
        
        // 2
        let radius:CGFloat = max(self.bounds.width, self.bounds.height)
        
        // 3
        let arcWidth:CGFloat = 38
        
        // 4
        let startAngle:CGFloat = 3 * π / 4
        let endAngle:CGFloat = π / 4
        
        // 5
        var path = UIBezierPath(arcCenter: center,
            radius: self.bounds.width/2 - arcWidth/2,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true)
        
        // 6
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
        
        //Draw the outline
        
        //1 - first calculate the difference between the two angles
        //ensuring it is positive
        let angleDifference:CGFloat = 2 * π - startAngle + endAngle
        
        //then calculate the arc for each single glass
        let arcLengthPerGlass = angleDifference / CGFloat(NoOfGlasses)
        
        //then multiply out by the actual glasses drunk
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        //2 - draw the outer arc
        var outlinePath = UIBezierPath(arcCenter: center,
            radius: self.bounds.width/2 - 1.25,
            startAngle: startAngle,
            endAngle: outlineEndAngle,
            clockwise: true)
        
        //3 - draw the inner arc
        outlinePath.addArcWithCenter(center,
            radius: self.bounds.width/2 - arcWidth + 1.25,
            startAngle: outlineEndAngle,
            endAngle: startAngle,
            clockwise: false)
        
        //4 - close the path
        outlinePath.closePath()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = 2.5
        outlinePath.stroke()
    }
}