import SwiftUI

private enum Flavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry

    var id: Flavor { self }
}

struct ContentView: View {
    @State private var flavor: Flavor = .chocolate

    var body: some View {
        HStack(spacing: 8) {
            ForEach(Flavor.allCases) { flavor in
                Button(flavor.rawValue) {
                    let prevFlavor = self.flavor

                    switch (prevFlavor, flavor) {
                    case (.chocolate, _), (_, .chocolate):
                        withAnimation(.easeInOut(duration: 0.6)) {
                            self.flavor = flavor
                        }
                    default:
                        self.flavor = flavor
                    }
                }
            }
        }
        .padding(.bottom, 32)

        textBySwitch
//        textByZStackAndOpacity
//        textByIf
    }

    private var textBySwitch: some View {
        Group {
            switch flavor {
            case .chocolate:
                Text(Flavor.chocolate.rawValue.uppercased())
            case .vanilla:
                Text(Flavor.vanilla.rawValue.uppercased())
            case .strawberry:
                Text(Flavor.strawberry.rawValue.uppercased())
            }
        }
        .font(.largeTitle)
    }

    private var textByZStackAndOpacity: some View {
        ZStack {
            Text(Flavor.chocolate.rawValue.uppercased())
                .opacity(flavor == .chocolate ? 1 : 0)
                .animation(.easeInOut(duration: 0.6), value: flavor)

            Text(Flavor.vanilla.rawValue.uppercased())
                .opacity(flavor == .vanilla ? 1 : 0)

            Text(Flavor.strawberry.rawValue.uppercased())
                .opacity(flavor == .strawberry ? 1 : 0)
        }
        .font(.largeTitle)
//        .animation(.easeInOut(duration: 1), value: flavor)
    }

    @ViewBuilder
    private var textByIf: some View {
        Group {
            if flavor == .chocolate {
                Text(Flavor.chocolate.rawValue.uppercased())
            }

            if flavor == .vanilla {
                Text(Flavor.vanilla.rawValue.uppercased())
            }

            if flavor == .strawberry {
                Text(Flavor.strawberry.rawValue.uppercased())
            }
        }
        .font(.largeTitle)
    }
}

#Preview {
    ContentView()
}
