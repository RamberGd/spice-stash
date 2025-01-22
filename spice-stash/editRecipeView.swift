//
//  editRecipeView.swift
//  food-untitled
//
//  Created by Maksim Ter-Avakian on 13/09/2024.
//

import SwiftUI
import PhotosUI
struct EditRecipeView: View {
	@Binding var recipes: [Recipe]
	@Binding var recipe: Recipe
	@State private var selectedImage: PhotosPickerItem? = nil
	let maxDigits = 4
	let stepsColumns = [GridItem(.flexible())]
	
	
	var body: some View {
			ScrollView {
				VStack(spacing: 0) {
					ZStack(alignment: .bottomLeading) {
						
						ZStack(alignment: .topTrailing) {
							Text("view")
								.foregroundStyle(Color.blue)
								.padding()
								.frame(alignment: .topTrailing)
						}
						.frame(width: UIScreen.main.bounds.size.width, height:300)
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
						}
						LinearGradient(
							gradient: Gradient(colors: [.clear, .black.opacity(0.7)]),
							startPoint: .top,
							endPoint: .bottom
						)
						HStack() {
							Spacer()
							VStack(alignment: .center, spacing: 4) {
								
								TextField("Pasta Carbonara", text: $recipe.recipeName)
									.foregroundColor(Color(defaultWhite))
									.font(.titleDefault())
									.textFieldStyle(PlainTextFieldStyle())
									.fixedSize()
									.multilineTextAlignment(.center)
								
								HStack(spacing: 8) {
									
									TextField("100", value: $recipe.calories, formatter: NumberFormatter())
										.textFieldStyle(PlainTextFieldStyle())
										.frame(width: 26)
										.foregroundColor(Color(defaultWhite))
										.font(.fontRegularDefault())
										.fixedSize()
									
										.onChange(of: recipe.calories) { oldValue, newValue in
											// Convert to string to check length
											let valueString = String(newValue)
											
											
											if valueString.count > maxDigits {
												if let truncated = Int16(valueString.prefix(maxDigits)) {
													recipe.calories = truncated
												} else {
													recipe.calories = oldValue
												}
											}
										}
										.multilineTextAlignment(.leading)

									Text("calories")
										.foregroundColor(Color(defaultWhite))
										.font(.fontRegularDefault())
		
									Text("•")
										.foregroundColor(Color(defaultWhite))
						
									TextField("30 min", text: $recipe.time, prompt: Text("30 m"))
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
				
					
					PhotosPicker(selection: $selectedImage, matching: .images, photoLibrary: .shared()) {
						Image(systemName: "photo")
							.padding(20)
							.font(.title)
							.scaledToFill()
							.background(Color.blue)
							.foregroundColor(Color(defaultWhite))
							.clipShape(Circle())
							.frame(width: 93, height: 93)
					}
					
					.onChange(of: selectedImage) { oldValue, newValue in
						Task {
							if let data = try? await newValue?.loadTransferable(type: Data.self) {
								recipe.recipeImageData = data
								recipe.recipeImageBase64Encoded = data.base64EncodedString()
							}
						}
					}
					LazyVGrid(columns: stepsColumns){
		
					}
					
					Spacer()
					
				}
			}
			
			
		
		
		
			.edgesIgnoringSafeArea(.top)
			.navigationBarTitleDisplayMode(.inline)
	}
}


/*
struct EditRecipeView_Previews: PreviewProvider {
	static var previews: some View {
		EditRecipeView(recipe: .constant(Recipe(recipeImageBase64Encoded: "sample", recipeName: "Pasta Carbonara", time: "25-30 min", calories: 310)))
	}
}

*/
