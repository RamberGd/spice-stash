import SwiftUI
import PhotosUI

struct recipeSampleLine: View {
	var recipeImageBase64Encoded: String
	var recipeName: String
	var time: String
	var deleteBlock: () -> Void
	var openBlock: () -> Void // Action to open the recipe
	
	
	var body: some View {
		
		VStack(alignment: .leading) {
			// Handle the base64 string for preview image
			
			
		
			if let recipeImageData = Data(base64Encoded: recipeImageBase64Encoded),
			   
			
			   let uiImage = UIImage(data: recipeImageData) {
				Image(uiImage: uiImage)
					.resizable()
					.scaledToFill()
					.frame(height: UIScreen.main.bounds.size.height / 9.5)
					.clipShape(RoundedRectangle(cornerRadius: 5))
			} else {
				// Fallback to default image
				Image(systemName: "square.fill")
					.resizable()
					.foregroundStyle(Color(defaultWhite))
				
					.scaledToFill()
					.frame(height: UIScreen.main.bounds.size.height / 9.5)
					.clipShape(RoundedRectangle(cornerRadius: 5))
			}
			
			Text(recipeName)
				.multilineTextAlignment(.leading)
				.font(.custom("Inter", size: 12))
				.foregroundStyle(Color(defaultWhite))
			
			Text(time)
				.font(.custom("Inter", size: 8))
				.fontWeight(.light)
				.multilineTextAlignment(.leading)
				.foregroundStyle(Color.white)
		}
		.frame(width: UIScreen.main.bounds.size.width / 3, height: UIScreen.main.bounds.size.height / 7)
		.clipShape(RoundedRectangle(cornerRadius: 5))
		.padding(15)
		.contextMenu {
			Button(role: .destructive, action: {
				deleteBlock()
			}) {
				Label("Remove", systemImage: "minus.circle")
			}
			//Button(action: {
				
					//Label("Open", systemImage: "book.pages"))
				//}
		}
	}
}


