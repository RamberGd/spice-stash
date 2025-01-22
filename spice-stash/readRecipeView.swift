//
//  editRecipeView.swift
//  food-untitled
//
//  Created by Maksim Ter-Avakian on 13/09/2024.
//

import SwiftUI
import PhotosUI
struct readRecipeView: View {
	@Binding var recipe: Recipe
	
	
	var body: some View {
		ScrollView {
			VStack(spacing: 0) {
				ZStack(alignment: .bottomLeading) {
					// Image handling...
					if let recipeImageData = recipe.recipeImageData{
						Image(uiImage: UIImage(data: recipeImageData)!)
							.resizable()
							.aspectRatio(contentMode: .fill)
							.frame(height: 300)
							.clipped()
					} else {
						Rectangle()
							.fill(Color.gray.opacity(0.3))
							.frame(height: 300)
					}
					
					LinearGradient(
						gradient: Gradient(colors: [.clear, .black.opacity(0.7)]),
						startPoint: .top,
						endPoint: .bottom
					)
					
					
					HStack() {
						
						Spacer()
						
						VStack(alignment: .center, spacing: 4) {
							
							Text(recipe.recipeName)
								
								
								.foregroundColor(Color(defaultWhite))
								.font(.titleDefault())
								.textFieldStyle(PlainTextFieldStyle())
								.fixedSize()
								.multilineTextAlignment(.center)
							
						
								
								HStack(spacing: 8) {
								
									
										
									Text(String(recipe.calories))
									
											.frame(width: 26)
											.foregroundColor(Color(defaultWhite))
											.font(.fontRegularDefault())
											.fixedSize()
									
											
									
									
									
										Text("calories")
											.foregroundColor(Color(defaultWhite))
											.font(.fontRegularDefault())
									
									
									
									Text("•")
										.foregroundColor(Color(defaultWhite))
						
	
									
									Text(recipe.time)
										.textFieldStyle(PlainTextFieldStyle())
										.foregroundColor(Color(defaultWhite))
										.font(.fontRegularDefault())
										.fixedSize()
										
				
									
								}
								.font(.subheadline)
								
							
						}
						.padding([.bottom], 20)
						
						
						
						Spacer()
					}
					
				}
				.frame(height: 300)
				
				
				
				Spacer()

			}
		}
		.edgesIgnoringSafeArea(.top)
		.navigationBarTitleDisplayMode(.inline)
	}
}



struct readRecipeView_Previews: PreviewProvider {
	static var previews: some View {
		readRecipeView(recipe: .constant(Recipe(recipeImageBase64Encoded: "sample", recipeName: "Pasta Carbonara", time: "25-30 min", calories: 310)))
	}
}

