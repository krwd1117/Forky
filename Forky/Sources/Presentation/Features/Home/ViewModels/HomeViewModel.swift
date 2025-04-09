import SwiftUI
import ForkyDomain

final class HomeViewModel: ObservableObject {
    // MARK: - Properties
    private let fetchRecipeUseCase: FetchRecipeUseCase
    
    @Published var ingredientInput = ""
    @Published var ingredients: [String] = []
    let recentIngredients = ["계란", "감자", "양파", "당근", "우유"]
    
    @Published var isRecommending = false
    var canRecommend: Bool {
        !ingredients.isEmpty && !isRecommending
    }
    
    @Published var selectedEquipment: [String] = ["프라이팬"]
    @Published var avoidIngredients: [String] = []
    @Published var maxCookingTime: Int = 30
    @Published var selectedMealType: String = "점심"
    @Published var selectedDietType: String = "일반식"
    
    let mealTypes = ["아침", "점심", "저녁", "간식"]
    let dietTypes = ["일반식", "채식", "저탄수화물", "저칼로리", "글루텐프리"]
    
    @Published var recommendedRecipes: [Recipe] = []
    @Published var error: Error?
    
    init(fetchRecipeUseCase: FetchRecipeUseCase) {
        self.fetchRecipeUseCase = fetchRecipeUseCase
    }
    
    // MARK: - Ingredient Management
    func addIngredient(_ ingredient: String) {
        let trimmed = ingredient.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty,
              !ingredients.contains(trimmed) else { return }
        ingredients.append(trimmed)
        ingredientInput = ""
    }
    
    func removeIngredient(_ ingredient: String) {
        ingredients.removeAll { $0 == ingredient }
    }
    
    func processInput() {
        let newIngredients = ingredientInput
            .components(separatedBy: [",", "\n"])
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
        
        newIngredients.forEach { addIngredient($0) }
    }
    
    func addRecentIngredient(_ ingredient: String) {
        addIngredient(ingredient)
    }
    
    // MARK: - Recommendation
    @MainActor
    func requestRecommendation() async {
        
        isRecommending = true
        defer { isRecommending = false }
        
        do {
            let request = RecipeRequest(
                ingredients: ingredients,
                equipment: selectedEquipment,
                avoid: avoidIngredients,
                maxCookingTime: maxCookingTime,
                mealType: selectedMealType,
                diet: selectedDietType
            )
            let response = try await fetchRecipeUseCase.execute(recipeRequest: request)
            self.recommendedRecipes = response.recipes
        } catch {
            self.error = error
            self.recommendedRecipes = []
        }
        
        
//        isRecommending = true
//        defer { isRecommending = false }
        
//        do {
//            let request = RecipeRequest(
//                ingredients: ingredients,
//                equipment: selectedEquipment,
//                avoid: avoidIngredients,
//                maxCookingTime: maxCookingTime,
//                mealType: selectedMealType,
//                diet: selectedDietType
//            )
//            
//            let response = try await recipeAPIRepository.recommendRecipes(request)
//            self.recommendedRecipes = response.recipes
//            self.error = nil
//            
//        } catch {
//            self.error = error
//            self.recommendedRecipes = []
//        }
    }
} 
