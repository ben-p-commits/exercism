import Foundation
func sliceSize(diameter: Double?, slices: Int?) -> Double? {
    
    guard let diameter = diameter, diameter >= 0,
          let slices = slices, slices > 0 else {
        return nil
    }
    
    let r = diameter / 2
    return Double.pi * pow(r, 2) / Double(slices)
}

func biggestSlice(
    diameterA: String, slicesA: String,
    diameterB: String, slicesB: String
) -> String {
    let neither = "Neither slice is bigger"
    
    let diameterA = Double(diameterA)
    let slicesA = Int(slicesA)
    let diameterB = Double(diameterB)
    let slicesB = Int(slicesB)
    
    let sizeA = sliceSize(diameter: diameterA, slices: slicesA)
    let sizeB = sliceSize(diameter: diameterB, slices: slicesB)
    
    if sizeA == nil && sizeB == nil {
        return neither
    }
    if let sizeA = sizeA {
        if let sizeB = sizeB {
            if sizeA > sizeB {
                return "Slice A is bigger"
            } else if sizeB > sizeA{
                return "Slice B is bigger"
            } else {
                return neither
            }
        } else {
            return "Slice A is bigger"
        }
    } else {
        if sizeB != nil {
            return "Slice B is bigger"
        } else {
            return neither
        }
    }
}
