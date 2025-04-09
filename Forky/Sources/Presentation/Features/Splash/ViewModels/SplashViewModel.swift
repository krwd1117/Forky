import SwiftUI

final class SplashViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var isFinished = false
    
    init() {
        Task {
            await startInitialSetup()
        }
    }
    
    @MainActor
    private func startInitialSetup() async {
        isLoading = true
        
        // 초기화 작업
        do {
            try await performSetupTasks()
            isFinished = true
        } catch {
            print("초기화 작업 중 오류 발생: \(error)")
        }
        
        isLoading = false
    }
    
    @MainActor
    private func performSetupTasks() async throws {
        // 최소 2초 동안 스플래시 화면 표시
        try await Task.sleep(for: .seconds(2))
        
        isFinished = true
    }
} 
