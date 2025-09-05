# Spice Stash

**Spice Stash** is a SwiftUI app for organizing and managing your personal recipe collection. It provides an easy way to add, edit, and view recipes with details like cooking time, calories, and images. 

## Features

📖 **Recipe Grid**: Browse recipes in a clean, responsive grid layout.

➕ **Add Your Own Recipes**: Quickly add new recipes with a plus button.

✏️ **Edit Recipes**: Update names, time, calories, and images through a dedicated editor.

🕒 **Time Input**: Inline picker for specifying preparation/cooking time (hours & minutes).

🖼️ **Image Support**: Upload and display recipe images.

💾 **Data Persistence**: Recipes remain saved between app launches.


## Project Structure

**ContentView**: Displays the recipe grid and manages adding recipes.

**EditRecipeView**: Allows editing of recipe attributes like name, time, calories, and image.

**Recipe Model**: Stores recipe data including Base64-encoded image strings.

**Reusable UI components** for recipe blocks and previews.


## Getting Started

### Prerequisites

macOS with Xcode installed (latest stable version recommended).
Swift 5.9+
iOS 17 SDK or later (runs on simulator or device).


### Build Instructions

#### Clone the repository:
``` git clone https://github.com/RamberGd/spice-stash.git ``` 

``` cd spice-stash ``` 

#### Open the project in Xcode:

``` open spice-stash.xcodeproj``` 

Select a target device or simulator.

Press Run ▶️ in Xcode to build and launch the app.

Roadmap
🔍 Search & filter functionality.
📂 Recipe categorization by tags and favourites.
☁️ Cloud sync support.
License
This project is licensed under the MIT License.
