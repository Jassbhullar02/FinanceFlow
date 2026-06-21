import SwiftUI

// Dashboard screen that composes the Figma-matched home layout.
struct HomeDashboardView: View {
    @StateObject var viewModel: HomeViewModel

    private let savingsColumns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]

    var body: some View {
        ZStack {
            Color.ffSurface.ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    header
                        .padding(.top, 45)
                        .padding(.bottom, 18)

                    ScreenshotBalanceCard(balance: viewModel.summary.balance)
                        .padding(.bottom, 14)

                    ScreenshotIncomeOutcomeStrip(
                        income: viewModel.summary.income,
                        outcome: viewModel.summary.outcome
                    )
                    .padding(.bottom, 29)

                    earningsSection
                        .padding(.bottom, 29)

                    savingsSection
                        .padding(.bottom, 27)

                    transactionsSection
                }
                .padding(.horizontal, 23)
                .padding(.bottom, 24)
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        // Greeting row with avatar and notification affordance.
        HStack(alignment: .center, spacing: 8) {
            avatar

            VStack(alignment: .leading, spacing: 3) {
                Text("Good Morning!")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(.ffInk)

                Text(viewModel.userName)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(.ffInk)
                    .lineLimit(1)
            }

            Spacer()

            ZStack(alignment: .topTrailing) {
                Image(systemName: "bell")
                    .font(.system(size: 21, weight: .medium))
                    .foregroundStyle(.ffInk)

                Circle()
                    .fill(.ffExpense)
                    .frame(width: 6, height: 6)
                    .offset(x: 1, y: 2)
            }
            .frame(width: 30, height: 30)
        }
    }

    private var avatar: some View {
        ZStack {
            Circle()
                .fill(.ffWarning)

            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 26, weight: .semibold))
                .foregroundStyle(.ffInk.opacity(0.8), .white)
        }
        .frame(width: 28, height: 28)
    }

    private var earningsSection: some View {
        // Horizontally scrolling earning cards match the target design crop.
        VStack(alignment: .leading, spacing: 13) {
            sectionHeader("Earnings")

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 14) {
                    ScreenshotEarningCard(initial: "U", title: "Upwork", amount: "$ 3,000", tint: .ffPrimary)
                    ScreenshotEarningCard(initial: "F", title: "Freepik", amount: "$ 3,000", tint: .ffPink)
                    ScreenshotEarningCard(initial: "W", title: "Envato", amount: "$ 2,000", tint: .ffBlue)
                }
                .padding(.trailing, 23)
            }
            .padding(.trailing, -23)
        }
    }

    private var savingsSection: some View {
        // Two-column preview of savings goals shown on the dashboard.
        VStack(alignment: .leading, spacing: 14) {
            sectionHeader("Savings")

            LazyVGrid(columns: savingsColumns, spacing: 14) {
                ForEach(displaySavings) { goal in
                    ScreenshotSavingsTile(goal: goal)
                }
            }
        }
    }

    private var transactionsSection: some View {
        // Recent transaction preview limited to the two visible rows.
        VStack(alignment: .leading, spacing: 12) {
            sectionHeader("Transactions")

            Text("Today")
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(.ffMuted)

            VStack(spacing: 10) {
                ForEach(viewModel.transactions.prefix(2)) { transaction in
                    ScreenshotHomeTransactionRow(transaction: transaction)
                }
            }
        }
    }

    private func sectionHeader(_ title: String) -> some View {
        HStack(alignment: .center) {
            Text(title)
                .font(.system(size: 22, weight: .semibold))
                .foregroundStyle(.ffInk)

            Spacer()

            Text("See All")
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(.ffBlue)
        }
    }

    private var displaySavings: [SavingsGoal] {
        // Screen-specific mock goals keep the dashboard amounts aligned to the screenshot.
        [
            SavingsGoal(title: "Iphone 13 Mini", savedAmount: 300, targetAmount: 699, tint: .ffPrimary, symbol: "iphone"),
            SavingsGoal(title: "Macbook Pro M1", savedAmount: 300, targetAmount: 1499, tint: .ffPink, symbol: "laptopcomputer"),
            SavingsGoal(title: "Car", savedAmount: 10000, targetAmount: 20000, tint: .ffWarning, symbol: "car.fill"),
            SavingsGoal(title: "House", savedAmount: 15300, targetAmount: 30500, tint: .ffBlue, symbol: "house.fill")
        ]
    }
}

// Large balance hero card with decorative clipped circles.
private struct ScreenshotBalanceCard: View {
    let balance: Decimal

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Total Balance")
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.white.opacity(0.78))
                .padding(.bottom, 4)

            Text(CurrencyFormatter.string(from: balance))
                .font(.system(size: 33, weight: .regular))
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.8)

            Spacer()

            HStack {
                Spacer()

                Text("My Wallet")
                    .font(.system(size: 9, weight: .medium))
                    .foregroundStyle(.white)

                Image(systemName: "arrow.right")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.ffInk)
                    .frame(width: 29, height: 29)
                    .background(.white, in: Circle())
            }
        }
        .padding(.top, 17)
        .padding(.leading, 16)
        .padding(.trailing, 12)
        .padding(.bottom, 14)
        .frame(height: 117)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            ZStack {
                Color.ffInk

                Circle()
                    .fill(.ffBlue)
                    .frame(width: 86, height: 86)
                    .offset(x: 112, y: -55)

                Circle()
                    .fill(.ffWarning)
                    .frame(width: 86, height: 86)
                    .offset(x: 139, y: -19)

                Circle()
                    .fill(.ffPrimaryDeep)
                    .frame(width: 72, height: 72)
                    .offset(x: -126, y: 68)
            }
            .clipShape(RoundedRectangle(cornerRadius: 7, style: .continuous))
        }
    }
}

