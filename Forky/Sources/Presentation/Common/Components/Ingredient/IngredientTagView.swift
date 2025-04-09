import SwiftUI

struct IngredientTagView: View {
    let ingredient: String
    let onRemove: () -> Void
    
    var body: some View {
        HStack(spacing: 4) {
            Text(ingredient)
                .font(.subheadline)
                .foregroundColor(.primary)
            
            Button(action: onRemove) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background {
            Capsule()
                .fill(Color.gray.opacity(0.1))
        }
    }
} 