import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationStack {
            List {
                NavigationLink("RadialLayout") {
                    MyCustomLayout()
                }
                NavigationLink("EqualWidthStack") {
                    MyCustomLayout2()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
