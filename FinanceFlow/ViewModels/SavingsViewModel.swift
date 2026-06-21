import SwiftUI

// Supplies the mock savings cards for the dedicated Savings screen.
final class SavingsViewModel: ObservableObject {
    let items: [SavingsScreenItem] = [
        SavingsScreenItem(
            title: "Iphone 13 Mini",
            saved: 300,
            target: 699,
            progress: 0.50,
            daysLeft: "14 days left",
            tint: .ffPrimary,
            symbol: "iphone",
            showTitle: true
        ),
        SavingsScreenItem(
            title: "Macbook Pro M1",
            saved: 300,
            target: 1499,
            progress: 0.60,
            daysLeft: "30 days left",
            tint: .ffPink,
            symbol: "laptopcomputer",
            showTitle: true
        ),
        SavingsScreenItem(
            title: "Car",
            saved: 10000,
            target: 20000,
            progress: 0.50,
            daysLeft: "30 days left",
            tint: .ffWarning,
            symbol: "car.fill",
            showTitle: true
        ),
        SavingsScreenItem(
            title: "House",
            saved: 65000,
            target: 30500,
            progress: 0.50,
            daysLeft: "3 years left",
            tint: .ffBlue,
            symbol: "house.fill",
            showTitle: true
        )
    ]
}
