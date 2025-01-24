// Home page

import SwiftUI
struct ContentView: View {
	
	//Array with recipe structs
	@State public var recipes: [Recipe] = []
	@State private var hasOpened = false
	
	let columns = [
		GridItem(.flexible(), spacing: 20),
		GridItem(.flexible(), spacing: 20)]
	
	var body: some View {
		NavigationView {
			ScrollView {
				LazyVGrid(columns: columns, spacing: 20) {
					
					ForEach($recipes) { $recipe in
						NavigationLink(
							destination: readRecipeView(recipe: $recipe)) {
								recipeBlock(
									recipeImageBase64Encoded: recipe.recipeImageBase64Encoded,
									recipeName: recipe.recipeName,
									time: recipe.time,
									deleteBlock: {
										if let index = recipes.firstIndex(where: { $0.id == recipe.id }) {
											recipes.remove(at: index)}
										saveRecipes(recipes)},
									
											
									openBlock: {}
								)}}
					
					// Plus button to add new recipe
					Button(action: {
						recipes.append(Recipe(recipeImageBase64Encoded: "empty-img", recipeName: "New Recipe", time: "10 Min", calories: 100, ingredients: "", steps: "")); saveRecipes(recipes)}) {
							Image(systemName: "plus.circle.fill")
								.resizable()
								.frame(width: 50, height: 50)
								.foregroundColor(Color.white)
								.padding([.bottom], 25)
						}
				}
				.padding(20)
			}
			.navigationTitle("Recipes")
			.navigationBarTitleTextColor(Color(defaultWhite))
			
			
			
			
			.onAppear {
						if !hasOpened {
							recipes = loadRecipes()
							hasOpened = true
				
						}
				saveRecipes(recipes)
				
					}
			
			
			
		
		}
	}
}


#Preview {
ContentView()
}
