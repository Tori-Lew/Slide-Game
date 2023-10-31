//
//  ContentView.swift
//  Slide Game
//
//  Created by Student Account on 10/16/23.
//

import SwiftUI

struct ContentView: View {
    @State var numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "nil"]
    @State var n = 8
    @State var move = true
    @State var numbersShuffled = ["1", "2", "3", "4", "5", "6", "7", "8", "nil"]
    @State private var scale = 1.0
    @State private var start = false
    @State var isComplete = false
    var body: some View {
        /*VStack {
            Text("A Text view")
                .offset(x: move ? 100 : 0, y: move ? 100 : 0)
        // or  .position(x: move ? 100 : 0, y: move ? 100 : 0)
                .animation(.default, value: move)
            Toggle(isOn: $move) {
                Text("Toggle me")
            }
        }*/
        /*VStack {
                    Button("Start animation") {
                        start.toggle()
                    }
                    HStack {
                        Text("easeIn")
                            .offset(x: 0, y: start ? 450 : 0)
                            .animation(.easeIn, value: start)
                        Text("easeOut")
                            .offset(x: 0, y: start ? 450 : 0)
                            .animation(.easeOut, value: start)
                        Text("easeInOut")
                            .offset(x: 0, y: start ? 450 : 0)
                            .animation(.easeInOut, value: start)
                        Text("linear")
                            .offset(x: 0, y: start ? 450 : 0)
                            .animation(.linear, value: start)
                    }.position(x: 150, y: 10)
                }*/
        ZStack{
            ForEach(numbersShuffled.indices, id: \.self){ index in
                Button(action:{
                    //actions go here
                    //move.toggle()
                    if ((index == n - 1 || index == n + 1 || index == n - 3 || index == n + 3) && (index % 3 == n % 3 || index / 3 == n / 3)) {
                        numbersShuffled.swapAt(n, index)
                        n = index
                    }
                    //move.toggle()
                }, label:{
                    Text("\(numbersShuffled[index] == "nil" ? " " : numbersShuffled[index])")
                        .frame(width: 50, height: 50)
                        .fontWeight(.semibold)
                })
                .frame(width: 50, height: 50)
                .offset(x: move ? CGFloat(((index % 3) * 100) - 100) : CGFloat(((n % 3) * 100) - 100), y: move ? CGFloat(((index) / 3) * 100) - 100 : CGFloat(((n % 3) * 100) - 100))
                .animation(.linear, value: move)
                .onTapGesture {
                    move.toggle()
                }
            }
        }
        Button(action:{
                //actions go here
            numbersShuffled.shuffle()
            /*if let n = numbersShuffled.firstIndex(where: { $0.starts(with: "nil") }) {
               print("Index of \("nil") is \(n)")
            } else {
               print("\("nil") is not in the list")
            }*/
            n = numbersShuffled.firstIndex(of: "nil")!
            print("Index of \("nil") is \(n)")
            isComplete = false
        }, label:{
            Text("Start New Game")
            .fontWeight(.semibold)
            }).padding()
            .offset(y: 150)

    }
}

#Preview {
    ContentView()
}
class Position: ObservableObject {
    @Published var xPosition: Int = 0
    @Published var yPosition: Int = 0
}
