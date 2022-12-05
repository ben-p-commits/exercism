let flip: ((String, String, String)) -> (String, String, String) = { ($0.1, $0.0, $0.2) }
let rotate: ((String, String, String)) -> (String, String, String) = { ($0.1, $0.2, $0.0) }

func makeShuffle(
    flipper: @escaping ((String, String, String)) -> (String, String, String),
    rotator: @escaping ((String, String, String)) -> (String, String, String)
) -> (UInt8, (String, String, String)) -> (String, String, String) {
    let closure: (UInt8, (String, String, String)) -> (String, String, String) = { code, tuple in
        code.bits().reduce(tuple, {(acc, bit) in
            bit == 0 ? flipper(acc) : rotator(acc)
        })
    }
    return closure
}

extension UInt8 {
    /// This function returns the bits of the number as an array of `UInt8` zeroes (`0`) and ones(`1`)
    func bits() -> [UInt8] {
        (0...7).map({i in (self >> i) & 1})
    }
}
