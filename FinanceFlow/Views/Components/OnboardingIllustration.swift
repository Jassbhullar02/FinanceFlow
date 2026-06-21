//import SwiftUI
//
//struct OnboardingIllustration: View {
//    let symbol: String
//
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 30, style: .continuous)
//                .fill(
//                    LinearGradient(
//                        colors: [.ffLavender.opacity(0.34), .ffPrimaryDeep.opacity(0.16)],
//                        startPoint: .topLeading,
//                        endPoint: .bottomTrailing
//                    )
//                )
//
//            VStack(spacing: 20) {
//                Image(systemName: symbol)
//                    .font(.system(size: 64, weight: .bold))
//                    .foregroundStyle(.ffPrimary)
//                    .symbolEffect(.bounce, options: .speed(0.35), value: symbol)
//
//                HStack(alignment: .bottom, spacing: 9) {
//                    ForEach([0.35, 0.58, 0.46, 0.82, 0.68], id: \.self) { height in
//                        Capsule()
//                            .fill(Color.ffPrimary.opacity(0.85))
//                            .frame(maxWidth: 18)
//                            .containerRelativeFrame(.vertical) { length, _ in
//                                max(length * height, 26)
//                            }
//                    }
//                }
//                .frame(maxWidth: 160, maxHeight: 90)
//            }
//            .padding(32)
//        }
//        .aspectRatio(1.05, contentMode: .fit)
//    }
//}
//
//#Preview {
//    OnboardingIllustration(symbol: "person.crop.rectangle.stack.fill")
//}


import SwiftUI

struct OnboardingIllustration: View {
    let symbol: String

    var body: some View {
        ZStack(alignment: .bottom) {
            // Background Shape
            Image(.hero)
                .resizable()
                .frame(height: 314)

            // Person Image
            Image(.wepic)
                .resizable()
                .scaledToFit()
                .frame(height: 380)
        }
        .frame(height: 380)
        .padding(.horizontal, 32)
    }
}
