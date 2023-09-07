import SwiftUI

struct PageView<Page: View>: View {

    var pages: [Page]
    @State var currentPage = 0

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }
}

#Preview {
    PageView(
        pages: [
            FeatureCard(
                landmark: .init(
                    name: "Turtle Rock",
                    park: "Joshua Tree National Park",
                    isFeatured: true,
                    imageName: "turtlerock"
                )
            ),
            FeatureCard(
                landmark: .init(
                    name: "St. Mary Lake",
                    park: "Glacier National Park",
                    isFeatured: true,
                    imageName: "stmarylake"
                )
            ),
            FeatureCard(
                landmark: .init(
                    name: "Charley Rivers",
                    park: "Charley Rivers National Preserve",
                    isFeatured: true,
                    imageName: "charleyrivers"
                )
            ),
        ]
    )
    .aspectRatio(3 / 2, contentMode: .fit)
}
