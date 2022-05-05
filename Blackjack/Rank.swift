//
//  Rank.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/04.
//

import Foundation

enum Rank: Int, CustomStringConvertible, CaseIterable {
    case two = 2, three, four, five, six, seven, eight, nine
    case A, J, Q, K
    
    var description: String {
        switch self {
        case .A: return "A"
        case .J: return "J"
        case .Q: return "Q"
        case .K: return "K"
        default: return String(self.rawValue)
        }
    }
}

extension Rank: Comparable {
    static func <(lhs: Rank, rhs: Rank) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
