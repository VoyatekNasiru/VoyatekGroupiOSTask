//
//  CategoriesDropDownView.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 19/02/2025.
//

import SwiftUI

struct CategoriesDropDownView: View {
    let categories: [Category]
    var onselect: (Category) -> Void
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(categories, id: \.self) { category in
                    HStack {
                        Text(category.name ?? "")
                        Spacer()
                    }
                    .padding(5)
                    .onTapGesture {
                        onselect(category)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    CategoriesDropDownView(categories: Category.mockData, onselect: { cat in })
}
