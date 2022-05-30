//
//  BlackjackOutputView.swift
//  Blackjack
//
//  Created by 이우섭 on 2022/05/26.
//

import Foundation

struct BlackjackOutputView {
    typealias BlackjackResult = (participant: Participant, winningState: WinningState)
    
    func printStartStat(of game: Blackjack) {
        let dealer = game.dealer
        let names = game.participants
            .compactMap({ $0.name })
        
        print("\(dealer.name)와 \(names.joined(separator: ", "))에게 2장씩 나누었습니다.")
        
        printCards(of: dealer)
        game.participants.forEach {
            printCards(of: $0)
        }
        print()
    }
    
    func printCards(of player: Player, isNewLine: Bool = true) {
        let name = player.name
        let cardDescriptions = player.cards
            .compactMap({ $0.description })
        
        print("\(name)카드: \(cardDescriptions.joined(separator: ", "))", terminator: isNewLine ? "\n" : " ")
    }
    
    func printEndStat(of game: Blackjack) {
        print()
        printCardsWithScore(of: game.dealer)
        game.participants.forEach {
            printCardsWithScore(of: $0)
        }
    }
    
    func printResults(of game: Blackjack) {
        print()
        let results: [BlackjackResult] = game.participants.compactMap({
            return (participant: $0, winningState: $0.isWin(compareWith: game.dealer))
        })
        
        printDealerResult(by: results, at: game)
        results.forEach({
            print("\($0.participant.name): \( $0.winningState == .win ? "승" : "패")")
        })
        
    }
    
    private func printDealerResult(by contexts: [BlackjackResult], at game: Blackjack) {
        let dealerWinCount = contexts.filter({ $0.winningState == .defeat }).count
        let dealerDefeatCount = contexts.filter({ $0.winningState == .win }).count
        
        print("\(game.dealer.name): \(dealerWinCount)승 \(dealerDefeatCount)패 ")
    }
    
    private func printCardsWithScore(of player: Player) {
        printCards(of: player, isNewLine: false)
        print("- 결과: \(player.score)")
    }
    
    func printDealerRound(dealer: Dealer) {
        print()
        if dealer.state == .enoughCard {
            print("딜러는 16초과라 한장의 카드를 더 받지 않았습니다.")
            return
        }
        print("딜러는 16이하라 한장의 카드를 더 받았습니다.")
    }
}
