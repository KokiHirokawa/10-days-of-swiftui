import SwiftUI

struct ContentView: View {

    @State private var activeIdx = 0

    var body: some View {
        VStack {
            Spacer()

            HStack {
                MonthView(activeMonth: $activeIdx, label: "January", idx: 0)
                MonthView(activeMonth: $activeIdx, label: "February", idx: 1)
                MonthView(activeMonth: $activeIdx, label: "March", idx: 2)
                MonthView(activeMonth: $activeIdx, label: "April", idx: 3)
            }

            Spacer()

            HStack {
                MonthView(activeMonth: $activeIdx, label: "May", idx: 4)
                MonthView(activeMonth: $activeIdx, label: "June", idx: 5)
                MonthView(activeMonth: $activeIdx, label: "July", idx: 6)
                MonthView(activeMonth: $activeIdx, label: "August", idx: 7)
            }

            Spacer()

            HStack {
                MonthView(activeMonth: $activeIdx, label: "September", idx: 8)
                MonthView(activeMonth: $activeIdx, label: "October", idx: 9)
                MonthView(activeMonth: $activeIdx, label: "November", idx: 10)
                MonthView(activeMonth: $activeIdx, label: "December", idx: 11)
            }

            Spacer()
        }
        .backgroundPreferenceValue(MyTextPreferenceKey.self) { value in
            GeometryReader { geometry in
                createBorder(geometry, value)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
        }
    }

    func createBorder(_ geometry: GeometryProxy, _ preferences: [MyTextPreferenceData]) -> some View {
        let p = preferences.first { $0.viewIdx == activeIdx }
        let bounds = p != nil ? geometry[p!.bounds] : .zero

        return RoundedRectangle(cornerRadius: 15)
            .stroke(lineWidth: 3)
            .foregroundStyle(.green)
            .frame(width: bounds.size.width, height: bounds.size.height)
            .fixedSize()
            .offset(x: bounds.minX, y: bounds.minY)
            .animation(.easeInOut(duration: 0.3), value: activeIdx)
    }
}

#Preview {
    ContentView()
}
