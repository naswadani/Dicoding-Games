//
//  ErrorStateView.swift
//  Dicoding Games
//
//  Created by naswakhansa on 01/01/25.
//

import SwiftUI

struct StateView: View {
    let message: String
    let action: (() -> Void)?
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            Text(message)
                .font(.system(size: 20, weight: .semibold, design: .default))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            if let action = action {
                Button(action: {
                    action()
                }) {
                    Text("Retry")
                        .font(.system(size: 15, weight: .semibold, design: .default))
                        .padding()
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.black)
                        )
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    StateView(message: "Maaf aplikasi error", action: {})
}
