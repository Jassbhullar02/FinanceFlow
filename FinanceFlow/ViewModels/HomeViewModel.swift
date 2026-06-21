import Foundation
import SwiftUI

// Supplies static dashboard data for the mock-only home screen.
final class HomeViewModel: ObservableObject {
    let userName = "C Muthu Krishnan"
    let summary = FinancialSummary(
        balance: 25000.40,
        income: 20000.00,
        outcome: 17000.00
    )

    let transactions: [Transaction] = [
        Transaction(merchant: "Adobe Illustrator", subtitle: "Subscription fee", amount: 32, category: .subscriptions),
        Transaction(merchant: "Dribbble", subtitle: "Subscription fee", amount: 15, category: .shopping),
        Transaction(merchant: "Sony Camera", subtitle: "Shopping fee", amount: 200, category: .food),
        Transaction(merchant: "Paypal", subtitle: "Salary", amount: 3200, category: .income)
    ]
}