// Income/outcome strip directly under the balance card.
private struct ScreenshotIncomeOutcomeStrip: View {
    let income: Decimal
    let outcome: Decimal

    var body: some View {
        HStack(spacing: 0) {
            stripItem(title: "Income", amount: income, symbol: "arrow.down", tint: .green)

            Rectangle()
                .fill(.white.opacity(0.45))
                .frame(width: 1, height: 47)

            stripItem(title: "Outcome", amount: outcome, symbol: "arrow.up", tint: .ffExpense)
        }
        .frame(height: 56)
        .background {
            ZStack {
                Color.ffInk
                Circle()
                    .fill(.ffLavender)
                    .frame(width: 30, height: 30)
                    .offset(x: -152, y: -29)
                Circle()
                    .fill(Color(hex: 0xFFD9C8))
                    .frame(width: 30, height: 30)
                    .offset(x: 153, y: 29)
            }
            .clipShape(RoundedRectangle(cornerRadius: 7, style: .continuous))
        }
    }

    private func stripItem(title: String, amount: Decimal, symbol: String, tint: Color) -> some View {
        HStack(spacing: 12) {
            Image(systemName: symbol)
                .font(.system(size: 26, weight: .semibold))
                .foregroundStyle(tint)

            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(.white.opacity(0.82))

                Text(CurrencyFormatter.string(from: amount))
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(.white)
                    .lineLimit(1)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// Single earning tile in the horizontal earnings list.
private struct ScreenshotEarningCard: View {
    let initial: String
    let title: String
    let amount: String
    let tint: Color

    var body: some View {
        VStack(spacing: 0) {
            Text(initial)
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(.ffInk)
                .frame(width: 24, height: 24)
                .background(Color.white.opacity(0.75), in: Circle())
                .padding(.top, 15)

            Spacer()

            VStack(spacing: 4) {
                Text(title)
                    .font(.system(size: 10, weight: .regular))
                    .foregroundStyle(.white.opacity(0.86))

                Text(amount)
                    .font(.system(size: 19, weight: .bold))
                    .foregroundStyle(.white)
            }
            .padding(.bottom, 16)
        }
        .frame(width: 106, height: 111)
        .background(tint, in: RoundedRectangle(cornerRadius: 7, style: .continuous))
    }
}

// Compact savings tile used in the dashboard grid.
private struct ScreenshotSavingsTile: View {
    let goal: SavingsGoal

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top) {
                Text(goal.title)
                    .font(.system(size: 11, weight: .regular))
                    .foregroundStyle(.ffMuted)
                    .lineLimit(1)

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 21, weight: .semibold))
                    .foregroundStyle(.ffInk)
                    .offset(y: 1)
            }

            Text(CurrencyFormatter.string(from: goal.targetAmount))
                .font(.system(size: 17, weight: .bold))
                .foregroundStyle(.ffInk)
                .lineLimit(1)
                .minimumScaleFactor(0.75)
                .padding(.top, 7)

            Spacer()

            GeometryReader { proxy in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(goal.tint.opacity(0.16))
                    Capsule()
                        .fill(goal.tint)
                        .frame(width: proxy.size.width * min(max(goal.progress, 0), 1))
                }
            }
            .frame(height: 4)
        }
        .padding(.horizontal, 11)
        .padding(.top, 9)
        .padding(.bottom, 10)
        .frame(height: 76)
        .background(.white, in: RoundedRectangle(cornerRadius: 7, style: .continuous))
    }
}

// Dashboard transaction row styled for the home preview list.
private struct ScreenshotHomeTransactionRow: View {
    let transaction: Transaction

    var body: some View {
        HStack(spacing: 13) {
            ZStack {
                Circle()
                    .fill(.ffSoftYellow)
                Image(systemName: "laptopcomputer")
                    .font(.system(size: 19, weight: .semibold))
                    .foregroundStyle(.ffWarning)
            }
            .frame(width: 39, height: 39)

            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.merchant)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.ffInk)
                    .lineLimit(1)

                Text(transaction.subtitle)
                    .font(.system(size: 13, weight: .regular))
                    .foregroundStyle(.ffMuted)
                    .lineLimit(1)
            }

            Spacer(minLength: 8)

            Text("-\(CurrencyFormatter.string(from: transaction.amount))")
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(.ffExpense)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
        }
        .padding(.horizontal, 13)
        .frame(height: 60)
        .background(.white, in: RoundedRectangle(cornerRadius: 7, style: .continuous))
    }
}

#Preview {
    HomeDashboardView(viewModel: HomeViewModel())
}
