import SwiftUI

struct MetricCard: View {
    let title: String
    let amount: Decimal
    let symbol: String
    let tint: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Image(systemName: symbol)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(tint)
                    .frame(width: 36, height: 36)
                    .background(tint.opacity(0.12), in: Circle())

                Spacer()
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.ffCaption())
                    .foregroundStyle(.ffMuted)
                Text(CurrencyFormatter.string(from: amount))
                    .font(.ffHeadline(19))
                    .foregroundStyle(.ffInk)
                    .minimumScaleFactor(0.8)
                    .lineLimit(1)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.ffCard, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(.ffLine, lineWidth: 1)
        )
    }
}
