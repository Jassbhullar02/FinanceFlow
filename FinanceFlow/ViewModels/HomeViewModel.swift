import Foundation
import SwiftUI

final class HomeViewModel: ObservableObject {
    let userName = "C Muthu Krishnan"
    let summary = FinancialSummary(
        balance: 25000.40,
        income: 20000.00,
        outcome: 17000.00,
        earnings: [
            EarningPoint(day: "Mon", value: 0.42),
            EarningPoint(day: "Tue", value: 0.66),
            EarningPoint(day: "Wed", value: 0.48),
            EarningPoint(day: "Thu", value: 0.88),
            EarningPoint(day: "Fri", value: 0.72),
            EarningPoint(day: "Sat", value: 0.94),
            EarningPoint(day: "Sun", value: 0.57)
        ]
    )

    let savings: [SavingsGoal] = [
        SavingsGoal(title: "Iphone 13 Mini", savedAmount: 300, targetAmount: 699, tint: .ffPrimary, symbol: "iphone"),
        SavingsGoal(title: "Macbook Pro M1", savedAmount: 300, targetAmount: 1499, tint: .ffPink, symbol: "laptopcomputer")
    ]

    let transactions: [Transaction] = [
        Transaction(merchant: "Adobe Illustrator", subtitle: "Subscription fee", amount: 32, date: .now, category: .subscriptions, isCredit: false),
        Transaction(merchant: "Dribbble", subtitle: "Subscription fee", amount: 15, date: .now, category: .shopping, isCredit: false),
        Transaction(merchant: "Sony Camera", subtitle: "Shopping fee", amount: 200, date: .now, category: .food, isCredit: false),
        Transaction(merchant: "Paypal", subtitle: "Salary", amount: 3200, date: .now, category: .income, isCredit: true)
    ]
}
