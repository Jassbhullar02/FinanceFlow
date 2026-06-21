import SwiftUI

struct WalletCard: View {
    let wallet: Wallet

    var body: some View {
        VStack(alignment: .leading, spacing: 22) {
            HStack {
                Image(systemName: "creditcard.fill")
                    .font(.system(size: 26, weight: .semibold))
                    .foregroundStyle(.white)
                Spacer()
                Text("VIRTUAL")
                    .font(.ffCaption(12))
                    .foregroundStyle(.white.opacity(0.7))
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(CurrencyFormatter.string(from: wallet.balance))
                    .font(.ffTitle(32))
                    .foregroundStyle(.white)
                    .minimumScaleFactor(0.7)
                    .lineLimit(1)

                Text("•••• •••• •••• \(wallet.cardNumberSuffix)")
                    .font(.ffHeadline(18))
                    .foregroundStyle(.white.opacity(0.82))
            }

            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(wallet.holderName)
                    Spacer()
                    Text("Spent \(Int(wallet.spendProgress * 100))%")
                }
                .font(.ffCaption())
                .foregroundStyle(.white.opacity(0.78))

                ProgressBar(progress: wallet.spendProgress, tint: .white)
            }
        }
        .padding(22)
        .frame(maxWidth: .infinity, minHeight: 220)
        .background(
            LinearGradient(colors: [.ffInk, .ffPrimaryDeep], startPoint: .topLeading, endPoint: .bottomTrailing),
            in: RoundedRectangle(cornerRadius: 24, style: .continuous)
        )
        .shadow(color: .ffInk.opacity(0.14), radius: 20, y: 12)
    }
}
