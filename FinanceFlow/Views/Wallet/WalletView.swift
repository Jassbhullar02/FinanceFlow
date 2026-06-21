import SwiftUI

struct WalletView: View {
    @StateObject var viewModel: WalletViewModel

    var body: some View {
        ZStack {
            Color.ffSurface.ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    header
                        .padding(.top, 26)
                        .padding(.bottom, 26)

                    walletCarousel
                        .padding(.bottom, 31)

                    transactionsSection
                        .padding(.bottom, 31)

                    savingsSection
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 24)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        HStack(alignment: .center) {
            avatar

            Spacer()

            Text("Wallet")
                .font(.system(size: 21, weight: .semibold))
                .foregroundStyle(.ffInk)

            Spacer()

            Image(systemName: "ellipsis")
                .font(.system(size: 22, weight: .bold))
                .foregroundStyle(.ffInk)
                .rotationEffect(.degrees(90))
                .frame(width: 31, height: 31)
        }
    }

    private var avatar: some View {
        ZStack {
            Circle()
                .fill(.ffWarning)

            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 27, weight: .semibold))
                .foregroundStyle(.ffInk.opacity(0.8), .white)
        }
        .frame(width: 31, height: 31)
    }

    private var walletCarousel: some View {
        GeometryReader { proxy in
            let cardWidth = max(proxy.size.width - 52, 240)

            HStack(spacing: 16) {
                addCardRail
                    .frame(width: 36, height: 170)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 14) {
                        ForEach(walletCards) { card in
                            ScreenshotWalletCard(card: card)
                                .frame(width: cardWidth)
                                .overlay(alignment: .trailing) {
                                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                                        .fill(card.peekColor)
                                        .frame(width: 16, height: 170)
                                        .offset(x: 20)
                                }
                                .overlay(alignment: .trailing) {
                                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                                        .fill(.ffInk)
                                        .frame(width: 16, height: 51)
                                        .offset(x: 20, y: 59.5)
                                }
                        }
                    }
                    .padding(.trailing, 26)
                }
            }
        }
        .frame(height: 170)
    }

    private var walletCards: [WalletCardData] {
        [
            WalletCardData(holderName: viewModel.wallet.holderName, suffix: viewModel.wallet.cardNumberSuffix, balance: viewModel.wallet.balance, expiry: "09/23", peekColor: .ffWarning),
            WalletCardData(holderName: "C Muthu Krishnan", suffix: "7890", balance: 8450.25, expiry: "12/25", peekColor: .ffBlue),
            WalletCardData(holderName: "FinanceFlow Plus", suffix: "1024", balance: 15680.90, expiry: "06/26", peekColor: .ffPrimaryDeep)
        ]
    }

    private var addCardRail: some View {
        RoundedRectangle(cornerRadius: 11, style: .continuous)
            .stroke(style: StrokeStyle(lineWidth: 1.6, dash: [8, 6]))
            .foregroundStyle(.ffInk)
            .overlay {
                Circle()
                    .fill(.ffInk)
                    .frame(width: 18, height: 18)
                    .overlay {
                        Image(systemName: "plus")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundStyle(.white)
                    }
                    .background(
                        Circle()
                            .stroke(Color.ffSurface, lineWidth: 3)
                    )
            }
    }

    private var transactionsSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("Transactions")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundStyle(.ffInk)

                Spacer()

                Image(systemName: "slider.horizontal.3")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(.ffInk)
            }

            VStack(spacing: 12) {
                ForEach(viewModel.transactions) { transaction in
                    ScreenshotTransactionRow(transaction: transaction)
                }
            }
        }
    }

    private var savingsSection: some View {
        VStack(alignment: .leading, spacing: 13) {
            HStack(alignment: .center) {
                Text("Savings")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundStyle(.ffInk)

                Spacer()

                Text("See All")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(.ffBlue)
            }

            VStack(spacing: 12) {
                ForEach(viewModel.savings.prefix(3)) { goal in
                    ScreenshotSavingRow(goal: goal)
                }
            }
        }
    }
}

private struct WalletCardData: Identifiable {
    let id = UUID()
    let holderName: String
    let suffix: String
    let balance: Decimal
    let expiry: String
    let peekColor: Color
}

