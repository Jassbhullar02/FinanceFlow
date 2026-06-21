import Foundation

final class OnboardingViewModel: ObservableObject {
    @Published var currentIndex = 0

    let pages: [OnboardingPage] = [
        OnboardingPage(
            symbol: "person.crop.rectangle.stack.fill",
            title: "Make Your Financial Management Easier",
            description: "Financy is a mobile application that can help you manage your finances in a simple way."
        ),
        OnboardingPage(
            symbol: "wallet.pass.fill",
            title: "Every wallet, beautifully organized",
            description: "See recent activity, card limits, and spending patterns without noisy dashboards."
        ),
        OnboardingPage(
            symbol: "target",
            title: "Build savings that actually move",
            description: "Create focused goals and watch progress grow with simple, visual milestones."
        )
    ]

    var isLastPage: Bool {
        currentIndex == pages.indices.last
    }

    func advance(onFinished: () -> Void) {
        if isLastPage {
            onFinished()
        } else {
            currentIndex += 1
        }
    }
}
