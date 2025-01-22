//
//  extensions.swift
//  food-untitled
//
//  Created by Maksim Ter-Avakian on 13/09/2024.
//

import SwiftUI

extension Color {
	init(hex: Int, opacity: Double = 1) {
		self.init(
			.sRGB,
			red: Double((hex >> 16) & 0xff) / 255,
			green: Double((hex >> 08) & 0xff) / 255,
			blue: Double((hex >> 00) & 0xff) / 255,
			opacity: opacity
		)
	}
}



// https://medium.com/@jakir/use-hex-color-in-swiftui-c19e6ab79220



extension View {
	@available(iOS 17, *)
	func navigationBarTitleTextColor(_ color: Color) -> some View {
		let uiColor = UIColor(color)
		UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
		UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
		return self
	}
}

//https://discussions.apple.com/thread/255346817?sortBy=rank
