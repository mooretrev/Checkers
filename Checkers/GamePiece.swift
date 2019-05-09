//
//  GamePiece.swift
//  Checkers
//
//  Created by Trevor Moore on 4/28/19.
//  Copyright © 2019 Trevor Moore. All rights reserved.
//

import UIKit

class GamePiece: UIView {
    var color:pieceColor = .black
  
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect, color: pieceColor) {
        super.init(frame: frame)
        self.color = color
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
