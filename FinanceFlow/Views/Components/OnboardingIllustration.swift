import SwiftUI

// Displays the onboarding hero artwork from the asset catalog.
struct OnboardingIllustration: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(.hero)
                .resizable()
                .frame(height: 314)

            Image(.wepic)
                .resizable()
                .scaledToFit()
                .frame(height: 380)
        }
        .frame(height: 380)
        .padding(.horizontal, 32)
    }
}
