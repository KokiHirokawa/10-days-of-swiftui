import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            section1
            section2
            section3
        }
    }

    var section1: some View {
        Section {
            HStack(alignment: .center) {
                Text("Delicious")
                    .border(.red)
                Image(systemName: "faceid")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .border(.red)
                Text("Avocado Toast")
                    .border(.red)
            }
            .border(.blue)

            HStack(alignment: .bottom) {
                Text("Delicious")
                    .border(.red)
                Image(systemName: "faceid")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .border(.red)
                Text("Avocado Toast")
                    .border(.red)
            }
            .lineLimit(1)
            .frame(width: 200)
            .border(.blue)

            HStack(alignment: .bottom) {
                Text("Delicious")
                    .border(.red)
                Image(systemName: "faceid")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .border(.red)
                Text("Avocado Toast")
                    .border(.red)
                    .layoutPriority(1)
            }
            .lineLimit(1)
            .frame(width: 200)
            .border(.blue)

            HStack(alignment: .bottom) {
                Text("Delicious")
                    .border(.red)
                Image(systemName: "faceid")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .border(.red)
                Text("Avocado Toast")
                    .frame(width: 140)
                    .border(.red)
            }
            .lineLimit(1)
            .frame(width: 100, alignment: .leading)
            .border(.blue)

            HStack(alignment: .bottom) {
                Text("Delicious")
                    .border(.red)
                Image(systemName: "faceid")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .border(.red)
                Text("Avocado Toast")
                    .frame(width: 140)
                    .border(.red)
            }
            .lineLimit(1)
            .frame(width: 100, alignment: .leading)
            .border(.blue)
            .clipped()
        }
    }

    var section2: some View {
        Section {
            HStack(alignment: .bottom) {
                Text("Delicious")
                    .font(.caption)
                Image(systemName: "faceid")
                    .resizable()
                    .frame(width: 40, height: 40)
                Text("Avocado Toast")
            }
            .lineLimit(1)

            HStack(alignment: .lastTextBaseline) {
                Text("Delicious")
                    .font(.caption)
                Image(systemName: "faceid")
                    .resizable()
                    .frame(width: 40, height: 40)
                Text("Avocado Toast")
            }
            .lineLimit(1)

            HStack(alignment: .lastTextBaseline) {
                Text("Delicious")
                    .font(.caption)
                Image(systemName: "faceid")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .alignmentGuide(.lastTextBaseline) { d in
                        d[.bottom] * 0.927
                    }
                Text("Avocado Toast")
            }
            .lineLimit(1)

            HStack(alignment: .lastTextBaseline) {
                Text("Delicious")
                    .font(.caption)
                Image(systemName: "faceid")
                Text("Avocado Toast")
            }
            .lineLimit(1)
        }
    }

    var section3: some View {
        Section {
            HStack(alignment: .center) {
                VStack {
                    Text("★★★★★")
                    Text("5 stars")
                }
                .font(.caption)

                VStack(alignment: .leading, spacing: 16) {
                    Text("Avocado Toast")
                        .font(.title)
                    Text("Ingredients: Avocado, Almond Butter, Bread, Red Pepper Flakes")
                        .font(.caption)
                        .lineLimit(1)
                }
            }

            HStack(alignment: .midStarAndTitle) {
                VStack {
                    Text("★★★★★")
                    Text("5 stars")
                }
                .font(.caption)

                VStack(alignment: .leading, spacing: 16) {
                    Text("Avocado Toast")
                        .font(.title)

                    Text("Ingredients: Avocado, Almond Butter, Bread, Red Pepper Flakes")
                        .font(.caption)
                        .lineLimit(1)
                }
            }

            HStack(alignment: .bottom) {
                VStack {
                    Text("★★★★★")
//                        .alignmentGuide(.bottom) { d in d[.bottom] * 0.5 }
                    Text("5 stars")
                }
                .font(.caption)
                .alignmentGuide(.bottom) { d in d[.bottom] * 0.5 }

                VStack(alignment: .leading, spacing: 16) {
                    Text("Avocado Toast")
                        .font(.title)
                        .alignmentGuide(.bottom) { d in d[.bottom] }

                    Text("Ingredients: Avocado, Almond Butter, Bread, Red Pepper Flakes")
                        .font(.caption)
                        .lineLimit(1)
                }
            }

            HStack(alignment: .midStarAndTitle) {
                VStack {
                    Text("★★★★★")
//                        .alignmentGuide(.midStarAndTitle) { d in d[.bottom] / 2 }
                        .alignmentGuide(.midStarAndTitle) { d in d[VerticalAlignment.center] }
                    Text("5 stars")
                }
                .font(.caption)

                VStack(alignment: .leading, spacing: 16) {
                    Text("Avocado Toast")
                        .font(.title)
//                        .alignmentGuide(.midStarAndTitle) { d in d[.bottom] / 2 }
                        .alignmentGuide(.midStarAndTitle) { d in d[VerticalAlignment.center] }

                    Text("Ingredients: Avocado, Almond Butter, Bread, Red Pepper Flakes")
                        .font(.caption)
                        .lineLimit(1)
                }
            }
        }
    }
}

extension VerticalAlignment {
    private enum MidStarAndTitle: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.bottom]
        }
    }

    static let midStarAndTitle = VerticalAlignment(MidStarAndTitle.self)
}

#Preview {
    ContentView()
}
