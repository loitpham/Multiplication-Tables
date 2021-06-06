//
//  ContentView.swift
//  Multiplication-Tables
//
//  Created by Loi Pham on 6/5/21.
//

import SwiftUI

//struct SelectionModifier: ViewModifier {
//    let selected: Bool
//    let selectedOpacity: Double
//    let unselectedOpacity: Double
//
//    func body(content: Content) -> some View {
//        content
//            .opacity(selected ? selectedOpacity : unselectedOpacity)
//    }
//}
//
//extension Button {
//    func selected(_ isSelected: Bool) {
//        self.modifier(SelectionModifier(selected: isSelected, selectedOpacity: 0.8, unselectedOpacity: 0.2))
//    }
//}

struct ContentView: View {
    @State private var showingSettings = true
    @State private var table = 1
    @State private var numQuestions = 5
    private var choices = ["5", "10", "20", "All"]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            if showingSettings {
                VStack {
                    Text("Select a table")
                        .font(.largeTitle)
                        .padding()
                    
                    VStack {
                        ForEach(0..<4) { row in
                            HStack {
                                ForEach(0..<3) { col in
                                    Button(action: {
                                        table = 3 * row + col + 1
                                    }) {
                                        Text("\(3 * row + col + 1)")
                                            .padding()
                                            .frame(width: 100, height: 100)
                                            .background(Color.orange)
                                            .opacity(0.8)
                                            .foregroundColor(.white)
                                            .font(.title)
                                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                    }
                                    
                                }
                            }
                        }
                    } // VSTACK
                    
                    Text("Number of questions")
                        .font(.largeTitle)
                        .padding()
                    
                    HStack {
                        ForEach(choices, id: \.self) { choice in
                            Button(action: {
                                numQuestions = Int(choice) ?? 30
                            }) {
                                Text(choice)
                                    .padding()
                                    .frame(width: 100, height: 100)
                                    .background(Color.green)
                                    .opacity(0.8)
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .clipShape(Capsule())
                            }
                        }
                    } // HSTACK
                    
                    Text("Table: \(table)")
                    Text("Number of Questions: \(numQuestions)")
//                    Button(action: {
//                        
//                    }) {
//                        HStack {
//                            Text("Start")
//                            Image(systemName: "right.arrow.circle")
//                        }
//                        .foregrooundColor(.white)
//                    }
                } // VSTACK
            } else {
                // Show questions
                EmptyView()
            } // IF
        } // ZSTACK
    } // BODY
} // CONTENT-VIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
