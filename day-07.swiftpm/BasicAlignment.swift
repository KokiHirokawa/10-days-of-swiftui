import SwiftUI

struct BasicAlignment: View {

    @State private var verticalAlignment: VerticalAlignment = .center

    var body: some View {
        VStack(spacing: 32) {
            HStack(alignment: verticalAlignment) {
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                    .padding(.vertical, 16)

                Image(systemName: "faceid")

                Text("What's up?")
            }
            .border(.gray)
            .animation(.easeInOut, value: verticalAlignment)

            Picker(
                "Vertical Alignment",
                selection: $verticalAlignment
            ) {
                Text("top").tag(VerticalAlignment.top)
                Text("center").tag(VerticalAlignment.center)
                Text("bottom").tag(VerticalAlignment.bottom)
                Text("firstTextBaseline").tag(VerticalAlignment.firstTextBaseline)
                Text("lastTextBaseline").tag(VerticalAlignment.lastTextBaseline)
            }
            .pickerStyle(.wheel)
        }
        .padding()
    }
}

#Preview {
    BasicAlignment()
}
