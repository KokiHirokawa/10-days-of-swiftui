import SwiftUI

struct ContentView: View {

    @EnvironmentObject private var appDelegate: AppDelegate

    var body: some View {
        Text("Placeholder")
            .foregroundStyle(Color("hotpink", bundle: .module))
            .onAppear {
                print(type(of: appDelegate))
            }
    }
}

#Preview {
    ContentView()
}
