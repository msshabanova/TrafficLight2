//
//  ContentView.swift
//  TrafficLight
//
//  Created by Мария Шабанова on 17.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var buttonLabel = "Start"
    @State var redLightAlpha = 0.3
    @State var greenLightAlpha = 0.3
    @State var yellowLightAlpha = 0.3
    
    @State private var currentLight = CurrentLight.red
    private let lightIsOn = 1.0
    private let lightIsOff = 0.3
    
    
    var body: some View {
        VStack {
            LightView(color: .red, alpha: redLightAlpha)
            LightView(color: .yellow, alpha: greenLightAlpha)
            LightView(color: .green, alpha: yellowLightAlpha)
            
            Spacer()
            
            Button(action: startButtonPressed, label: {
                Text(buttonLabel)
            })
            .frame(width: 150.0, height: 50.0)
            .foregroundStyle(.white)
            .font(.system(size: 30))
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.primary, lineWidth: 4))
            .padding()
        }
        .padding()
    }
    
    func startButtonPressed() {
            buttonLabel = "Next"
  
            switch currentLight {
            case .red:
                greenLightAlpha = lightIsOff
                redLightAlpha = lightIsOn
                currentLight = .yellow
            case .yellow:
                redLightAlpha = lightIsOff
                yellowLightAlpha = lightIsOn
                currentLight = .green
            case .green:
                greenLightAlpha = lightIsOn
                yellowLightAlpha = lightIsOff
                currentLight = .red
            }
        }
}

#Preview {
    ContentView()
}

// MARK: - CurrentLight
extension ContentView {
    private enum CurrentLight {
        case red, yellow, green
    }
}
