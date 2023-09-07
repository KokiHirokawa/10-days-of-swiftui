import SwiftUI

struct Landmark {
    let name: String
    let park: String
    let isFeatured: Bool
    private let imageName: String

    init(
        name: String,
        park: String,
        isFeatured: Bool,
        imageName: String
    ) {
        self.name = name
        self.park = park
        self.isFeatured = isFeatured
        self.imageName = imageName
    }

    var image: Image? {
        Image(imageName)
    }

    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
}
