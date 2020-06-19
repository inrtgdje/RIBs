//
//  ScoreStream.swift
//  TicTacToe
//
//  Created by 汤天明 on 6/19/20.
//  Copyright © 2020 Uber. All rights reserved.
//


import RxSwift
import RxRelay
struct Score {
    let player1Score: Int
    let player2Score: Int
    
    static func equals(lhs: Score,rhs: Score) -> Bool {
        return lhs.player1Score == rhs.player1Score && lhs.player2Score == rhs.player2Score
    }
}

protocol  ScoreStream: class {
    var score: Observable<Score> {get}
}

protocol MutableScoreSteam:ScoreStream {
    func updateScore(withWinner winner:PlayerType)
}


class ScoreSteamImpl:MutableScoreSteam {
    
    
    private let variable = BehaviorRelay<Score>(value: Score(player1Score: 0, player2Score: 0))
    var score: Observable<Score> {
        return variable.asObservable().distinctUntilChanged { (lhs:Score, rhs: Score) -> Bool in
            Score.equals(lhs: lhs, rhs: rhs)
        }
    }
    
    func updateScore(withWinner winner: PlayerType) {
        
        let newScore: Score = {
            let currentScore = variable.value
            switch winner {
                
            case .player1:
                return Score(player1Score: currentScore.player1Score + 1, player2Score: currentScore.player2Score)
            case .player2:
                return Score(player1Score: currentScore.player1Score, player2Score: currentScore.player2Score + 1)
            }
        }()
        
        variable.accept(newScore)
    }
    
}
