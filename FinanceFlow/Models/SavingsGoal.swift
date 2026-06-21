import SwiftUI

struct SavingsGoal: Identifiable {
    let id = UUID()
    let title: String
    let savedAmount: Decimal
    let targetAmount: Decimal
    let tint: Color
    let symbol: String

    var progress: Double {
        guard targetAmount > 0 else { return 0 }
        return min((savedAmount as NSDecimalNumber).doubleValue / (targetAmount as NSDecimalNumber).doubleValue, 1)
    }
}
