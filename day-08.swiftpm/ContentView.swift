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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
