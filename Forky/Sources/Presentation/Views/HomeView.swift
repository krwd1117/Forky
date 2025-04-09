import SwiftUI

struct HomeView: View {
    @ObservedObject var coordinator: HomeCoordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            Text("Home")
            .navigationTitle("홈")
            .navigationDestination(for: HomeCoordinator.Path.self) { path in
                switch path {
                default:
                    EmptyView()
                }
            }
        }
    }
}

struct HomeDetailView: View {
    let id: Int
    
    var body: some View {
        Text("상세 페이지 \(id)")
            .navigationTitle("상세")
    }
}

struct HomeSettingsView: View {
    var body: some View {
        Text("설정")
            .navigationTitle("설정")
    }
} 
