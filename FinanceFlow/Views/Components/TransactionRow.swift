import SwiftUI

struct TransactionRow: View {
    let transaction: Transaction

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: transaction.category.symbol)
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(transaction.category.tint)
                .frame(width: 44, height: 44)
                .background(transaction.category.tint.opacity(0.12), in: RoundedRectangle(cornerRadius: 12, style: .continuous))

            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.merchant)
                    .font(.ffHeadline(16))
                    .foregroundStyle(.ffInk)
                    .lineLimit(1)

                Text(transaction.subtitle)
                    .font(.ffCaption(12))
                    .foregroundStyle(.ffMuted)
                    .lineLimit(1)
            }

            Spacer(minLength: 12)

            VStack(alignment: .trailing, spacing: 4) {
                Text("\(transaction.isCredit ? "+" : "-")\(CurrencyFormatter.string(from: transaction.amount))")
                    .font(.ffHeadline(15))
                    .foregroundStyle(transaction.isCredit ? .ffPrimaryDeep : .ffExpense)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)

                Text(DateFormatter.financeFlowShort.string(from: transaction.date))
                    .font(.ffCaption(12))
                    .foregroundStyle(.ffMuted)
            }
        }
        .padding(.vertical, 8)
    }
}

extension Transaction {
    static let previewExpense = Transaction(
        merchant: "Starbucks",
        subtitle: "Coffee & Snacks",
        amount: Decimal(12.50),
        date: .now,
        category: .food,
        isCredit: false
    )

    static let previewIncome = Transaction(
        merchant: "Salary",
        subtitle: "Monthly Income",
        amount: Decimal(3500),
        date: .now,
        category: .income,
        isCredit: true
    )
}
