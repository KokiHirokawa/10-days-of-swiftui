import SwiftUI

struct MyTextPreferenceKey: PreferenceKey {
    typealias Value = [MyTextPreferenceData]
    
    static var defaultValue: [MyTextPreferenceData] = []
    
    static func reduce(
        value: inout [MyTextPreferenceData],
        nextValue: () -> [MyTextPreferenceData]
    ) {
        value.append(contentsOf: nextValue())
    }
}

struct MyTextPreferenceData: Equatable {
    let viewIdx: Int
    let rect: CGRect
}
