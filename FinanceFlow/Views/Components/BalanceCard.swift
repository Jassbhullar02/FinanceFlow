import SwiftUI

struct BalanceCard: View {
    let balance: Decimal
    let cardHolder: String

    var body: some View {
        VStack(alignment: .leading, spacing: 22) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Total Balance")
                        .font(.ffCaption())
                        .foregroundStyle(.white.opacity(0.72))
                    Text(CurrencyFormatter.string(from: balance))
                        .font(.ffTitle(34))
                        .foregroundStyle(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.65)
                }

                Spacer()

                Image(systemName: "wave.3.right.circle.fill")
                    .font(.system(size: 34, weight: .semibold))
                    .foregroundStyle(.ffPrimary)
            }

            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Card Holder")
                        .font(.ffCaption(12))
                        .foregroundStyle(.white.opacity(0.62))
                    Text(cardHolder)
                        .font(.ffHeadline(15))
                        .foregroundStyle(.white)
                }

                Spacer()

                Text("•••• 4821")
                    .font(.ffHeadline(16))
                    .foregroundStyle(.white.opacity(0.9))
            }
        }
        .padding(22)
        .frame(maxWidth: .infinity, minHeight: 190, alignment: .leading)
        .background {
            ZStack(alignment: .bottomTrailing) {
                LinearGradient(
                    colors: [.ffInk, .ffPrimaryDeep],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )

                Circle()
                    .fill(.ffPrimary.opacity(0.22))
                    .frame(width: 170, height: 170)
                    .offset(x: 56, y: 62)
            }
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        }
        .shadow(color: .ffInk.opacity(0.14), radius: 20, y: 12)
    }
}
