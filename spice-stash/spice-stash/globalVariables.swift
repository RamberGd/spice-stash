//
//  globalVariables.swift
//  food-untitled
//
//  Created by Maksim Ter-Avakian on 13/09/2024.
//

import Foundation
import SwiftUI


// This file contains all the global variables for the app for easier access



let defaultBlack: Color = Color(hex: 0x1E1E1E)
let defaultWhite: Color = Color(hex: 0xF2F4F3)


struct Recipe: Identifiable{
	let id = UUID()
	var recipeImageBase64Encoded: String // Will store base64 image string
	var recipeName: String
	var time: String
	var calories: Int16
	var recipeImageData: Data? = nil // Optional, for EditRecipeView's image handling
	var wasOpened: Bool = false
	
}

enum customFont {
	static let interRegular = "Inter-Regular"
	static let interBold = "Inter-Bold"
}

extension Font {
	// Text Styles
	static func titleDefault() -> Font {
		.custom(spice_stash.customFont.interBold, size: 25)
	}
	
	
	static func ImportantDefault() -> Font {
		.custom(spice_stash.customFont.interRegular, size: 14)
	}
	
	static func fontRegularBoldDefault	() -> Font {
		.custom(spice_stash.customFont.interBold, size: 12)
	}
	
	static func fontRegularDefault	() -> Font {
		.custom(spice_stash.customFont.interBold, size: 12)
	}


}
