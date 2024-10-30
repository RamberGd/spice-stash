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


struct Recipe: Identifiable {
	let id = UUID()
	var previewImage: String // Will store base64 image string
	var recipeName: String
	var time: String
	var calories: Int16
	var imageData: Data? = nil // Optional, for EditRecipeView's image handling
}
