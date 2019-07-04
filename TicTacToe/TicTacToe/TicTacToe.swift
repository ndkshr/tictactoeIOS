//
//  TicTacToe.swift
//  TicTacToe
//
//  Created by Nandakishor S on 04/07/19.
//  Copyright © 2019 Nandakishor S. All rights reserved.
//

import Foundation

class TicTacToe{
    
    var board = [Block]()
    var playerMarkers = ["X", "O"]
    var gameCounter = 0
    var currentPlayer = 0
    var gameStatus = 2 //if player 0 wins then 0, 1 if player 1 wins, 2 if noresult, 3 if game is drawn
    
    /* var playerColors = ### DID NOT PUT COLORS HERE AS I MIGHT HAVE TO IMPORT UIKIT INTO THIS FILE WHICH MIGHT BREAK THE MVC ARCHITECTURE */
    
    init(){
        for pos in 0..<9{ // initialise the board
            let block = Block(position: pos)
            board.append(block)
        }
    }
    
    func checkWin() -> Int {
        var playerWhoWon = 2
        let pM = currentPlayer
        
        // check on the diagonals
        if board[2].markedBy==pM && board[4].markedBy==pM && board[6].markedBy==pM {
            playerWhoWon = currentPlayer
        }
        
        if board[0].markedBy==pM && board[4].markedBy==pM && board[8].markedBy==pM {
            playerWhoWon = currentPlayer
        }
        
        // check the horizontal rows
        for i in 0...2{
            let left = 3 * i
            if board[left].markedBy == pM && board[left + 1].markedBy  == pM && board[left+2].markedBy == pM {
                playerWhoWon = currentPlayer
                break
            }
        }
        
        //check for the vertical columns
        for i in 0...2{
            let top = i
            if board[top].markedBy == pM && board[top + 3].markedBy  == pM && board[top+6].markedBy == pM {
                playerWhoWon = currentPlayer
                break
            }
        }
        
        if(gameCounter >= 9) {
            playerWhoWon = 3
        }
        
        return playerWhoWon
    }
    
    func resetToDefault() {
        board = [Block]()
        
        for pos in 0..<9{ // initialise the board
            let block = Block(position: pos)
            board.append(block)
        }
        
        playerMarkers = ["X", "O"]
        gameCounter = 0
        currentPlayer = 0
        gameStatus = 2
    }
}