private struct ScreenshotWalletCard: View {
    let card: WalletCardData

    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Total Balance")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundStyle(.ffInk)

                        Text(CurrencyFormatter.string(from: card.balance))
                            .font(.system(size: 21, weight: .bold))
                            .foregroundStyle(.ffInk)
                    }

                    Spacer()

                    Text("LOGO")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundStyle(.ffInk)
                        .padding(.top, 15)
                }
                .padding(.top, 15)
                .padding(.horizontal, 14)

                Spacer(minLength: 0)

                HStack(spacing: 20) {
                    Text("1234")
                    Text("••••")
                    Text("••••")
                    Text(card.suffix)
                }
                .font(.system(size: 12, weight: .medium))
                .foregroundStyle(.ffInk)
                .padding(.horizontal, 14)
                .padding(.bottom, 20)
            }
            .frame(height: 119)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.white)

            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 3) {
                    Text("Name")
                        .font(.system(size: 9, weight: .regular))
                        .foregroundStyle(.white.opacity(0.7))
                    Text(card.holderName)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(.white)
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 3) {
                    Text("Exp")
                        .font(.system(size: 9, weight: .regular))
                        .foregroundStyle(.white.opacity(0.7))
                    Text(card.expiry)
                        .font(.system(size: 15, weight: .bold))
                        .foregroundStyle(.white)
                }
            }
            .padding(.horizontal, 14)
            .frame(height: 51)
            .background(.ffInk)
        }
        .frame(height: 170)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

private struct ScreenshotTransactionRow: View {
    let transaction: Transaction

    var body: some View {
        HStack(spacing: 13) {
            ZStack {
                Circle()
                    .fill(iconBackground)
                Image(systemName: iconName)
                    .font(.system(size: 21, weight: .semibold))
                    .foregroundStyle(iconTint)
            }
            .frame(width: 39, height: 39)

            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.merchant)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(.ffInk)
                    .lineLimit(1)

                Text(transaction.subtitle)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(.ffMuted)
                    .lineLimit(1)
            }

            Spacer(minLength: 8)

            Text("-\(CurrencyFormatter.string(from: transaction.amount))")
                .font(.system(size: 17, weight: .medium))
                .foregroundStyle(.ffExpense)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
        }
        .padding(.horizontal, 13)
        .frame(height: 69)
        .background(.white, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
    }

    private var iconName: String {
        switch transaction.merchant {
        case "Dribbble": "laptopcomputer"
        case "House", "Car": "arrow.down.to.line.compact"
        case "Sony Camera": "bag"
        case "Paypal": "creditcard"
        default: transaction.category.symbol
        }
    }

    private var iconTint: Color {
        switch transaction.merchant {
        case "Dribbble": .ffWarning
        case "House", "Car": .ffBlue
        case "Sony Camera": .ffPink
        case "Paypal": .ffPrimaryDeep
        default: transaction.category.tint
        }
    }

    private var iconBackground: Color {
        switch transaction.merchant {
        case "Dribbble": .ffSoftYellow
        case "House", "Car": .ffLavender.opacity(0.35)
        case "Sony Camera": .ffSoftPink
        case "Paypal": .ffSoftGreen
        default: transaction.category.tint.opacity(0.15)
        }
    }
}

private struct ScreenshotSavingRow: View {
    let goal: SavingsGoal

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(Color.ffLavender.opacity(0.35))
                Image(systemName: goal.symbol)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.ffBlue)
            }
            .frame(width: 39, height: 39)

            VStack(alignment: .leading, spacing: 9) {
                HStack {
                    Text(goal.title)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.ffInk)
                        .lineLimit(1)

                    Spacer()

                    Text(CurrencyFormatter.string(from: goal.targetAmount))
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.ffInk)
                        .lineLimit(1)
                        .minimumScaleFactor(0.75)
                }

                GeometryReader { proxy in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(Color.ffLine.opacity(0.75))
                        Capsule()
                            .fill(Color(hex: 0x5145E8))
                            .frame(width: proxy.size.width * min(max(goal.progress, 0), 1))
                    }
                }
                .frame(height: 4)
            }
        }
        .padding(.horizontal, 13)
        .frame(height: 64)
        .background(.white, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}
