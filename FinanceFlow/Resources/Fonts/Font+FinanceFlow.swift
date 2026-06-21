import SwiftUI

extension Font {
    static func ffTitle(_ size: CGFloat = 32) -> Font {
        .system(size: size, weight: .bold)
    }

    static func ffHeadline(_ size: CGFloat = 20) -> Font {
        .system(size: size, weight: .semibold)
    }

    static func ffBody(_ size: CGFloat = 16) -> Font {
        .system(size: size, weight: .regular)
    }

    static func ffCaption(_ size: CGFloat = 13) -> Font {
        .system(size: size, weight: .medium)
    }
}
