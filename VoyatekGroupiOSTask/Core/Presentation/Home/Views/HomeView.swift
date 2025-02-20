//
//  HomeView.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 19/02/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    var navigateToAddFood: (([Category]) -> Void)?
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                
                Text("Hey there, Lucy!")
                    .font(.headline)
                
                Text("Are you excited to create a tasty dish today?")
                    .font(.caption)
                
                HStack(spacing: 10) {
                    Image("search-icon", bundle: nil)
                    TextField("search foods...", text: $viewModel.searchText)
                }
                .padding(15)
                .background(.faintBlue)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding(.vertical)
                
                ScrollView(.horizontal) {
                    HStack {
                        Text("All")
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background( viewModel.selectedCategoryIndex == 0 ? .blue : .faintBlue)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .onTapGesture {
                                viewModel.selectedCategoryIndex = 0
                            }
                        
                        ForEach(viewModel.categories, id: \.self) { category in
                            Text(category.name ?? "nil")
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background( viewModel.selectedCategoryIndex == category.id ? .blue : .faintBlue)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .onTapGesture {
                                    viewModel.selectedCategoryIndex = category.id ?? 0
                                }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                
                Text(viewModel.foodMenuTitle)
                    .font(.headline)
                    .padding(.vertical, 30)
                
                ScrollView {
                    LazyVStack(spacing: 15) {
                        ForEach(viewModel.filteredFoods, id: \.self) { food in
                            FoodCell(food: food)
                        }
                    }
                }

                Spacer()
            }
            .padding()
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        print("add food")
                        navigateToAddFood?(viewModel.categories)
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding(20)
                    .background(.red)
                    .tint(.white)
                    .clipShape(Circle())
                    .padding()
                    .contentShape(Circle())
                }
            }
            
            if viewModel.showLoader {
                ProgressView()
            }
        }
        .onAppear {
            viewModel.fetchFoodsAndCategories()
        }
    }
}

#Preview {
    HomeView()
}
