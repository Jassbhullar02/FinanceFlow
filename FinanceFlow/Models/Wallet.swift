import Foundation

struct Wallet {
    let holderName: String
    let cardNumberSuffix: String
    let balance: Decimal
    let monthlyLimit: Decimal
    let spentThisMonth: Decimal

    var spendProgress: Double {
        guard monthlyLimit > 0 else { return 0 }
        return min((spentThisMonth as NSDecimalNumber).doubleValue / (monthlyLimit as NSDecimalNumber).doubleValue, 1)
    }
}
