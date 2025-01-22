//
//  modelData.swift
//  spice-stash
//
//  Created by Maksim Ter-Avakian on 21/01/2025.
//

import Foundation



func loadRecipes() -> [Recipe] {
	guard let url = Bundle.main.url(forResource: "recipesJSON", withExtension: "json"),
		  let data = try? Data(contentsOf: url) else {
		return []
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
	} catch {
		print("Error saving JSON: \(error)")
	}
}
