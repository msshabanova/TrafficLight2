//
//  LightView.swift
//  TrafficLight
//
//  Created by Мария Шабанова on 17.04.2024.
//

import SwiftUI

struct LightView: View {
    
    private let circleDiameter: CGFloat = 150
    
    let color: Color
    let alpha: Double
    
    var body: some View {
        Circle()
            .foregroundStyle(color.opacity(alpha))
            .frame(width: circleDiameter)
            .overlay(Circle().stroke(Color.primary, lineWidth: 4).opacity(alpha))
    }
}

#Preview {
    LightView(color: .red, alpha: 0.3)
}
