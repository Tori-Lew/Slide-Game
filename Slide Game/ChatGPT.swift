//
//  ChatGPT.swift
//  Slide Game
//
//  Created by Student Account on 10/30/23.
//

import SwiftUI

struct ChatGPT: View {
    @State private var buttons: [ButtonData] = [ButtonData(position: CGPoint(x:200, y: 200), color: Color(red: 1.0, green: 0.0, blue: 0.0))]

    struct ButtonData: Identifiable, Equatable {
        let id = UUID()
        var position: CGPoint
        var color: Color
    }

    var body: some View {
        ZStack {
            ForEach(buttons) { button in
                Button(action: {
                    // Button action
                }) {
                    Text("Button")
                        .padding()
                        .background(button.color)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .position(button.position)
                        .animation(.spring()) // Apply animation to button position changes
                        .id(button.id) // Ensure SwiftUI knows which buttons are the same across updates
                }
            }
        }
        .onTapGesture {
            let randomX = CGFloat.random(in: 0..<UIScreen.main.bounds.width)
            let randomY = CGFloat.random(in: 0..<UIScreen.main.bounds.height)
            let randomColor = Color(.sRGB, red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), opacity: 1.0)
            let newPosition = CGPoint(x: randomX, y: randomY)
            print ("Hello")
            // Update the positions of existing buttons, triggering animation
            withAnimation {
                buttons.forEach { button in
                    buttons[buttons.firstIndex(of: button)!].position = newPosition
                }
            }
        }
    }
}

struct ChatGPT_Previews: PreviewProvider {
    static var previews: some View {
        ChatGPT()
    }
}
