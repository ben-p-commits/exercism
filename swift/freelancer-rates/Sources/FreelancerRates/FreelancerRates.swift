func dailyRateFrom(hourlyRate: Int) -> Double {
    return Double(8 * hourlyRate)
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
    let base = Double(8 * hourlyRate * 22)
    let discount = base * (discount/100)
    let final = base - discount
    return final.rounded()
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
    let dailyRate = Double(8 * hourlyRate)
    let discount = dailyRate * (discount/100)
    let discountedDailyRate = dailyRate - discount
    return (budget/discountedDailyRate).rounded(.down)
}
