//
//  ViewController.swift
//  TicTacToeLocal
//
//  Created by Muhammad abduh Siregar on 13/08/18.
//  Copyright © 2018 Muhammad abduh Siregar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    
    @IBAction func btnSelectEvent(_ sender: Any) {
        let btnSelect = sender as! UIButton
        playGame(btnSelect:btnSelect)
    }
    
    var ActivePlayer = 1
    var player1 = [Int]()
    var player2 = [Int]()
    func playGame(btnSelect:UIButton){
        if ActivePlayer == 1 {
            btnSelect.setTitle("X", for: UIControlState.normal)
            btnSelect.backgroundColor = UIColor(red: 88/255, green: 231/255, blue: 51/255, alpha: 0.5)
            player1.append(btnSelect.tag)
            ActivePlayer = 2
            AutoPlay()
            print(player1)
        } else {
            btnSelect.setTitle("O", for: UIControlState.normal)
            btnSelect.backgroundColor = UIColor(red: 32/255, green: 192/255, blue: 243/255, alpha: 0.5)
            player2.append(btnSelect.tag)
            ActivePlayer = 1
            print(player2)
        }
        btnSelect.isEnabled = false
        findWinner()
    }
    
    func findWinner() {
        var winner = -1
        
        // row 1
        if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
            winner = 1
        }
        if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
            winner = 2
        }
        
        // row 2
        if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
            winner = 1
        }
        if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
            winner = 2
        }
        
        // row 3
        if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
            winner = 1
        }
        if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
            winner = 2
        }
        
        // col 1
        if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
            winner = 1
        }
        if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
            winner = 2
        }
        
        // col 2
        if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
            winner = 1
        }
        if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
            winner = 2
        }
        
        // col 3
        if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
            winner = 1
        }
        if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
            winner = 2
        }
        
        if winner != -1 {
            var msg = ""
            if winner == 1 {
                msg = "Player 1 is winner"
            } else {
                msg = "Player 2 is winner"
            }
            let alert = UIAlertController(title: "Winner", message: msg, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func AutoPlay() {
        //scan empty cells
        var emptyCells = [Int]()
        
        for index in 1...9 {
            
            if !(player1.contains(index) || player2.contains(index)){
                emptyCells.append(index)
            }
        }
        
        let randIndex = arc4random_uniform(UInt32(emptyCells.count))
        let cellID = emptyCells[Int(randIndex)]
        var btnSellect:UIButton?
        switch cellID {
        case 1:
            btnSellect = btn1
        case 2:
            btnSellect = btn2
        case 3:
            btnSellect = btn3
        case 4:
            btnSellect = btn4
        case 5:
            btnSellect = btn5
        case 6:
            btnSellect = btn6
        case 7:
            btnSellect = btn7
        case 8:
            btnSellect = btn8
        case 9:
            btnSellect = btn9
        default:
            btnSellect = btn1
        }
        playGame(btnSelect: btnSellect!)
    }
}

