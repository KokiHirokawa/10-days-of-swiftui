import SwiftUI

struct MonthView: View {

    @Binding var activeMonth: Int
    let label: String
    let idx: Int

    var body: some View {
        Text(label)
            .padding(10)
            .anchorPreference(key: MyTextPreferenceKey.self, value: .bounds) {
                [MyTextPreferenceData(viewIdx: idx, bounds: $0)]
            }
            .onTapGesture {
                activeMonth = idx
            }
    }
}
