//
//  DisplayPicture.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 19/02/2025.
//

import SwiftUI

struct DisplayPicture: View {
    var body: some View {
        Image("avatar", bundle: nil)
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
    }
}

#Preview {
    DisplayPicture()
}
