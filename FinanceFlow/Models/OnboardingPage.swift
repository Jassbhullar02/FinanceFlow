import Foundation

struct OnboardingPage: Identifiable, Equatable {
    let id = UUID()
    let symbol: String
    let title: String
    let description: String
}
