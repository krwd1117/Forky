import SwiftUI

struct RecipeView: View {
    @ObservedObject private var recipeCoordinator = RecipeCoordinator()
    
    var body: some View {
        Text("Hello, World!")
    }
}
