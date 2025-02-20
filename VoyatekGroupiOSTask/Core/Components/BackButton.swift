//
//  BackButton.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 19/02/2025.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
        Image(systemName: "chevron.backward.square")
            .resizable()
            .frame(width: 20, height: 20)
            .padding()
            .overlay {
                Circle()
                    .stroke(.gray, lineWidth: 1)
            }
    }
}

#Preview {
    BackButton()
}
