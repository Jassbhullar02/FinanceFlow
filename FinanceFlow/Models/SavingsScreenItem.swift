import SwiftUI

// Larger savings card data used by the dedicated Savings screen.
struct SavingsScreenItem: Identifiable {
    let id = UUID()
    let title: String
    let saved: Decimal
    let target: Decimal
    let progress: Double
    let daysLeft: String
    let tint: Color
    let symbol: String
    let showTitle: Bool
}
