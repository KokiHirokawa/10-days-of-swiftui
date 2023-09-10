import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Independent Views") {
                    IndependentViews()
                }
                NavigationLink("Collaborating Views") {
                    CollaboratingViews()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
