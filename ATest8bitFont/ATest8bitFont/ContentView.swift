//
//  ContentView.swift
//  ATest8bitFont
//
//  Created by Juan Manuel Moreno on 28/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var offset: CGFloat = 0
    @State private var endsAt: TimeInterval = 0
    
    var body: some View {
        ZStack {
            Text("Hello, world!")
                .font(.custom("Diary of an 8-bit mage", size: 32))
                .offset(y: offset)
                .animation(.easeInOut(duration: endsAt), value: offset)
        }
        .onAppear {
            self.offset = UIScreen.main.bounds.height * -1 / 2 // first point
            self.move()
        }
    }
    
    func move() {
        withAnimation {
            endsAt = 3
            offset = UIScreen.main.bounds.height / 2
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + endsAt) {
            endsAt = 0
            self.offset = UIScreen.main.bounds.height * -1 / 2 // return to first point
            self.move()
        }
    }
}

#Preview {
    ContentView()
}
