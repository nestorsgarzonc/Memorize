import SwiftUI

class EmojiMemoryGame:ObservableObject {
    @Published private var model:MemorizeGame<String>
    @Published var color: Color
    private let numberOfPairOfCards = 18
    init() {
        let tempCards=EmojiRepo.getRandomRepo()
        self.model = MemorizeGame<String>(
            numberOfPairOfCards: numberOfPairOfCards,
            base: tempCards.emojis
        )
        self.color=tempCards.color
    }
    
    var cards: [MemorizeGame<String>.Card]{
        return model.cards
    }
    
    var score: Int{
        model.score
    }
    
    
    func shuffle() {
        model.shuffle()
    }
    
    func newGame(){
        let tempCards=EmojiRepo.getRandomRepo()
        self.model = MemorizeGame<String>(
            numberOfPairOfCards: numberOfPairOfCards,
            base: tempCards.emojis
        )
        self.color=tempCards.color
    }
    
    
    func chooseCard(card: MemorizeGame<String>.Card){
        model.chooseCard(card: card)
    }
}
