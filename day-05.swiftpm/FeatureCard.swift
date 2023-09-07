import SwiftUI

struct FeatureCard: View {

    var landmark: Landmark

    var body: some View {
        landmark.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay {
                TextOverlay(landmark: landmark)
            }
    }
}

struct TextOverlay: View {

    var landmark: Landmark

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundStyle(.white)
    }

    var gradient: LinearGradient {
        .linearGradient(
            colors: [.black.opacity(0.6), .black.opacity(0)],
            startPoint: .bottom,
            endPoint: .center
        )
    }
}

#Preview {
    FeatureCard(
        landmark: .init(
            name: "Turtle Rock",
            park: "Joshua Tree National Park",
            isFeatured: true,
            imageName: "turtlerock"
        )
    )
}
