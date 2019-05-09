//
//  BoardTile.swift
//  Checkers
//
//  Created by Trevor Moore on 4/23/19.
//  Copyright © 2019 Trevor Moore. All rights reserved.
//

import UIKit

class BoardTile: UIView {
    
    enum tileStatus{
        case empty
        case hasRedTile
        case hasBlackTile
    }

    var color: CGColor!;
    var hasPiece:Bool!;
    var x:Int = 0;
    var y:Int = 0;
    
    
    init(frame: CGRect, color: CGColor){
        super.init(frame: frame);
        self.color = color;
        hasPiece = false;
        drawRect(rect: frame);
        
        
    }
    
    init(coder aDecoder: NSCoder, color: CGColor){
        super.init(coder: aDecoder)!;
        self.color = color;
        hasPiece = false;
        drawRect(rect: frame);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        drawRect(rect: frame);
        backgroundColor = UIColor.yellow;
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    func drawRect(rect:CGRect){
        let path:UIBezierPath = UIBezierPath.init(rect: rect);
        
        let shapeLayer = CAShapeLayer();
        shapeLayer.frame = rect;
        
        // The Bezier path that we made needs to be converted to
        // a CGPath before it can be used on a layer.
        shapeLayer.path = path.cgPath;
        
        // apply other properties related to the path
        shapeLayer.strokeColor = color;
        shapeLayer.fillColor = color
        shapeLayer.lineWidth = 1.0
        
        // add the new layer to our custom view
        self.layer.addSublayer(shapeLayer)
        
    }    

}
