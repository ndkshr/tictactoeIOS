//
//  Block.swift
//  TicTacToe
//
//  Created by Nandakishor S on 04/07/19.
//  Copyright © 2019 Nandakishor S. All rights reserved.
//

import Foundation

struct Block
{
    var isMarked = false // if the block is marked by any user or not
    var markedBy = 2   // which user marked the block with his marker
    var position: Int  // the position of the block on the board
    
    init(position atIndex: Int) {
        position = atIndex
    }
    
    mutating func markBlock(position atIndex: Int, markedBy player: Int){
        self.position = atIndex
        self.markedBy = player
        self.isMarked = true
    }
}
