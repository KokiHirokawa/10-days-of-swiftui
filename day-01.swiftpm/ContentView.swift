import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, SwiftUI")
            .font(.system(size: 32, weight: .bold))
            .foregroundStyle(
                LinearGradient(
                    colors: [.red, .blue, .green, .yellow],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
    }
}

#Preview {
    ContentView()
}
