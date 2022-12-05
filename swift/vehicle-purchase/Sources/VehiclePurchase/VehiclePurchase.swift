import Swift
func canIBuy(vehicle: String, price: Double, monthlyBudget: Double) -> String {
    let availableCash = monthlyBudget * 12 * 5
    let frugalLimit = (availableCash * 0.1) + availableCash
    
    if price > availableCash {
        return price < frugalLimit ? "I'll have to be frugal if I want a \(vehicle)" : "Darn! No \(vehicle) for me"
    } else {
        return "Yes! I'm getting a \(vehicle)"
    }
}

func licenseType(numberOfWheels wheels: Int) -> String {
    switch wheels {
    case 2, 3:
        return "You will need a motorcycle license for your vehicle"
    case 4, 6:
        return "You will need an automobile license for your vehicle"
    case 18:
        return "You will need a commercial trucking license for your vehicle"
    default:
        return "We do not issue licenses for those types of vehicles"
    }
}

func registrationFee(msrp: Int, yearsOld: Int) -> Int {
    guard yearsOld < 10 else { return 25 }
    // newer car
    let basePrice = max(msrp, 25000)
    let amountToSubtract = (Double(basePrice) * 0.1) * Double(yearsOld)
    let steppedDown = Double(basePrice) - amountToSubtract
    var fee = steppedDown / 100.0
    fee.round(.down)
    return Int(fee)
}
