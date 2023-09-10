import SwiftUI

struct CollaboratingMonthView: View {
    
    @Binding var activeMonth: Month
    
    let month: Month
    
    var body: some View {
        Text(month.description)
            .padding(10)
            .background(MyPreferenceViewSetter(idx: month.idx))
            .onTapGesture { activeMonth = month }
    }
}

private struct MyPreferenceViewSetter: View {
    
    let idx: Int
    
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(.clear)
                .preference(
                    key: MyTextPreferenceKey.self,
                    value: [.init(viewIdx: idx, rect: geometry.frame(in: .named(CollaboratingViews.Const.coordinatorSpaceName)))]
                )
        }
    }
}

struct CollaboratingMonthView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(Month.allCases) {
            CollaboratingMonthView(
                activeMonth: .constant(.january),
                month: $0
            )
        }
    }
}
