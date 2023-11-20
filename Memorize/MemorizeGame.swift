import Foundation

struct MemorizeGame<CardContent> where CardContent:Equatable, CardContent: Hashable {
    private(set) var cards: [Card]
    var score=0
    
    static func createGameCards(numberOfPairOfCards: Int?, base: [CardContent]) -> [Card]{
        var newCards = base
        let numOfPairOfCards = min(base.count, numberOfPairOfCards ?? base.count)
        newCards.shuffle()
        var cards:[Card] = []
        newCards[0..<numOfPairOfCards].forEach({
            cards.append(Card(id: "\($0)A", content: $0))
            cards.append(Card(id: "\($0)B", content: $0))
        })
        cards.shuffle()
        return cards
    }
    
    
    init(numberOfPairOfCards: Int, base: [CardContent]) {
        cards=MemorizeGame<CardContent>.createGameCards(numberOfPairOfCards: numberOfPairOfCards, base: base)
    }
    
    var indexFirstUpCard:Int? = nil
    
    mutating func chooseCard(card: Card) {
        let mutIndex = self.cards.firstIndex(where: {$0.id==card.id})!
        if(!self.cards[mutIndex].isFaceUp && !self.cards[mutIndex].isMatched){
            if indexFirstUpCard != nil {
                if(self.cards[mutIndex].content==self.cards[indexFirstUpCard!].content){
                    self.cards[indexFirstUpCard!].isMatched=true
                    self.cards[mutIndex].isMatched=true
                    score+=2
                    self.cards[mutIndex].isFaceUp=true
                    indexFirstUpCard=nil
                }else{
                    self.cards[indexFirstUpCard!].isFaceUp=false
                    self.cards[mutIndex].isFaceUp=true
                    indexFirstUpCard=mutIndex
                    score-=1
                }
                return
            }
            indexFirstUpCard=mutIndex
            self.cards[mutIndex].isFaceUp=true
        }else if(self.cards[mutIndex].isFaceUp && !self.cards[mutIndex].isMatched){
            indexFirstUpCard=nil
            self.cards[mutIndex].isFaceUp=false
        }
    }
    
    mutating func shuffle() {
        self.cards.shuffle()
    }
    
    struct Card: Hashable, Equatable, Identifiable {
        let id: String
        
        func hash(into myhasher: inout Hasher) {
                myhasher.combine(id)
            }
        
        static func == (lhs: Card, rhs: Card) -> Bool {
            lhs.content == rhs.content&&lhs.isFaceUp==rhs.isFaceUp&&lhs.isMatched==rhs.isMatched
        }
        
        var isFaceUp:Bool=false
        var isMatched:Bool=false
        var content:CardContent
    }
}
