//
//  ViewController.swift
//  TicTacToe
//
//  Created by Nandakishor S on 03/07/19.
//  Copyright © 2019 Nandakishor S. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = TicTacToe()
    
    /*
     MAP THE BUTTONS WITH THE BOARD IS THE NEXT CHALLENGE, LETS LEARN SOME AND DO THAT ASAP!
     */
    
    @IBAction func touchBox(_ sender: UIButton){
        
        print(game.gameStatus, game.currentPlayer)
        
        let playerColors:[UIColor] = [UIColor.green, UIColor.red]

        if(game.gameCounter < 9 && game.gameStatus == 2){  // game play happens here
            if sender.currentTitle == "X" || sender.currentTitle == "O"{
                popAlert(alertTitle: "Invalid Move", alertMessage: "The block is already marked with a marker", alertActionMessage: "OK")
            }
            else{
                let playerMarker = game.playerMarkers[game.currentPlayer]
                
                let buttonPos = Int(sender.currentTitle!)! - 1
                
                game.board[buttonPos].markBlock(position: buttonPos, markedBy: game.currentPlayer) //mark the buttons in the board
                sender.setTitle(playerMarker, for: .normal)
                sender.backgroundColor = playerColors[game.currentPlayer]
                
                game.gameStatus = game.checkWin() // *** check if someone won or not ***
                
                game.currentPlayer = game.currentPlayer==0 ? 1 : 0 //currentPlayer is changed to the next player
                
                game.gameCounter += 1
            }
        }
            
        if(game.gameStatus == 1 || game.gameStatus == 0){
            popAlert(alertTitle: "Player \(game.gameStatus + 1) has won the game", alertMessage: "Start a new game to play again!", alertActionMessage: "OK")
        }
        if(game.gameStatus == 3){
            game.gameStatus = 3
            popAlert(alertTitle: "Game Tied", alertMessage: "Press play again to start a new game", alertActionMessage: "OK")
        }
        
    }
    
    func popAlert(alertTitle: String, alertMessage: String, alertActionMessage: String){
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: alertActionMessage, style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    

    @IBAction func restartGame(_ sender: UIButton) {
        game = TicTacToe()
        
        /*
         THIS FUNCTION DOES NOT WORK VERY WELL BECAUSE I DID NOT CREATE A LIST OF UIBUTTONS IN MY CODE SO THAT I CAN MANUALLY RESET THE BUTTONS.
         
         WHAT HAPPENS OVER HERE IS THAT THE CONTROLLER KNOWS HOW TO RESET THE MODEL SIDE, BUT IS INCAPABLE OF RESETTING THE VIEW SIDE WITHOUT THE LIST OF BUTTONS.
         
         =======================
                  TO-DO
         =======================
         [1] CREATE A LIST OF UIBUTTONS.
         [2] RESET THE BUTTONS TO THEIR ORIGINAL STYLE.
         */
    }
    
}

