import Foundation

struct FinancialSummary {
    let balance: Decimal
    let income: Decimal
    let outcome: Decimal
    let earnings: [EarningPoint]
}

struct EarningPoint: Identifiable {
    let id = UUID()
    let day: String
    let value: Double
}
