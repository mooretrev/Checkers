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
    var status:Config.GamePieceColor = .black;
    var matrixPosition:MatrixPosition = .init();
    var start:CGPoint!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(frame: CGRect, color: Config.GamePieceColor, position: MatrixPosition) {
        status = color;
        self.matrixPosition = position
        super.init(frame: frame)
        if(color == .black){
            self.color = UIColor.blue;
        }else{
            self.color = UIColor.yellow;
        }
        drawPiece(rect: frame)
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(GamePiece.action(_:)))
        panGesture.maximumNumberOfTouches = 1
        panGesture.minimumNumberOfTouches = 1
        panGesture.cancelsTouchesInView = false
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(panGesture)
        
    }
    
    @objc func action(_ sender:UIPanGestureRecognizer){
        let translation = sender.translation(in: self)
        self.center = CGPoint(x: self.center.x + translation.x, y: self.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self)
        //print(panGesture.state.rawValue)
    }

    //Draw the game piece
    func drawPiece(rect:CGRect){
        
        let path = UIBezierPath(arcCenter: CGPoint(x: rect.midX , y: rect.midY) , radius: rect.height / 2 - 2.5, startAngle: 0, endAngle: 360, clockwise: true)
        
        let shapeLayer = CAShapeLayer();
        shapeLayer.frame = rect;
        shapeLayer.path = path.cgPath;
        shapeLayer.strokeColor = color.cgColor;
        shapeLayer.fillColor = color.cgColor
        self.layer.addSublayer(shapeLayer)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        start = center
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        determineValueMove()
    }
    
    func determineValueMove(){
        let possiblePosition:[MatrixPosition] = moveType()
        for i in possiblePosition{
            if(Board.tiles[i.row][i.col].canHoldGamePiece()){
                if(i.jump){
                    if(confirmLegalJump(jump: i)){
                        gamePieceJumped(position: matrixPosition, direction: i.direction)
                    }else {break}
                }
                center = Board.tiles[i.row][i.col].center
                Board.tiles[matrixPosition.row][matrixPosition.col].status = .empty
                Board.tiles[i.row][i.col].status = self.status
                Board.tiles[i.row][i.col].gamePiece = self
                matrixPosition = i
                return
            }
        }
        center = start
    }
    func determinePlacedWithinTile(tile: BoardTile) -> Bool{
        if(center.x >= tile.frame.minX && center.x <= tile.frame.maxX && center.y >= tile.frame.minY && center.y <= tile.frame.maxY){return true}
        else{return false}
    }
    
    
    /////OVERRIDE FUNCTIONS///////////////////////START
    func confirmLegalJump(jump position: MatrixPosition) -> Bool{
        fatalError("Cannot create an instance of GamePiece use subclasses")
    }
    
    func gamePieceJumped(position: MatrixPosition, direction: Config.Direction){
        fatalError("Cannot create an instance of GamePiece use subclasses")
    }
    
    func deleteGamePiece(){
        isHidden = true
    }
    
    func moveType()->[MatrixPosition]{
        fatalError("Cannot create an instance of GamePiece use subclasses")
    }
    /////OVERRIDE FUNCTIONS///////////////////////END

}
