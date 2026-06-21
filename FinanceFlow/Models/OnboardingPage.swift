import Foundation

// Text content for each onboarding carousel page.
struct OnboardingPage: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let description: String
}
