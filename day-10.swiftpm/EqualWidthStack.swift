import SwiftUI

struct MyCustomLayout2: View {

    var body: some View {
        EqualWidthHStack {
            Text("Hello")
            Text("My")
            Text("Holiday")
        }
        .border(.gray)
    }
}

/// - Ref: https://developer.apple.com/videos/play/wwdc2022/10056/
struct EqualWidthHStack: Layout {

    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        let maxSize = maxSize(subviews: subviews)
        let spacing = spacing(subviews: subviews)
        let totalSpacing = spacing.reduce(0) { $0 + $1 }

        return CGSize(
            width: maxSize.width * CGFloat(subviews.count) + totalSpacing,
            height: maxSize.height
        )
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        guard !subviews.isEmpty else { return }

        let maxSize = maxSize(subviews: subviews)
        let spacing = spacing(subviews: subviews)

        let placementProposal = ProposedViewSize(width: maxSize.width, height: maxSize.height)
        var x = bounds.minX + maxSize.width / 2

        for index in subviews.indices {
            subviews[index].place(
                at: CGPoint(x: x, y: bounds.midY),
                anchor: .center,
                proposal: placementProposal
            )
            x += maxSize.width + spacing[index]
        }
    }

    private func maxSize(subviews: Subviews) -> CGSize {
        let subviewSizes = subviews.map { $0.sizeThatFits(.unspecified) }
        let maxSize = subviewSizes.reduce(CGSize.zero) { result, subviewSize in
            CGSize(
                width: max(result.width, subviewSize.width),
                height: max(result.height, subviewSize.height)
            )
        }
        return maxSize
    }

    private func spacing(subviews: Subviews) -> [CGFloat] {
        subviews.indices.map { index in
            guard index < subviews.count - 1 else { return 0 }
            return subviews[index].spacing.distance(
                to: subviews[index + 1].spacing,
                along: .horizontal
            )
        }
    }
}

#Preview {
    MyCustomLayout2()
}
