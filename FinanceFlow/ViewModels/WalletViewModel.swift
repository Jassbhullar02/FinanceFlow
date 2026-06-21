import Foundation
import SwiftUI

// Supplies mock wallet, transaction, and savings data for WalletView.
final class WalletViewModel: ObservableObject {
    let wallet = Wallet(
        holderName: "Zarror Nibros",
        cardNumberSuffix: "3456",
        balance: 10000.00
    )

    let transactions: [Transaction] = [
        Transaction(merchant: "Dribbble", subtitle: "Subscription fee", amount: 15, category: .shopping),
        Transaction(merchant: "House", subtitle: "Saving", amount: 50, category: .savings),
        Transaction(merchant: "Sony Camera", subtitle: "Shopping fee", amount: 200, category: .food),
        Transaction(merchant: "Paypal", subtitle: "Salary", amount: 32, category: .income),
        Transaction(merchant: "Car", subtitle: "Saving", amount: 40, category: .transport)
    ]

    let savings: [SavingsGoal] = [
        SavingsGoal(title: "Iphone 13 Mini", savedAmount: 350, targetAmount: 699, tint: .ffLavender, symbol: "iphone"),
        SavingsGoal(title: "Macbook Pro M1", savedAmount: 900, targetAmount: 1499, tint: .ffLavender, symbol: "laptopcomputer"),
        SavingsGoal(title: "House", savedAmount: 30500, targetAmount: 65000, tint: .ffLavender, symbol: "house.fill"),
        SavingsGoal(title: "Car", savedAmount: 10000, targetAmount: 20000, tint: .ffLavender, symbol: "car.fill")
    ]
}
