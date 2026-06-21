import SwiftUI

struct ProgressBar: View {
    let progress: Double
    var tint: Color = .ffPrimary

    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.ffLine.opacity(0.8))

                Capsule()
                    .fill(tint)
                    .frame(width: max(proxy.size.width * min(max(progress, 0), 1), 8))
            }
        }
        .frame(height: 8)
        .animation(.easeInOut(duration: 0.55), value: progress)
    }
}
