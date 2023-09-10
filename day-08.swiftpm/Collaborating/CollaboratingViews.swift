import SwiftUI

struct CollaboratingViews: View {
    
    @State private var activeMonth = Month.january
    @State private var rects: [CGRect] = .init(
        repeating: .init(),
        count: Month.allCases.count
    )
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth: 3)
                .foregroundStyle(.green)
                .frame(width: rects[activeMonth.idx].size.width, height: rects[activeMonth.idx].size.height)
                .offset(x: rects[activeMonth.idx].minX, y: rects[activeMonth.idx].minY)
                .animation(.easeInOut(duration: 0.3), value: activeMonth)
            
            VStack {
                Spacer()
                
                HStack {
                    ForEach([
                        Month.january,
                        Month.february,
                        Month.march,
                        Month.april
                    ]) {
                        CollaboratingMonthView(activeMonth: $activeMonth, month: $0)
                    }
                }
                
                Spacer()
                
                HStack {
                    ForEach([
                        Month.may,
                        Month.june,
                        Month.july,
                        Month.august
                    ]) {
                        CollaboratingMonthView(activeMonth: $activeMonth, month: $0)
                    }
                }
                
                Spacer()
                
                HStack {
                    ForEach([
                        Month.september,
                        Month.october,
                        Month.november,
                        Month.december
                    ]) {
                        CollaboratingMonthView(activeMonth: $activeMonth, month: $0)
                    }
                }
                
                Spacer()
            }
            .onPreferenceChange(MyTextPreferenceKey.self) { preferences in
                for p in preferences {
                    self.rects[p.viewIdx] = p.rect
                }
            }
        }
        .coordinateSpace(name: Const.coordinatorSpaceName)
    }
}

extension CollaboratingViews {
    enum Const {
        static let coordinatorSpaceName = "myZStack"
    }
}

struct CollaboratingViews_Previews: PreviewProvider {
    static var previews: some View {
        CollaboratingViews()
    }
}
