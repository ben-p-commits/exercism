let times: [String: Double] = [
    "beer" : 0.5,
    "soda" : 0.5,
    "water" : 0.5,
    "shot" : 1.0,
    "mixed drink" : 1.5,
    "fancy drink" : 2.5,
    "frozen drink" : 3.0
]

let limeOutput: [String: Int] = [
    "small": 6,
    "medium": 8,
    "large": 10
]

func timeToPrepare(drinks: [String]) -> Double {
    var totalTime = 0.0
    drinks.forEach { totalTime += times[$0] ?? 0 }
    return totalTime
}

func makeWedges(needed: Int, limes: [String]) -> Int {
    var remaining = needed
    var i = 0
    while remaining > 0, i < limes.count {
        remaining -= limeOutput[limes[i]] ?? 0
        i += 1
    }
    return i
}

func finishShift(minutesLeft: Int, remainingOrders: [[String]]) -> [[String]] {
    var remainingMinutes = Double(minutesLeft)
    var orders = remainingOrders
    if orders.isEmpty { return orders }
    
    while remainingMinutes > 0, !orders.isEmpty {
        let nextOrder = orders.removeFirst()
        remainingMinutes -= timeToPrepare(drinks: nextOrder)
    }
    return orders
}

func orderTracker(orders: [(drink: String, time: String)]) -> (
  beer: (first: String, last: String, total: Int)?, soda: (first: String, last: String, total: Int)?
) {
    
    let beerOrders = orders.filter({ $0.drink == "beer" }).map {
        $0.time
    }.sorted(by: <)
    
    let sodaOrders = orders.filter({ $0.drink == "soda" }).map {
        $0.time
    }.sorted(by: <)
    
    let beerTuple = beerOrders.isEmpty ? nil : (
        first: beerOrders.first!,
        last: beerOrders.last!,
        total: beerOrders.count
    )
    
    let sodaTuple = sodaOrders.isEmpty ? nil : (
        first: sodaOrders.first!,
        last: sodaOrders.last!,
        total: sodaOrders.count
    )
    
    return (beerTuple, sodaTuple)
}
