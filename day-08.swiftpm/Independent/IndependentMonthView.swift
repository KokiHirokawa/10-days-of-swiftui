import SwiftUI

struct IndependentMonthView: View {
    
    @Binding var activeMonth: Month
    
    let month: Month
    
    var body: some View {
        Text(month.description)
            .padding(10)
            .background(MonthBorder(show: activeMonth == month))
            .onTapGesture {
                activeMonth = month
            }
    }
}

private struct MonthBorder: View {
    
    let show: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .stroke(lineWidth: 3)
            .foregroundStyle(show ? .red : .clear)
            .animation(.easeInOut(duration: 0.3), value: show)
    }
}
