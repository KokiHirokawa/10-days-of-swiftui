import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
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
    }
}
