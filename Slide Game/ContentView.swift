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
                        /*let temp = n
                        let tempVal = numbersShuffled[n]
                        n = index
                        numbersShuffled[temp] = numbersShuffled[n]
                        numbersShuffled[n] = tempVal*/
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
                /*.onTapGesture {
                    move.toggle()
                }*/
            }
        }
        
        /*ZStack{
            Button(action:{
                //actions go here
                move = 0
                if ((0 == n - 1 || 0 == n + 1 || 0 == n - 3 || 0 == n + 3) && (0 % 3 == n % 3 || 0 / 3 == n / 3)) {
                    let temp = n
                    let tempVal = numbersShuffled[n]
                    n = 0
                    numbersShuffled[temp] = numbersShuffled[n]
                    numbersShuffled[n] = tempVal
                    //numbersShuffled.swapAt(n, index)
                }
                //move.toggle()
            }, label:{
                Text("\(numbersShuffled[0] == "nil" ? " " : numbersShuffled[0])")
                    .frame(width: 50, height: 50)
                    .fontWeight(.semibold)
            })
            .frame(width: 50, height: 50)
            .offset(x: move == 0 ? CGFloat(((0 % 3) * 100) - 100) : CGFloat(((n % 3) * 100) - 100), y: move == 0 ? CGFloat((0 / 3) * 100) - 100 : CGFloat(((n % 3) * 100) - 100))
            .animation(.linear, value: move)
            
            Button(action:{
                //actions go here
                move = 1
                if ((1 == n - 1 || 1 == n + 1 || 1 == n - 3 || 1 == n + 3) && (1 % 3 == n % 3 || 1 / 3 == n / 3)) {
                    let temp = n
                    let tempVal = numbersShuffled[n]
                    n = 1
                    numbersShuffled[temp] = numbersShuffled[n]
                    numbersShuffled[n] = tempVal
                    //numbersShuffled.swapAt(n, index)
                }
                //move.toggle()
            }, label:{
                Text("\(numbersShuffled[1] == "nil" ? " " : numbersShuffled[1])")
                    .frame(width: 50, height: 50)
                    .fontWeight(.semibold)
            })
            .frame(width: 50, height: 50)
            .offset(x: move == 1 ? CGFloat(((1 % 3) * 100) - 100) : CGFloat(((n % 3) * 100) - 100), y: move == 1 ? CGFloat((1 / 3) * 100) - 100 : CGFloat(((n % 3) * 100) - 100))
            .animation(.linear, value: move)
            
            Button(action:{
                //actions go here
                move = 2
                if ((move == n - 1 || move == n + 1 || move == n - 3 || move == n + 3) && (move % 3 == n % 3 || move / 3 == n / 3)) {
                    let temp = n
                    let tempVal = numbersShuffled[n]
                    n = move
                    numbersShuffled[temp] = numbersShuffled[n]
                    numbersShuffled[n] = tempVal
                    //numbersShuffled.swapAt(n, index)
                }
                //move.toggle()
            }, label:{
                Text("\(numbersShuffled[2] == "nil" ? " " : numbersShuffled[2])")
                    .frame(width: 50, height: 50)
                    .fontWeight(.semibold)
            })
            .frame(width: 50, height: 50)
            .offset(x: move == 2 ? CGFloat(((move % 3) * 100) - 100) : CGFloat(((n % 3) * 100) - 100), y: move == 2 ? CGFloat((move / 3) * 100) - 100 : CGFloat(((n % 3) * 100) - 100))
            .animation(.linear, value: move)
            
            Button(action:{
                //actions go here
                move = 3
                if ((move == n - 1 || move == n + 1 || move == n - 3 || move == n + 3) && (move % 3 == n % 3 || move / 3 == n / 3)) {
                    let temp = n
                    let tempVal = numbersShuffled[n]
                    n = move
                    numbersShuffled[temp] = numbersShuffled[n]
                    numbersShuffled[n] = tempVal
                    //numbersShuffled.swapAt(n, index)
                }
                //move.toggle()
            }, label:{
                Text("\(numbersShuffled[3] == "nil" ? " " : numbersShuffled[3])")
                    .frame(width: 50, height: 50)
                    .fontWeight(.semibold)
            })
            .frame(width: 50, height: 50)
            .offset(x: move == 3 ? CGFloat(((move % 3) * 100) - 100) : CGFloat(((n % 3) * 100) - 100), y: move == 3 ? CGFloat((move / 3) * 100) - 100 : CGFloat(((n % 3) * 100) - 100))
            .animation(.linear, value: move)
            
            Button(action:{
                //actions go here
                move = 4
                if ((move == n - 1 || move == n + 1 || move == n - 3 || move == n + 3) && (move % 3 == n % 3 || move / 3 == n / 3)) {
                    let temp = n
                    let tempVal = numbersShuffled[n]
                    n = move
                    numbersShuffled[temp] = numbersShuffled[n]
                    numbersShuffled[n] = tempVal
                    //numbersShuffled.swapAt(n, index)
                }
                //move.toggle()
            }, label:{
                Text("\(numbersShuffled[4] == "nil" ? " " : numbersShuffled[4])")
                    .frame(width: 50, height: 50)
                    .fontWeight(.semibold)
            })
            .frame(width: 50, height: 50)
            .offset(x: move == 4 ? CGFloat(((move % 3) * 100) - 100) : CGFloat(((n % 3) * 100) - 100), y: move == 4 ? CGFloat((move / 3) * 100) - 100 : CGFloat(((n % 3) * 100) - 100))
            .animation(.linear, value: move)
            Button(action:{
                //actions go here
                move = 5
                if ((move == n - 1 || move == n + 1 || move == n - 3 || move == n + 3) && (move % 3 == n % 3 || move / 3 == n / 3)) {
                    let temp = n
                    let tempVal = numbersShuffled[n]
                    n = move
                    numbersShuffled[temp] = numbersShuffled[n]
                    numbersShuffled[n] = tempVal
                    //numbersShuffled.swapAt(n, index)
                }
                //move.toggle()
            }, label:{
                Text("\(numbersShuffled[5] == "nil" ? " " : numbersShuffled[5])")
                    .frame(width: 50, height: 50)
                    .fontWeight(.semibold)
            })
            .frame(width: 50, height: 50)
            .offset(x: move == 5 ? CGFloat(((move % 3) * 100) - 100) : CGFloat(((n % 3) * 100) - 100), y: move == 5 ? CGFloat((move / 3) * 100) - 100 : CGFloat(((n % 3) * 100) - 100))
            .animation(.linear, value: move)
            Button(action:{
                //actions go here
                move = 6
                if ((move == n - 1 || move == n + 1 || move == n - 3 || move == n + 3) && (move % 3 == n % 3 || move / 3 == n / 3)) {
                    let temp = n
                    let tempVal = numbersShuffled[n]
                    n = move
                    numbersShuffled[temp] = numbersShuffled[n]
                    numbersShuffled[n] = tempVal
                    //numbersShuffled.swapAt(n, index)
                }
                //move.toggle()
            }, label:{
                Text("\(numbersShuffled[6] == "nil" ? " " : numbersShuffled[6])")
                    .frame(width: 50, height: 50)
                    .fontWeight(.semibold)
            })
            .frame(width: 50, height: 50)
            .offset(x: move == 6 ? CGFloat(((move % 3) * 100) - 100) : CGFloat(((n % 3) * 100) - 100), y: move == 3 ? CGFloat((move / 3) * 100) - 100 : CGFloat(((n % 3) * 100) - 100))
            .animation(.linear, value: move)
            Button(action:{
                //actions go here
                move = 7
                if ((move == n - 1 || move == n + 1 || move == n - 3 || move == n + 3) && (move % 3 == n % 3 || move / 3 == n / 3)) {
                    let temp = n
                    let tempVal = numbersShuffled[n]
                    n = move
                    numbersShuffled[temp] = numbersShuffled[n]
                    numbersShuffled[n] = tempVal
                    //numbersShuffled.swapAt(n, index)
                }
                //move.toggle()
            }, label:{
                Text("\(numbersShuffled[7] == "nil" ? " " : numbersShuffled[7])")
                    .frame(width: 50, height: 50)
                    .fontWeight(.semibold)
            })
            .frame(width: 50, height: 50)
            .offset(x: move == 7 ? CGFloat(((move % 3) * 100) - 100) : CGFloat(((n % 3) * 100) - 100), y: move == 7 ? CGFloat((move / 3) * 100) - 100 : CGFloat(((n % 3) * 100) - 100))
            .animation(.linear, value: move)
            Button(action:{
                //actions go here
                move = 8
                if ((move == n - 1 || move == n + 1 || move == n - 3 || move == n + 3) && (move % 3 == n % 3 || move / 3 == n / 3)) {
                    let temp = n
                    let tempVal = numbersShuffled[n]
                    n = move
                    numbersShuffled[temp] = numbersShuffled[n]
                    numbersShuffled[n] = tempVal
                    //numbersShuffled.swapAt(n, index)
                }
                //move.toggle()
            }, label:{
                Text("\(numbersShuffled[8] == "nil" ? " " : numbersShuffled[8])")
                    .frame(width: 50, height: 50)
                    .fontWeight(.semibold)
            })
            .frame(width: 50, height: 50)
            .offset(x: move == 8 ? CGFloat(((move % 3) * 100) - 100) : CGFloat(((n % 3) * 100) - 100), y: move == 8 ? CGFloat((move / 3) * 100) - 100 : CGFloat(((n % 3) * 100) - 100))
            .animation(.linear, value: move)
        }*/
        
        Button(action:{
                //actions go here
            numbersShuffled = numbers.shuffled()
            /*if let n = numbersShuffled.firstIndex(where: { $0.starts(with: "nil") }) {
               print("Index of \("nil") is \(n)")
            } else {
               print("\("nil") is not in the list")
            }*/
            let n = numbersShuffled.firstIndex(of: "nil")
            print("Index of \("nil") is \(n)")
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
