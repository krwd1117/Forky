import SwiftUI

public struct MainTabView: View {
    @EnvironmentObject var container: DIContainer
    @State private var selectedTab: Tab = .home
    @StateObject private var homeCoordinator = HomeCoordinator()
    
    init() {}
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeView(coordinator: homeCoordinator, useCase: container.useCase.fetchRecipe)
                    .tag(Tab.home)
                
                RecipeView()
                    .tag(Tab.recipe)
            }
            .ignoresSafeArea(edges: .bottom)
            
            CustomTabBar(selectedTab: $selectedTab)
                .padding(.horizontal)
                .padding(.bottom, 20)
        }
        .onChange(of: selectedTab) { _, _ in
            // 탭 전환 시 현재 선택된 탭의 네비게이션 스택 초기화
            switch selectedTab {
            case .home:
                homeCoordinator.resetPath()
            default:
                EmptyView()
            }
        }
    }
} 
