//
//  ContentView.swift
//  food-untitled
//
//  Created by Maksim Ter-Avakian on 13/09/2024.
//

import SwiftUI
struct ContentView: View {
	@State private var recipes: [Recipe] = [
		Recipe(previewImage: "sample", recipeName: "Pasta Carbonara", time: "15-20 min", calories: 310)
	]
	
	let columns = [
		GridItem(.flexible(), spacing: 20),
		GridItem(.flexible(), spacing: 20)
	]
	
	var body: some View {
		NavigationView {
			ScrollView {
				LazyVGrid(columns: columns, spacing: 20) {
					ForEach($recipes) { $recipe in
						NavigationLink(
							destination: EditRecipeView(recipe: $recipe)
						) {
							recipeSampleLine(
								previewImage: recipe.previewImage,
								recipeName: recipe.recipeName,
								time: recipe.time,
								deleteBlock: {
									if let index = recipes.firstIndex(where: { $0.id == recipe.id }) {
										recipes.remove(at: index)
									}
								},
								openBlock: {}
							)
						}
					}
					
					// Plus button to add new recipe
					Button(action: {
						recipes.append(Recipe(previewImage: "empty-img", recipeName: "New Recipe", time: "time", calories: 310))
					}) {
						Image(systemName: "plus.circle.fill")
							.resizable()
							.frame(width: 50, height: 50)
							.foregroundColor(Color.white)
							.padding([.bottom], 25)
					}
				}
				.padding(20)
			}
			.background(Color(defaultBlack))
			.navigationTitle("Recipes")
			.navigationBarTitleTextColor(Color(defaultWhite))
		}
	}
}

#Preview {
	ContentView()
}


//https://zestfuldata.com/
