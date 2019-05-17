//
//  Board.swift
//  Checkers
//
//  Created by Trevor Moore on 4/23/19.
//  Copyright © 2019 Trevor Moore. All rights reserved.
//

import UIKit

class Board: UIView {
    static var tiles:[[BoardTile]] = Array(repeating: Array(repeating: BoardTile(frame: CGRect(x: 0, y: 0, width: 10, height: 10), color: UIColor.black.cgColor), count: 10), count: 10) //this holds the tiles that a game can move to
    var tileSize:Double!
    
    //Constructor
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!;
        tileSize = (Double)(bounds.height / 10.0);
        setupBoard()
        addGamePieces()
    }
    
    
    //Places the titles on the board and get the tiles the game pieces can move to
    func setupBoard(){
        var row:Int = -1;
        var square:CGRect;
        var col:Int;
        var tile:BoardTile = BoardTile(frame: bounds, color: UIColor.black.cgColor);
        
        for i in 0...99 {
            square = CGRect(x: 0, y: 0, width: tileSize, height: tileSize);
            col = i % 10;
            if(col == 0){
                row = row + 1;
                
            }
            if(row % 2 == 0){
                if(i % 2 == 0){
                    tile = BoardTile(frame: square, color: UIColor.red.cgColor)
                }else{
                    tile = BoardTile(frame: square, color: UIColor.black.cgColor)
                }
            }else{
                if(i % 2 == 0){
                    tile = BoardTile(frame: square, color: UIColor.black.cgColor)
                }else{
                    tile = BoardTile(frame: square, color: UIColor.red.cgColor)
                }
            }
            tile.center = CGPoint(x: tile.center.x + (CGFloat)(col) * (CGFloat)(tileSize), y: tile.center.y + (CGFloat)(row) * (CGFloat)(tileSize))
            Board.tiles[row][col] = tile;
            self.addSubview(tile);
         }
        square = CGRect(x: 0, y: 0, width: tileSize, height: tileSize);
    }
    
    //This adds the pieces to the Board
    func addGamePieces(){
        for r in 0...2{
            for c in 0...9{
                if(Board.tiles[r][c].moveable){
                    
                    let gamePiece:GamePiece = BlackGamePiece(frame: CGRect(x: 0, y: 0, width: tileSize, height: tileSize), position: MatrixPosition(row: r, col: c))
                    gamePiece.center = Board.tiles[r][c].center
                    Board.tiles[r][c].status = .black
                    Board.tiles[r][c].gamePiece = gamePiece
                    addSubview(gamePiece)
                }
            }
        }
        
        for r in 7...9{
            for c in 0...9{
                if(Board.tiles[r][c].moveable){
                    let gamePiece:GamePiece = RedGamePiece(frame: CGRect(x: 0, y: 0, width: tileSize, height: tileSize), position: MatrixPosition(row: r, col: c))
                    gamePiece.center = Board.tiles[r][c].center
                    Board.tiles[r][c].status = .red
                    Board.tiles[r][c].gamePiece = gamePiece
                    addSubview(gamePiece)
                }
            }
        }
        
    }

}
