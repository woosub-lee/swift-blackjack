//
//  BlackjackTest.swift
//  BlackjackTest
//
//  Created by 이우섭 on 2022/05/26.
//

import XCTest

class BlackjackTest: XCTestCase {
    func test_블랙잭에_참가자가_참가() {
        let participantNames: [String] = ["sut1", "sut2"]
        let blackjack = Blackjack(participantNames: participantNames)
        
        let expected: Int = 2
        
        XCTAssertEqual(blackjack.participants.count, expected)
    }
    
    func test_블랙잭이_시작할때_참가자에게_카드_두개를_분배() {
        let participantNames = ["sut1"]
        var blackjack = Blackjack(participantNames: participantNames)
        try? blackjack.start()
        
        let participant = blackjack.participants.first!
        let expected: Int = 2
        
        XCTAssertEqual(participant.cards.count, expected)
    }
    
    func test_블랙잭_시작후_한라운드를_더_진행할_시_카드는_3개여야한다() {
        let participantNames = ["sut1"]
        var blackjack = Blackjack(participantNames: participantNames)
        var participant = blackjack.participants.first!
        
        try? blackjack.start()
        blackjack.playOneMoreRound(participant: participant)
        
        let expected: Int = 3
        
        XCTAssertEqual(participant.cards.count, expected)
    }
}
