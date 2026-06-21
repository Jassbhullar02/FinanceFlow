import SwiftUI

struct SavingsCard: View {
    let goal: SavingsGoal

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 12) {
                Image(systemName: goal.symbol)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(goal.tint)
                    .frame(width: 42, height: 42)
                    .background(goal.tint.opacity(0.13), in: RoundedRectangle(cornerRadius: 12, style: .continuous))

                VStack(alignment: .leading, spacing: 4) {
                    Text(goal.title)
                        .font(.ffHeadline(16))
                        .foregroundStyle(.ffInk)
                    Text("\(Int(goal.progress * 100))% complete")
                        .font(.ffCaption(12))
                        .foregroundStyle(.ffMuted)
                }

                Spacer()
            }

            ProgressBar(progress: goal.progress, tint: goal.tint)

            HStack {
                Text(CurrencyFormatter.string(from: goal.savedAmount))
                    .font(.ffCaption())
                    .foregroundStyle(.ffInk)
                Spacer()
                Text(CurrencyFormatter.string(from: goal.targetAmount))
                    .font(.ffCaption())
                    .foregroundStyle(.ffMuted)
            }
        }
        .padding(16)
        .background(.ffCard, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(.ffLine, lineWidth: 1)
        )
    }
}
