//
//  AboutView.swift
//  Dicoding Games
//
//  Created by naswakhansa on 01/01/25.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5).ignoresSafeArea(.all)
            VStack(spacing: 25) {
                Image("naswa")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.black, lineWidth: 3)
                    )
                
                Text("Naswa Bryna Danikhansa")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    
            }
        }
    }
}

#Preview {
    AboutView()
}
