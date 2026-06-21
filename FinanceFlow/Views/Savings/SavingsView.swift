import SwiftUI

struct SavingsView: View {
    @StateObject var viewModel: SavingsViewModel

    var body: some View {
        ZStack {
            Color.ffSurface.ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    header
                        .padding(.top, 20)
                        .padding(.bottom, 34)

                    VStack(spacing: 29) {
                        ForEach(viewModel.items) { item in
                            SavingsLargeCard(item: item)
                        }
                    }
                    .padding(.horizontal, 27)
                    .padding(.bottom, 70)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }

    private var header: some View {
        HStack {
            Image(systemName: "chevron.left")
                .font(.system(size: 28, weight: .regular))
                .foregroundStyle(.ffInk)
                .frame(width: 34, height: 34, alignment: .leading)

            Spacer()

            Text("Savings")
                .font(.system(size: 25, weight: .semibold))
                .foregroundStyle(.ffInk)

            Spacer()

            Image(systemName: "plus")
                .font(.system(size: 28, weight: .regular))
                .foregroundStyle(.ffInk)
                .frame(width: 34, height: 34, alignment: .trailing)
        }
        .padding(.horizontal, 31)
    }
}

private struct SavingsLargeCard: View {
    let item: SavingsScreenItem

    private var foreground: Color {
        item.tint == .ffPrimary || item.tint == .ffPink ? .white : .ffInk
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if item.showTitle {
                Text(item.title)
                    .font(.system(size: 23, weight: .bold))
                    .foregroundStyle(foreground)
                    .lineLimit(1)
                    .padding(.top, 23)
            } else {
                Spacer()
                    .frame(height: 88)
            }

            Spacer(minLength: item.showTitle ? 48 : 0)

            Text("Balance")
                .font(.system(size: 15, weight: .regular))
                .foregroundStyle(foreground)
                .padding(.bottom, 8)

            progressLine
                .padding(.bottom, 8)

            HStack(alignment: .firstTextBaseline) {
                Text(CurrencyFormatter.string(from: item.saved))
                    .font(.system(size: 22, weight: .bold))
                    .foregroundStyle(foreground)

                Text("of \(CurrencyFormatter.string(from: item.target))")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(foreground)

                Spacer()

                Text(item.daysLeft)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(foreground)
            }
            .padding(.bottom, 26)

            Text("See detail")
                .font(.system(size: 15, weight: .bold))
                .foregroundStyle(foreground)
                .padding(.bottom, 22)
        }
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity, minHeight: 210, maxHeight: 210, alignment: .leading)
        .background(item.tint, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        .overlay(alignment: .topTrailing) {
            Image(systemName: item.symbol)
                .font(.system(size: watermarkSize, weight: .bold))
                .foregroundStyle(.black.opacity(0.14))
                .rotationEffect(.degrees(watermarkRotation))
                .offset(x: watermarkX, y: watermarkY)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }

    private var progressLine: some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.white.opacity(0.82))

                Capsule()
                    .fill(Color.ffInk)
                    .frame(width: proxy.size.width * min(max(item.progress, 0), 1))
            }
        }
        .frame(height: 4)
        .overlay(alignment: .trailing) {
            Text("\(Int(item.progress * 100))%")
                .font(.system(size: 15, weight: .regular))
                .foregroundStyle(foreground)
                .offset(y: -20)
        }
    }

    private var watermarkSize: CGFloat {
        switch item.title {
        case "Iphone 13 Mini": 118
        case "Macbook Pro M1": 116
        case "Car": 116
        default: 94
        }
    }

    private var watermarkRotation: Double {
        switch item.title {
        case "Macbook Pro M1": -28
        case "Car": -36
        case "House": -28
        default: -32
        }
    }

    private var watermarkX: CGFloat {
        switch item.title {
        case "House": 16
        default: 8
        }
    }

    private var watermarkY: CGFloat {
        switch item.title {
        case "Macbook Pro M1": -6
        case "House": -2
        default: -28
        }
    }
}

struct SavingsView_Previews: PreviewProvider {
    static var previews: some View {
        SavingsView(viewModel: SavingsViewModel())
    }
}
