import SwiftUI

public struct SplashView: View {
    @StateObject private var viewModel = SplashViewModel()
    
    public init() {}
    
    public var body: some View {
        Group {
            if viewModel.isFinished {
                MainTabView()
            } else {
                content
            }
        }
    }
    
    private var content: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image(systemName: "fork.knife.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                
                Text("Forky")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                
                if viewModel.isLoading {
                    ProgressView()
                        .tint(.white)
                }
            }
        }
    }
} 
