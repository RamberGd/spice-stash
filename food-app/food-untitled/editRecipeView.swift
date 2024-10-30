//
//  editRecipeView.swift
//  food-untitled
//
//  Created by Maksim Ter-Avakian on 13/09/2024.
//

import SwiftUI
import PhotosUI
struct EditRecipeView: View {
	@Binding var recipe: Recipe
	@State private var selectedImage: PhotosPickerItem? = nil
	
	var body: some View {
		ScrollView {
			VStack(spacing: 0) {
				ZStack(alignment: .bottomLeading) {
					// Image handling...
					if let imageData = recipe.imageData, let uiImage = UIImage(data: imageData) {
						Image(uiImage: uiImage)
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
					
					VStack(alignment: .leading, spacing: 8) {
						TextField("Recipe Name", text: $recipe.recipeName)
							.font(.title)
							.foregroundColor(Color(defaultWhite))
						
						
						

						HStack(spacing: 20) {
							
							Spacer()
							
							/*TextField("Calories", value: $recipe.calories, formatter: NumberFormatter())
								.foregroundColor(.white)*/
							
							Text("calories")
								.foregroundColor(.white.opacity(0.8))
							
							Text("•")
								.foregroundColor(.white.opacity(0.8))
								
							
							TextField("Cook Time", text: $recipe.time)
								.foregroundColor(Color(defaultWhite))
							
							Spacer()
							
						}
						.frame(maxWidth: UIScreen.main.bounds.size.width, alignment: .center)
						
						.font(.subheadline)
				
					}
					.padding()
				}
				.frame(height: 300)
				
				PhotosPicker(selection: $selectedImage, matching: .images, photoLibrary: .shared()) {
					Image(systemName: "photo")
						.padding()
						.background(Color.blue)
						.foregroundColor(Color(defaultWhite)	)
						.cornerRadius(40)
				}
				.padding(.top, 20)
				.onChange(of: selectedImage) { oldValue, newValue in
					Task {
						if let data = try? await newValue?.loadTransferable(type: Data.self) {
							recipe.imageData = data
							recipe.previewImage = data.base64EncodedString()
						}
					}
				}
				
				Spacer()
			}
		}
		.edgesIgnoringSafeArea(.top)
		.navigationBarTitleDisplayMode(.inline)
	}
}



struct EditRecipeView_Previews: PreviewProvider {
	static var previews: some View {
		EditRecipeView(recipe: .constant(Recipe(previewImage: "sample", recipeName: "Pasta Carbonara", time: "25-30 min", calories: 310)))
	}
}

