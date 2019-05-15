//
//  GamePiece.swift
//  Checkers
//
//  Created by Trevor Moore on 4/28/19.`
//  Copyright © 2019 Trevor Moore. All rights reserved.
//

import UIKit

class GamePiece: UIView {
    var color:UIColor = UIColor.black;
    var panGesture  = UIPanGestureRecognizer()
    
    enum gamePieceColor {
        case black
        case red
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect, color: gamePieceColor) {
        super.init(frame: frame)
        if(color == .black){
            self.color = UIColor.blue;
        }else{
            self.color = UIColor.yellow;
        }
        drawPiece(rect: frame)
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(GamePiece.action(_:)))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(panGesture)
        
    }
    
    @objc func action(_ sender:UIPanGestureRecognizer){
        let translation = sender.translation(in: self)
        self.center = CGPoint(x: self.center.x + translation.x, y: self.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self)
    }

    
    
    func drawPiece(rect:CGRect){
        let path = UIBezierPath(arcCenter: rect.origin, radius: rect.height / 2, startAngle: 0, endAngle: 360, clockwise: true)
        
        let shapeLayer = CAShapeLayer();
        shapeLayer.frame = rect;
        
        // The Bezier path that we made needs to be converted to
        // a CGPath before it can be used on a layer.
        shapeLayer.path = path.cgPath;
        
        // apply other properties related to the path
        shapeLayer.strokeColor = color.cgColor;
        shapeLayer.fillColor = color.cgColor
        shapeLayer.lineWidth = 1.0
        
        // add the new layer to our custom view
        self.layer.addSublayer(shapeLayer)
        
    }
   

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
