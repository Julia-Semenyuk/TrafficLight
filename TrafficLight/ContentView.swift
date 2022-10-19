//
//  ContentView.swift
//  TrafficLight
//
//  Created by Юлия on 20.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    @State   private var currentLight = CurrentLight.red
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                ColorCircleView(color: .red, opacity: 0.3)
                ColorCircleView(color: .yellow, opacity: 0.3)
                ColorCircleView(color: .green, opacity: 0.3)
                Spacer()
                Button {
                    buttonPressed()
                } label: {
                    Text("START")
                        .font(.title)
                }
            }
            .padding()
        }
    }
    
    
        
    func buttonPressed() {
        
        switch currentLight {
        case .red:
            ColorCircleView(color: .green, opacity: lightIsOff)
            ColorCircleView(color: .red, opacity: lightIsOn )
            currentLight = .yellow
        case .yellow:
            ColorCircleView(color: .red, opacity: lightIsOff)
            ColorCircleView(color: .yellow, opacity: lightIsOn)
            currentLight = .green
        case .green:
            ColorCircleView(color: .green, opacity: lightIsOn)
            ColorCircleView(color: .yellow, opacity: lightIsOff)
            currentLight = .red
        }
        
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
    extension ContentView {
        enum CurrentLight {
            case red, yellow, green
        }
    }

