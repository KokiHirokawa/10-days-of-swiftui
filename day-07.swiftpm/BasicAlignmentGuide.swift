import SwiftUI

struct BasicAlignmentGuide: View {

    @State private var stackAlignmentGuide: HorizontalAlignment = .center
    @State private var redBoxAlignmentGuide: HorizontalAlignment = .center
    @State private var redBoxAlignmentOffset: HorizontalAlignment = .center

    var body: some View {
        VStack(spacing: 32) {
            VStack(alignment: stackAlignmentGuide, spacing: 8) {
                redBox

                Text("W 150")
                    .frame(width: 150)
                    .background(.green)
                    .border(.gray)

                Text("W 200")
                    .frame(width: 200)
                    .background(.orange)
                    .border(.gray)
            }
            .border(.gray)
            .animation(.easeInOut, value: stackAlignmentGuide)

            Picker(
                "Stack Horizontal Alignment",
                selection: $stackAlignmentGuide
            ) {
                Text("leading").tag(HorizontalAlignment.leading)
                Text("center").tag(HorizontalAlignment.center)
                Text("trailing").tag(HorizontalAlignment.trailing)
            }
            .pickerStyle(.segmented)

            Picker(
                "Red Box Alignment Guide",
                selection: $redBoxAlignmentGuide
            ) {
                Text("leading").tag(HorizontalAlignment.leading)
                Text("center").tag(HorizontalAlignment.center)
                Text("trailing").tag(HorizontalAlignment.trailing)
            }
            .pickerStyle(.segmented)

            Picker(
                "Red Box Alignment Offset",
                selection: $redBoxAlignmentOffset
            ) {
                Text("leading").tag(HorizontalAlignment.leading)
                Text("center").tag(HorizontalAlignment.center)
                Text("trailing").tag(HorizontalAlignment.trailing)
            }
            .pickerStyle(.segmented)
        }
        .padding()
    }

    var redBox: some View {
        Text("W 100")
            .frame(width: 100)
            .background(.red)
            .alignmentGuide(redBoxAlignmentGuide) { d in d[redBoxAlignmentOffset] }
            .border(.gray)
            .animation(.easeInOut, value: redBoxAlignmentGuide)
            .animation(.easeInOut, value: redBoxAlignmentOffset)
    }
}

#Preview {
    BasicAlignmentGuide()
}
