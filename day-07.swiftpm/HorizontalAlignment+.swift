import SwiftUI

extension HorizontalAlignment: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    private var id: String {
        switch self {
        case .leading: return "leading"
        case .center: return "center"
        case .trailing: return "trailing"
        default: return "unknown"
        }
    }
}
