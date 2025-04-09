import SwiftUI

struct RecommendButton: View {
    let isEnabled: Bool
    let isLoading: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if isLoading {
                    ProgressView()
                        .tint(.white)
                } else {
                    Image(systemName: "wand.and.stars")
                        .font(.headline)
                }
                
                Text("Forky에게 추천받기")
                    .font(.headline)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .foregroundColor(.white)
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .fill(isEnabled ? Color.blue : Color.gray)
            }
            .opacity(isEnabled ? 1 : 0.6)
        }
//        .disabled(!isEnabled)
    }
} 
