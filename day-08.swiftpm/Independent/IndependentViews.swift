import SwiftUI

struct IndependentViews: View {
    
    @State private var activeMonth = Month.january
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                ForEach([
                    Month.january,
                    Month.february,
                    Month.march,
                    Month.april
                ]) {
                    IndependentMonthView(activeMonth: $activeMonth, month: $0)
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
                    IndependentMonthView(activeMonth: $activeMonth, month: $0)
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
                    IndependentMonthView(activeMonth: $activeMonth, month: $0)
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    IndependentViews()
}
