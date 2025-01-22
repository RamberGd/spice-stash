//
//  modelData.swift
//  spice-stash
//
//  Created by Maksim Ter-Avakian on 21/01/2025.
//

import Foundation



func loadRecipes() -> [Recipe] {
	let fileManager = FileManager.default
	let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
	let fileURL = documentsDirectory.appendingPathComponent("recipesJSON.json")
	var data: Data
	
	if fileManager.fileExists(atPath: fileURL.path) {
		// Load from documents directory
		do {
			data = try Data(contentsOf: fileURL)
			print("Loaded recipes from documents directory")
		} catch {
			print("Error loading data from documents directory: \(error)")
			return []
		}
	} else {
		// Load from app bundle
		guard let bundleURL = Bundle.main.url(forResource: "recipesJSON", withExtension: "json"),
			  let bundleData = try? Data(contentsOf: bundleURL) else {
			return []
		}
		data = bundleData
		print("Loaded recipes from app bundle")
	}
	
	do {
		return try JSONDecoder().decode([Recipe].self, from: data)
	} catch {
		print("Error decoding JSON: \(error)")
		return []
	}
}


func saveRecipes(_ recipesArr: [Recipe]) {
	do {
		let data = try JSONEncoder().encode(recipesArr)
		let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
		let fileURL = documentsDirectory.appendingPathComponent("recipesJSON.json")
		try data.write(to: fileURL)
		print("saved")
	} catch {
		print("Error saving JSON: \(error)")
	}
}
