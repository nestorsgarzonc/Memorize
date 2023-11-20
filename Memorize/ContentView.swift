import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Text("Memorize")
            .fontWeight(.bold)
            .font(.largeTitle)
        Text("Your score: \(viewModel.score)")
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0){
                    ForEach(viewModel.cards){ card in
                        CardView(
                            card: card,
                            color: viewModel.color
                        )
                            .aspectRatio(2/3, contentMode: .fit)
                            .padding(4)
                            .onTapGesture(perform: {
                            viewModel.chooseCard(
                                card: card
                                )
                            })
                    }
                }.padding()
                    .animation(.default, value: viewModel.cards)
            }
            Spacer()
            Button("New game"){
                viewModel.newGame()
            }
            /*
            HStack{
                
                 if(!emojis.isEmpty){
                 Button("Remove card"){
                 emojis.remove(at: emojis.count-1)
                 }
                 Spacer()
                 }
                 Button("Add card"){
                 emojis.append(emojisRepo0.randomElement() ?? "F")
                 
                 }
                 
            }.padding()
             */
        }
    }
}

#Preview {
    ContentView(viewModel: EmojiMemoryGame())
}

struct CardView: View {
    let card : MemorizeGame<String>.Card
    let color:Color
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 10)
        ZStack(alignment: .center){
            if(card.isFaceUp){
                base
                    .foregroundColor(.white)
                    .border(color)
                Pie(
                    finalAngle: .degrees(240), clockwise: true
                )
                    .foregroundColor(color)
                    .opacity(0.5)
                    .overlay(
                                Text(card.content)
                                    .font(.system(size: 100))
                                    .minimumScaleFactor(0.01)
                                    .aspectRatio(contentMode: .fit)
                                    .padding(16)
                    )
                
            }else{
                base
                    .foregroundColor(color)
            }
        }
    }
}
