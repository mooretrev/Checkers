//
//  BlackGamePiece.swift
//  Checkers
//
//  Created by Trevor Moore on 5/16/19.
//  Copyright © 2019 Trevor Moore. All rights reserved.
//
import UIKit

class BlackGamePiece : GamePiece {
    static var finished: Bool = false;
    
    init(frame: CGRect, position: MatrixPosition) {
        super.init(frame: frame, color: .black, position: position)
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    override func moveType() -> [MatrixPosition] {
        return matrixPosition.normalMoveBackwards()
    }
    
    override func gamePieceJumped(position: MatrixPosition, direction: Config.Direction) {
        Board.tiles[position.row + 1][position.col + direction.rawValue].gamePiece.deleteGamePiece()
        Board.tiles[position.row + 1][position.col + direction.rawValue].status = .empty
    }
    
    override func confirmLegalJump(jump position: MatrixPosition) -> Bool{
        return Board.tiles[position.row - 1][position.col - position.direction.rawValue].status == .red
    }
    
    override func changeTurn() {
        RedGamePiece.finished = false
        BlackGamePiece.finished = true
    }
    
    override func isTurn() -> Bool {
        return !BlackGamePiece.finished
    }
    
    
}
