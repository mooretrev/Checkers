//
//  Board.swift
//  Checkers
//
//  Created by Trevor Moore on 4/23/19.
//  Copyright © 2019 Trevor Moore. All rights reserved.
//

import UIKit

class Board: UIView {
    var boardTiles:[BoardTile] = [];
    
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!;
        setupBoard(frame: bounds);
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    
    func setupBoard(frame: CGRect){
        let tileSize:Double = (Double)(frame.height / 10.0);
        var row:Int = -1;
        var square:CGRect;
        var x:Int;
        var tile:BoardTile = BoardTile(frame: frame, color: UIColor.black.cgColor);
        var addToList:Bool = false;
        
        for i in 0...99 {
            square = CGRect(x: 0, y: 0, width: tileSize, height: tileSize);
            x = i % 10;
            if(x == 0){
                row = row + 1;
                
            }
            if(row % 2 == 0){
                if(i % 2 == 0){
                    tile = BoardTile(frame: square, color: UIColor.red.cgColor)
                    addToList = true;
                }else{
                    tile = BoardTile(frame: square, color: UIColor.black.cgColor)
                }
            }else{
                if(i % 2 == 0){
                    tile = BoardTile(frame: square, color: UIColor.black.cgColor)
                }else{
                    tile = BoardTile(frame: square, color: UIColor.red.cgColor)
                    addToList = true;
                }
            }
            tile.center = CGPoint(x: tile.center.x + (CGFloat)(x) * (CGFloat)(tileSize), y: tile.center.y + (CGFloat)(row) * (CGFloat)(tileSize))
            if(addToList){
                boardTiles.append(tile);
            }
            self.addSubview(tile);
         }
 
        square = CGRect(x: 0, y: 0, width: tileSize, height: tileSize);
 
        
        
        
    }

}
