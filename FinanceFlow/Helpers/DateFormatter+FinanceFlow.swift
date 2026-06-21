import Foundation

extension DateFormatter {
    static let financeFlowShort: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter
    }()
}
