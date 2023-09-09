import SwiftUI

extension VerticalAlignment: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    private var id: String {
        switch self {
        case .top: return "top"
        case .center: return "center"
        case .bottom: return "bottom"
        case .firstTextBaseline: return "firstTextBaseline"
        case .lastTextBaseline: return "lastTextBaseline"
        default: return "unknown"
        }
    }
}
