import SwiftUI

struct ContentView: View {

    @State private var appearance: Appearance = .auto
    @State private var isRestNotificationEnabled = false

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("外観", selection: $appearance) {
                        ForEach(Appearance.allCases, id: \.self) {
                            Text($0.description).tag($0)
                        }
                    }
                    .pickerStyle(.automatic)

                    Label {
                        Text("Label")
                    } icon: {
                        Image(systemName: "42.circle")
                    }

                    HStack {
                        Text("外部リンク")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                }

                Section {
                    NavigationLink {
                        Text("フィードバックを共有")
                    } label: {
                        LabeledContent("フィードバックを共有") {
                            Image(systemName: "text.bubble")
                        }
                    }

                    ZStack {
                        NavigationLink {
                            Text("Hello")
                        } label: {
                            LabeledContent("Custom Value") {
                                Text("Hello")
                            }
                        }
                        .opacity(0)

                        LabeledContent("Custom Value") {
                            Text("Hello")
                        }
                    }

                    NavigationLink {
                        Text("ヘルプを参照")
                    } label: {
                        Text("ヘルプを参照")
                    }
                }

                Section {
                    VStack(alignment: .leading) {
                        Toggle("休憩を取るように通知する", isOn: $isRestNotificationEnabled)
                        Text(isRestNotificationEnabled ? "オン" : "オフ")
                            .font(.caption)
                    }
                }

                Section {
                    LabeledContent {
                        Text("20KB")
                    } label: {
                        Button("キャッシュをクリア") {}
                    }
                }
            }
        }
    }
}

enum Appearance: CaseIterable {
    case auto
    case dark
    case light

    var description: String {
        switch self {
        case .auto: return "自動"
        case .dark: return "ダーク"
        case .light: return "ライト"
        }
    }
}

#Preview {
    ContentView()
}
