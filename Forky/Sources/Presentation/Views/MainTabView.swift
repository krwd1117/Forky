import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Tab = .home
    @StateObject private var homeCoordinator = HomeCoordinator()
    
    init() {}
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeView(coordinator: homeCoordinator)
                    .tag(Tab.home)
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
