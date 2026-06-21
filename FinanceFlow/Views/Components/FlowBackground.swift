import SwiftUI

struct FlowBackground: View {
    var body: some View {
        LinearGradient(
            colors: [.ffSurface, .white],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}
