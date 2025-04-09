import SwiftUI

struct IngredientTagsFlowLayout: View {
    let tags: [String]
    let onRemove: (String) -> Void
    
    var body: some View {
        FlowLayout(alignment: .leading, spacing: 8) {
            ForEach(tags, id: \.self) { tag in
                IngredientTagView(ingredient: tag) {
                    onRemove(tag)
                }
            }
        }
    }
} 