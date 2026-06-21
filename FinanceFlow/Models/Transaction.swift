import SwiftUI

struct Transaction: Identifiable {
    enum Category {
        case income
        case shopping
        case food
        case transport
        case subscriptions
        case savings

        var symbol: String {
            switch self {
            case .income: "arrow.down.circle.fill"
            case .shopping: "bag.fill"
            case .food: "fork.knife"
            case .transport: "car.fill"
            case .subscriptions: "play.rectangle.fill"
            case .savings: "banknote.fill"
            }
        }

        var tint: Color {
            switch self {
            case .income: .ffPrimary
            case .shopping: .ffLavender
            case .food: .ffWarning
            case .transport: .ffBlue
            case .subscriptions: .ffExpense
            case .savings: .ffPrimaryDeep
            }
        }
    }

    let id = UUID()
    let merchant: String
    let subtitle: String
    let amount: Decimal
    let date: Date
    let category: Category
    let isCredit: Bool
}
