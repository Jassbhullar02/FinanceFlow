import Foundation

enum CurrencyFormatter {
    static let dollars: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        formatter.maximumFractionDigits = 2
        return formatter
    }()

    static func string(from amount: Decimal) -> String {
        dollars.string(from: amount as NSDecimalNumber) ?? "$0.00"
    }
}
