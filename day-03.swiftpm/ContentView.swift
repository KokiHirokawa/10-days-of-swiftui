import SwiftUI

struct ContentView: View {

    @State private var words = [
        "ocean",
        "mountain",
        "forest",
        "desert"
    ]

    var body: some View {
        List(words, id: \.self) { word in
            Text(word)
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button("Go") {
                        print("🚗")
                    }
                    .tint(.green)
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    Button(role: .destructive) {
                        words = words.filter { $0 != word }
                    } label: {
                        Label("Delete", systemImage: "trash.fill")
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
