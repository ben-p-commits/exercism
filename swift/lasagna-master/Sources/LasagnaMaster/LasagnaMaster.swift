// TODO: define the 'remainingMinutesInOven' function
func remainingMinutesInOven(elapsedMinutes: Int, expectedMinutesInOven: Int = 40) -> Int {
    return max(expectedMinutesInOven - elapsedMinutes, 0)
}


// TODO: define the 'preparationTimeInMinutes' function
func preparationTimeInMinutes(layers: String...) -> Int {
    return layers.count * 2
}

// TODO: define the 'quantities' function
func quantities(layers: String...) -> (noodles: Int, sauce: Double) {
    // 3 noodles per noodle layer
    // 0.2 liters per sauce layer
    let noodles = layers.filter { $0 == "noodles" }.count * 3
    let sauceLayers = Double(layers.filter { $0 == "sauce" }.count)
    return (noodles, sauceLayers * 0.2)
}

// TODO: define the 'toOz' function
@discardableResult
func toOz(_ amount: inout (noodles: Int, sauce: Double)) -> (noodles: Int, sauce: Double) {
    amount.sauce = 33.814 * amount.sauce
    return amount
}

// TODO: define the 'redWine' function
func redWine(layers: String...) -> Bool {
    
    let redFoods = ["meat", "sauce"]
    let whiteFoods = ["mozzarella", "ricotta", "béchamel"]
    var redCount = 0
    var whiteCount = 0
    
    layers.forEach {
        if redFoods.contains($0) { redCount += 1 }
        if whiteFoods.contains($0) { whiteCount += 1 }
    }
    return redCount >= whiteCount
}
