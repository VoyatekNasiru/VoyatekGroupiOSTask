//
//  FoodCell.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 19/02/2025.
//

import SwiftUI

struct FoodCell: View {
    var food: Food
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: food.foodImages?.last?.imageUrl ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .clipped()
            } placeholder: {
                Image("food-placeholder", bundle: nil)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 100)
            }

            VStack(alignment: .leading) {
                HStack {
                    Text(food.name ?? "")
                        .font(.headline)
                    Spacer()
                    Image(systemName: "heart")
                }
                
                HStack {
                    Image("fire", bundle: nil)
                    Text(food.calories == 1 ? "\(1) calory" : "\(food.calories ?? 0) calories")
                }
                
                Text(food.description ?? "")
                    .multilineTextAlignment(.leading)
                    .font(.caption)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(food.foodTags ?? [], id:\.self) { tag in
                            Text(tag)
                                .padding(.horizontal, 15)
                                .padding(.vertical, 10)
                                .background(.vgPink)
                                .foregroundStyle(.vgBlack)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(.gray.opacity(0.3), lineWidth: 1)
        }
    }
}

#Preview {
    FoodCell(food: Food(
        id: 1,
        name: "NEW RESTURANT TEST",
        description: "Creamy hummus spread on whole grain toast topped with sliced cucumbers and radishes...",
        categoryId: 8,
        calories: 20,
        foodTags: ["Keto", "Paleo"],
        foodImages: [
            FoodImage(id: 1, imageUrl: "https://assessment.vgtechdemo.com//food_images/1739607977_WhatsApp_Image_2025-01-19_at_14.17.36-removebg-preview.png"),
            FoodImage(id: 2, imageUrl: "https://assessment.vgtechdemo.com//food_images/1739607977_WhatsApp Image 2025-01-19 at 14.12.54.jpeg")
        ],
        category: Category(id: 8, name: "Meat", description: "Beef, pork, and other meats", createdAt: "2025-02-15T08:15:56.000000Z", updatedAt: "2025-02-15T08:15:56.000000Z"),
        createdAt: "2025-02-15T08:26:17.000000Z",
        updatedAt: "2025-02-15T08:26:17.000000Z"
    ))
}
