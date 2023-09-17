import SwiftUI

struct ContentView: View {
    @State private var showsBorder = false

    var body: some View {
        VStack(alignment: .center, spacing: 32) {
            Button {
                print("Tapped")
            } label: {
                buttonLabel
            }

            Toggle(isOn: $showsBorder.animation()) {
                Text("Border")
            }
            .frame(width: 200)
        }
    }

    private var buttonLabel: some View {
        Capsule()
            .fill(.orange)
            .frame(width: 200, height: 48)
            .padding(.horizontal, 20)
            .padding(.vertical, 12) // padding はタップ領域に含まれる
            .overlay {
                Text("Button")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.white)
            }
            .background(alignment: .center) {
                if showsBorder {
                    Rectangle()
                        .stroke(.black, lineWidth: 1.0)
                }
            }
    }
}


#Preview {
    ContentView()
}
