//
//  MatrixPosition.swift
//  Checkers
//
//  Created by Trevor Moore on 5/16/19.
//  Copyright © 2019 Trevor Moore. All rights reserved.
//

class MatrixPosition {
    var row: Int!
    var col: Int!
    let maxRows: Int = 10;
    let maxCols: Int = 10;
    var direction:Config.Direction = .notDeclared
    var jump:Bool = false
    
    init() {
        self.row = 0;
        self.col = 0;
    }
    
    init(row: Int, col: Int) {
        self.row = row
        self.col = col
    }
    
    init(row: Int, col: Int, direction: Config.Direction) {
        self.row = row
        self.col = col
        self.direction = direction
    }
    
    init(row: Int, col: Int, direction: Config.Direction, jump:Bool) {
        self.row = row
        self.col = col
        self.direction = direction
        self.jump = jump
    }

    
    func getRow() -> Int{
        return row;
    }
    
    func getCol() -> Int {
        return col;
    }
    
    func normalMoveForward() -> [MatrixPosition]{
        var possibleMoves:[MatrixPosition] = []
        if(row - 1 > -1 && col - 1 > -1){
            possibleMoves.append(MatrixPosition(row: row-1, col: col-1, direction: .left))
        }
        if(row - 2 > -1 && col - 2 > -1){
            possibleMoves.append(MatrixPosition(row: row - 2, col: col - 2, direction: .left, jump: true))
        }
        if(row - 1 > -1 && col + 1 < maxCols){
            possibleMoves.append(MatrixPosition(row: row-1, col: col+1, direction: .right))
        }
        if(row - 2 > -1 && col + 2 < maxCols){
            possibleMoves.append(MatrixPosition(row: row - 2, col: col + 2, direction: .right, jump: true))
        }
        
        return possibleMoves
    }
    
    func normalMoveBackwards() -> [MatrixPosition]{
        var possibleMoves:[MatrixPosition] = []
        if(row + 1 < maxRows && col - 1 > -1){
            possibleMoves.append(MatrixPosition(row: row+1, col: col-1, direction: .left))
        }
        if(row + 2 < maxRows && col - 2 > -1){
            possibleMoves.append(MatrixPosition(row: row + 2, col: col - 2, direction: .left, jump: true))
        }
        if(row + 1 > -1 && col + 1 < maxCols){
            possibleMoves.append(MatrixPosition(row: row+1, col: col+1, direction: .right))
        }
        if(row + 2 < maxRows && col + 2 < maxCols){
            possibleMoves.append(MatrixPosition(row: row + 2, col: col + 2, direction: .right, jump: true))
        }
        return possibleMoves
    }
    
    
    
    
}
