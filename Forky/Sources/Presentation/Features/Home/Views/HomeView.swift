import SwiftUI
import ForkyDomain

struct HomeView: View {
    @ObservedObject var coordinator: HomeCoordinator
    @StateObject private var viewModel: HomeViewModel
    
    init(coordinator: HomeCoordinator, useCase: FetchRecipeUseCase) {
        self.coordinator = coordinator
        _viewModel = StateObject(wrappedValue: HomeViewModel(fetchRecipeUseCase: useCase))
    }

    
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            ScrollView {
                VStack(spacing: 20) {
                    recommendSection
                    ingredientSection
                    recommendButton
                    recentRecipeSection
                    popularRecipeSection
                }
                .padding(.horizontal)
            }
            .navigationTitle("지금 가진 재료로\n요리 추천받기")
            .navigationBarTitleDisplayMode(.large)
            .navigationDestination(for: HomeCoordinator.Path.self) { path in
                switch path {
                default:
                    EmptyView()
                }
            }
        }
    }
}

// MARK: - Subviews
private extension HomeView {
    var recommendButton: some View {
        RecommendButton(
            isEnabled: viewModel.canRecommend,
            isLoading: viewModel.isRecommending
        ) {
            Task {
                await viewModel.requestRecommendation()
            }
        }
        .padding(.vertical, 20)
    }
    
    var ingredientSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("가진 재료 입력하기")
                .font(.title2)
                .bold()
            
            VStack(alignment: .leading, spacing: 16) {
                TextField("예: 계란, 감자, 우유", text: $viewModel.ingredientInput)
                    .textFieldStyle(.roundedBorder)
                    .submitLabel(.done)
                    .onSubmit {
                        viewModel.processInput()
                    }
                    .onChange(of: viewModel.ingredientInput) { _, newValue in
                        if newValue.contains(",") {
                            viewModel.processInput()
                        }
                    }
                
                if !viewModel.ingredients.isEmpty {
                    IngredientTagsFlowLayout(tags: viewModel.ingredients) { ingredient in
                        viewModel.removeIngredient(ingredient)
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("최근 사용 재료")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    FlowLayout(alignment: .leading, spacing: 8) {
                        ForEach(viewModel.recentIngredients, id: \.self) { ingredient in
                            Button(action: {
                                viewModel.addRecentIngredient(ingredient)
                            }) {
                                Text(ingredient)
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background {
                                        Capsule()
                                            .strokeBorder(Color.blue, lineWidth: 1)
                                    }
                            }
                        }
                    }
                }
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.05))
            }
        }
    }
    
    var recommendSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("추천 요리")
                .font(.title2)
                .bold()
            
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.1))
                .frame(height: 200)
                .overlay {
                    Text("추천 요리 영역")
                }
        }
    }
    
    var recentRecipeSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("최근 본 레시피")
                .font(.title2)
                .bold()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(0..<5) { _ in
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.gray.opacity(0.1))
                            .frame(width: 150, height: 200)
                            .overlay {
                                Text("레시피")
                            }
                    }
                }
            }
        }
    }
    
    var popularRecipeSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("인기 레시피")
                .font(.title2)
                .bold()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(0..<5) { _ in
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.gray.opacity(0.1))
                            .frame(width: 150, height: 200)
                            .overlay {
                                Text("레시피")
                            }
                    }
                }
            }
        }
        .padding(.bottom, 20)
    }
} 
