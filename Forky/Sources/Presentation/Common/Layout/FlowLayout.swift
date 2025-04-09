import SwiftUI

struct FlowLayout: Layout {
    var alignment: HorizontalAlignment = .leading
    var spacing: CGFloat = 8
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = FlowResult(
            in: proposal.width ?? 0,
            subviews: subviews,
            alignment: alignment,
            spacing: spacing
        )
        return result.size
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = FlowResult(
            in: bounds.width,
            subviews: subviews,
            alignment: alignment,
            spacing: spacing
        )
        
        for (index, line) in result.lines.enumerated() {
            let yOffset = result.yOffsets[index]
            for element in line.elements {
                let xOffset: CGFloat = element.xOffset
                element.subview.place(
                    at: CGPoint(x: bounds.minX + xOffset, y: bounds.minY + yOffset),
                    proposal: ProposedViewSize(element.size)
                )
            }
        }
    }
    
    struct FlowResult {
        struct Element {
            let subview: LayoutSubview
            let size: CGSize
            var xOffset: CGFloat = 0
        }
        
        struct Line {
            var elements: [Element] = []
            var width: CGFloat = 0
        }
        
        let lines: [Line]
        let yOffsets: [CGFloat]
        let size: CGSize
        
        init(in maxWidth: CGFloat, subviews: LayoutSubviews, alignment: HorizontalAlignment, spacing: CGFloat) {
            var lines: [Line] = []
            var currentLine = Line()
            var maxHeight: CGFloat = 0
            
            for subview in subviews {
                let size = subview.sizeThatFits(.unspecified)
                let element = Element(subview: subview, size: size)
                
                if currentLine.elements.isEmpty || currentLine.width + size.width + spacing <= maxWidth {
                    currentLine.elements.append(element)
                    currentLine.width += size.width + (currentLine.elements.count > 1 ? spacing : 0)
                    maxHeight = max(maxHeight, size.height)
                } else {
                    lines.append(currentLine)
                    currentLine = Line(elements: [element], width: size.width)
                    maxHeight = max(maxHeight, size.height)
                }
            }
            
            if !currentLine.elements.isEmpty {
                lines.append(currentLine)
            }
            
            var finalLines = lines
            for i in 0..<finalLines.count {
                let line = finalLines[i]
                let spacing = CGFloat(line.elements.count - 1) * spacing
                let totalWidth = line.width
                var xOffset: CGFloat = 0
                
                switch alignment {
                case .leading:
                    xOffset = 0
                case .center:
                    xOffset = (maxWidth - totalWidth) / 2
                case .trailing:
                    xOffset = maxWidth - totalWidth
                default:
                    break
                }
                
                for j in 0..<line.elements.count {
                    finalLines[i].elements[j].xOffset = xOffset
                    xOffset += line.elements[j].size.width + spacing
                }
            }
            
            self.lines = finalLines
            
            var yOffsets: [CGFloat] = []
            var currentY: CGFloat = 0
            for line in lines {
                yOffsets.append(currentY)
                currentY += maxHeight + spacing
            }
            self.yOffsets = yOffsets
            
            self.size = CGSize(
                width: maxWidth,
                height: currentY - spacing
            )
        }
    }
} 
