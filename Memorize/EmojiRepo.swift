import Foundation
import SwiftUI

struct EmojiRepo {
    let emojis:[String]
    let color: Color
    
    static private let emojisRepo0 = EmojiRepo(
        emojis: ["🎃","🎄","🎆","🎇","🧨","✨","🎈"],
        color: .red
        )
    static private let emojisRepo1 = EmojiRepo(
        emojis: ["🎉","🎊","🎋","🎍","🎎","🎏","🎐"],
        color: .orange
        )
    
    static private let emojisRepo2 = EmojiRepo(
        emojis: ["⚾","🎾","🥏","🎳","🏏","🏑","🏒"],
        color: .yellow
        )
    
    static private let emojisRepo3 = EmojiRepo(
        emojis: ["🎖️","🏆","🏅","🥇","🥈","🥉","⚽",],
        color: .blue
    )
    
    static private let emojis=[
        emojisRepo0,
        emojisRepo1,
        emojisRepo2,
        emojisRepo3,
    ]
    
    static func getRandomRepo()-> EmojiRepo{
        return emojis.randomElement() ?? emojisRepo0
    }
}
