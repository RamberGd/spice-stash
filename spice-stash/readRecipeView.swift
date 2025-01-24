

import SwiftUI
import PhotosUI
struct readRecipeView: View {
	@Binding var recipe: Recipe
	
	
	
	
	var body: some View {
		ScrollView {
			VStack(spacing: 0) {
				ZStack(alignment: .bottomLeading) {
					
					
					
					GeometryReader { geometry in
						let offset = geometry.frame(in: .global).minY
						if let recipeImageData = recipe.recipeImageData{
							Image(uiImage: UIImage(data: recipeImageData)!)
								.resizable()
								.aspectRatio(contentMode: .fill)
								.frame(height: 300)
								.clipped()
								.scaleEffect(offset > 0 ? 1 + (offset / 300) : 1)
								.offset(y: offset > 0 ? -offset : 0)
						} else {
							Rectangle()
								.fill(Color.gray.opacity(0.3))
								.frame(height: 300)
								.scaleEffect(offset > 0 ? 1 + (offset / 300) : 1)
								.offset(y: offset > 0 ? -offset : 0)
						}
					
						if let recipeImageData = recipe.recipeImageData{
							Image(uiImage: UIImage(data: recipeImageData)!)
								.resizable()
								.aspectRatio(contentMode: .fill)
								.frame(height: 300)
								.clipped()
								.scaleEffect(offset > 0 ? 1 + (offset / 300) : 1)
								.offset(y: offset > 0 ? -offset : 0)
						} else {
							Rectangle()
								.fill(Color.gray.opacity(0.3))
								.frame(height: 300)
								.scaleEffect(offset > 0 ? 1 + (offset / 300) : 1)
								.offset(y: offset > 0 ? -offset : 0)
						}
					}
					LinearGradient(
						gradient: Gradient(colors: [.clear, .black.opacity(0.9)]),
						startPoint: .top,
						endPoint: .bottom
					)
					HStack() {
						Spacer()
						VStack(alignment: .center, spacing: 4) {
							
							Text(recipe.recipeName)
								.foregroundColor(Color(defaultWhite))
								.font(.titleDefault())
								
								.fixedSize()
								.multilineTextAlignment(.center)
								
								
							
							HStack(spacing: 8) {
								
								Text(String(recipe.calories))
									
									.frame(width: 26)
									.foregroundColor(Color(defaultWhite))
									.font(.fontRegularDefault())
									.fixedSize()
								
								
									
									.multilineTextAlignment(.leading)

								Text("calories")
									.foregroundColor(Color(defaultWhite))
									.font(.fontRegularDefault())
	
								Text("•")
									.foregroundColor(Color(defaultWhite))
					
								Text(recipe.time)
									
									.foregroundColor(Color(defaultWhite))
									.font(.fontRegularDefault())
									.fixedSize()
									.keyboardType(.namePhonePad)
								}
							
							
							.font(.subheadline)
							}
						.padding([.bottom], 20)
						Spacer()
					}
					
				}
				
				
				.frame(height: 300)
				
				
				
				
					Text("Ingredients")
					.font(.titleDefault())
					.foregroundStyle(Color(defaultWhite))
					.padding()
				
									 
				Text(recipe.ingredients).font(.ImportantDefault())
					.foregroundStyle(Color(defaultWhite))
					.padding()
				
				
				Text("Recipe")
					.font(.titleDefault())
					.foregroundStyle(Color(defaultWhite))
					.padding()
									 
									 
				Text(recipe.steps).font(.ImportantDefault())
					.foregroundStyle(Color(defaultWhite))
					.font(.ImportantDefault())
					.padding()
			}
		}
		
		.overlay(
			NavigationLink(destination: editRecipeView(recipe: $recipe)) { // NavigationLink to RecipeReadView
				Image(systemName: "square.and.pencil")
								.foregroundStyle(Color(defaultWhite))
								.padding(20)
								.font(.title)
								.scaledToFill()
								.background(Color.blue)
								.clipShape(Circle())
								.frame(width: 93, height: 93)
								
						}
						.position(x: UIScreen.main.bounds.size.width / 1.15, y: UIScreen.main.bounds.size.height - 100)
					)
		.edgesIgnoringSafeArea(.top)
		.navigationBarTitleDisplayMode(.inline)
	}
}




/*

struct readRecipeView_Previews: PreviewProvider {
	static var previews: some View {
		readRecipeView(recipe: .constant(Recipe(recipeImageBase64Encoded: "sample", recipeName: "Pasta Carbonara", time: "25-30 min", calories: 310, steps: "step 1")))
	}
}
 */
