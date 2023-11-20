//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Sebastian Garzon on 3/11/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
