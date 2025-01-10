//
//  food_untitledApp.swift
//  food-untitled
//
//  Created by Maksim Ter-Avakian on 01/07/2024.
//

import SwiftUI

@main
struct spice_stashApp: App {
	@StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
			ContentView()
				.environment(\.managedObjectContext, dataController.container.viewContext)
				
        }
    }
}
