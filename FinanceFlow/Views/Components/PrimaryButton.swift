import SwiftUI

struct PrimaryButton: View {
    let title: String
    var systemImage: String? = nil
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                Text(title)
                    .font(.ffHeadline(17))

                if let systemImage {
                    Image(systemName: systemImage)
                        .font(.system(size: 16, weight: .bold))
                }
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 17)
            .background(.ffPrimary, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
            .shadow(color: .ffPrimary.opacity(0.28), radius: 18, y: 10)
        }
        .buttonStyle(.plain)
        .accessibilityAddTraits(.isButton)
    }
}
