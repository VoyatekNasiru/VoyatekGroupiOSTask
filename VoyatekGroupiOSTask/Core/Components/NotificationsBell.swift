//
//  NotificationsBell.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 19/02/2025.
//

import SwiftUI

struct NotificationsBell: View {
    var body: some View {
        Image(systemName: "bell")
            .resizable()
            .scaledToFit()
            .padding(10)
            .overlay {
                Circle()
                    .stroke(.gray, lineWidth: 1.0)
            }
            .frame(width: 40, height: 40)
    }
}

#Preview {
    NotificationsBell()
}
