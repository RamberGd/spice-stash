//
//  editRecipeView.swift
//  food-untitled
//
//  Created by Maksim Ter-Avakian on 13/09/2024.
//

import SwiftUI
import PhotosUI
struct editRecipeView: View {
	
	@Binding var recipe: Recipe
	@State private var selectedImage: PhotosPickerItem? = nil
	@FocusState private var isFocused: Bool
	let maxDigits = 3
	let stepsColumns = [GridItem(.flexible())]
	
	
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
							
							TextField("Pasta Carbonara", text: $recipe.recipeName)
								.foregroundColor(Color(defaultWhite))
								.font(.titleDefault())
							
								.fixedSize()
								.multilineTextAlignment(.center)
								.textFieldStyle(.plain)
							
							
							HStack(spacing: 8) {
								
								TextField("100", value: $recipe.calories, formatter: NumberFormatter())
									.textFieldStyle(.automatic)
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
								
								TextField("30 min", text: $recipe.time)
									.textFieldStyle(PlainTextFieldStyle())
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
				
				
				.onTapGesture {
					// Dismiss the keyboard by unfocusing the TextField
					isFocused = false
				}
				
				
				
				PhotosPicker(selection: $selectedImage, matching: .images, photoLibrary: .shared()) {
					Image(systemName: "photo")
						.padding(20)
						.font(.title)
						.scaledToFill()
						.background(Color.blue)
						.foregroundColor(Color(defaultWhite))
						.clipShape(Circle())
						.frame(width: 93, height: 93)//consistent with IOS UI elements (control centrre)
						.position(x:UIScreen.main.bounds.size.width / 1.15, y: 0 ) // ура костыли
						.padding([.bottom], -80) //ура больше костылей
				}
				
				.onChange(of: selectedImage) { oldValue, newValue in
					Task {
						if let data = try? await newValue?.loadTransferable(type: Data.self) {
							recipe.recipeImageData = data
							recipe.recipeImageBase64Encoded = data.base64EncodedString()
						}
					}
				}
				
				
				
				
				
				Text("Ingredients")
					.font(.titleDefault())
					.foregroundStyle(Color(defaultWhite))
				
				
				TextEditor(text: Binding(
					get: { recipe.ingredients },
					set: { recipe.ingredients = $0.isEmpty ? "" : $0 }
				))
				.padding()
				.font(.ImportantDefault()) // Apply custom font
				.foregroundColor(Color(defaultWhite)) // Set text color
				.background(
					RoundedRectangle(cornerRadius: 8) // Apply rounded corners here
						.fill(Color.clear) // Make the background transparent to show the stroke
				)
				.overlay(
					RoundedRectangle(cornerRadius: 8) // Apply stroke over the background
						.stroke(Color(defaultBlack), lineWidth: 1) // Stroke color and thickness
						.padding()
					
				)
				.clipped()
				.focused($isFocused)
				
				Spacer()
				
				
				Text("Recipe")
					.font(.titleDefault())
					.foregroundStyle(Color(defaultWhite))
				
				
				
				
				TextEditor(text: Binding(
					get: { recipe.steps },
					set: { recipe.steps = $0.isEmpty ? "" : $0 }
				))
				.padding()
				.font(.ImportantDefault()) // Apply custom font
				.foregroundColor(Color(defaultWhite)) // Set text color
				.background(
					RoundedRectangle(cornerRadius: 8) // Apply rounded corners here
						.fill(Color.clear) // Make the background transparent to show the stroke
				)
				.overlay(
					RoundedRectangle(cornerRadius: 8) // Apply stroke over the background
						.stroke(Color(defaultBlack), lineWidth: 1) // Stroke color and thickness
						.padding()
					
				)
				.clipped()
				.focused($isFocused)
				
				
				
				
				
			}
			
			
			
			
			
			
			
			
		}
		
		.overlay(
						NavigationLink(destination: readRecipeView(recipe: $recipe)) { // NavigationLink to RecipeReadView
							Image(systemName: "book")
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
		
		
		
		
		.navigationBarTitleDisplayMode(.inline)
		.edgesIgnoringSafeArea(.top)
		
	}
	
	
	
}

struct editRecipeView_Previews: PreviewProvider {
	static var previews: some View {
		editRecipeView(recipe: .constant(Recipe(recipeImageBase64Encoded: "sample", recipeName: "Pasta Carbonara", time: "25-30 min", calories: 310, ingredients: "", steps: "")))
	}
}



