import SwiftUI

// Full-screen onboarding carousel shown before the tabbed app.
struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    let onFinished: () -> Void

    var body: some View {
        ZStack {
            Color.black.opacity(0.95)
                .ignoresSafeArea()

            VStack(spacing: 0) {

                TabView(selection: $viewModel.currentIndex) {

                    ForEach(Array(viewModel.pages.enumerated()), id: \.element.id) { index, page in

                        VStack(alignment: .leading, spacing: 0) {

                            // Hero artwork stays fixed while copy changes per page.
                            OnboardingIllustration()
                                .frame(height: 420)
                            Spacer()

                            // Current page title and supporting copy.
                            VStack(alignment: .leading, spacing: 16) {

                                Text(page.title)
                                    .font(.system(size: 30, weight: .bold))
                                    .foregroundStyle(.white)

                                Text(page.description)
                                    .font(.system(size: 18))
                                    .foregroundStyle(.white.opacity(0.7))
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .padding(.horizontal, 32)

                            Spacer()
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))

                // Progress dots and next/finish action.
                HStack {

                    PageIndicator(
                        count: viewModel.pages.count,
                        currentIndex: viewModel.currentIndex
                    )

                    Spacer()

                    Button {
                        withAnimation(.spring()) {
                            viewModel.advance(onFinished: onFinished)
                        }
                    } label: {

                        Circle()
                            .fill(.white)
                            .frame(width: 72, height: 72)
                            .overlay {
                                Image(systemName: "arrow.right")
                                    .font(.system(size: 28, weight: .semibold))
                                    .foregroundStyle(.black)
                            }
                    }
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 40)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnboardingView {
        // Preview finished
    }
}
