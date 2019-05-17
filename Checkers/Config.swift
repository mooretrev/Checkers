//
//  Config.swift
//  Checkers
//
//  Created by Trevor Moore on 5/15/19.
//  Copyright © 2019 Trevor Moore. All rights reserved.
//

//this class holds the enum so I don't have trouble remembering where it is
class Config {
    
    enum GamePieceColor {
        case black
        case red
        case empty // used in the boardTile class
    }
    
    enum Direction:Int {
        case left = -1;
        case right = 1;
        case notDeclared = 0;
    }

}
