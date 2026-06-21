import SwiftUI

// Animated dots that mirror the onboarding TabView index.
struct PageIndicator: View {
    let count: Int
    let currentIndex: Int

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<count, id: \.self) { index in
                Capsule()
                    .fill(index == currentIndex ? .white : .gray)
                    .frame(width: index == currentIndex ? 28 : 9, height: 9)
            }
        }
        .animation(.spring(response: 0.35, dampingFraction: 0.82), value: currentIndex)
        .accessibilityLabel("Page \(currentIndex + 1) of \(count)")
    }
}
