import SwiftUI

struct ContentView: View {

    let rows = [GridItem(.fixed(30), spacing: 12), GridItem(.fixed(30))]

    @State private var matchDays: [MatchDay] = []
    @State private var matches: [String] = []

    var body: some View {
        VStack {
            emojiGridView
            matchDaysView
        }
        .onAppear {
            reload(matchDayIndex: 0)
        }
    }

    private var emojiGridView: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(0x1f600...0x1f679, id: \.self) { value in
                    Text(String(format: "%x", value))
                        .frame(width: 100)
                        .background(.orange)

                    Text(emoji(value))
                        .font(.largeTitle)
                        .frame(width: 100)
                        .background(.gray)
                }
            }
        }
    }

    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }

    private var matchDaysView: some View {
        VStack(spacing: 16) {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 8) {
                    ForEach(Array(matchDays.enumerated()), id: \.offset) { offset, matchDay in
                        Button {
                            reload(matchDayIndex: offset)
                        } label: {
                            Text(matchDay.title)
                                .font(.system(size: 14, weight: .bold))
                                .foregroundStyle(.white)
                                .frame(height: 30)
                                .padding(.horizontal, 16)
                                .background {
                                    Capsule(style: .continuous)
                                        .fill(matchDay.isSelected ? .pink : .gray)
                                }
                        }
                    }
                }
                .frame(height: 30)
                .padding(.leading, 8)
            }

            VStack(spacing: 16) {
                ForEach(matches, id: \.self) { match in
                    Text(match)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(width: 200, height: 42)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.pink)
                        }
                }
            }
        }
    }

    private func reload(matchDayIndex: Int) {
        let matchDayTitle: (Int) -> String = { "第\($0 + 1)節" }
        let matchDays = (0..<10).map {
            MatchDay(title: matchDayTitle($0), isSelected: $0 == matchDayIndex)
        }
        let matches = (0..<10).map {
            let matchDay = matchDayTitle($0)
            return (0..<3).map { "\(matchDay) 第\($0 + 1)試合" }
        }

        self.matchDays = matchDays
        self.matches = matches[matchDayIndex]
    }
}

extension ContentView {
    private struct MatchDay {
        let title: String
        let isSelected: Bool
    }
}

#Preview {
    ContentView()
}
