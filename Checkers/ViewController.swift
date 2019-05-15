//
//  ViewController.swift
//  Checkers
//
//  Created by Trevor Moore on 4/23/19.
//  Copyright © 2019 Trevor Moore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var board: Board!
    var panGesture  = UIPanGestureRecognizer()
    var gamePiece:GamePiece = GamePiece(frame: CGRect(x: 10, y: 100, width: 200, height: 200), color: .black)
    
    override func viewDidLoad(){
        
    }
    
        
        
    
}
