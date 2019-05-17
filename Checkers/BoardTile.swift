//
//  BoardTile.swift
//  Checkers
//
//  Created by Trevor Moore on 4/23/19.
//  Copyright © 2019 Trevor Moore. All rights reserved.
//

import UIKit

class BoardTile: UIView {

    //variables
    var status:Config.GamePieceColor = .empty;
    var moveable:Bool = false;
    var color: CGColor!;
    var x:Int = 0;
    var y:Int = 0;
    var gamePiece:GamePiece!
    var position:MatrixPosition = MatrixPosition(); //not implemented
    
    //CONSTRUCTORS START/////////////////////////////
    init(frame: CGRect, color: CGColor){
        super.init(frame: frame);
        if(color == UIColor.red.cgColor){ moveable = true; }
        else{ moveable = false;}
        self.color = color;
        drawRect(rect: frame);
    }
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    //CONSTUCTOR END////////////////////////////////
    
    //Creates the image of the tiles
    func drawRect(rect:CGRect){
        let path:UIBezierPath = UIBezierPath.init(rect: rect);
        
        let shapeLayer = CAShapeLayer();
        shapeLayer.frame = rect;
        shapeLayer.path = path.cgPath;
        shapeLayer.strokeColor = color;
        shapeLayer.fillColor = color
        self.layer.addSublayer(shapeLayer)
    }
    
    func canHoldGamePiece() -> Bool{
        if(status == .empty && moveable){ return true;}
        else {return false;}
    }
    
    //not implemented
    func setMatrixPosition(position: MatrixPosition){
        self.position = position;
    }   

}
