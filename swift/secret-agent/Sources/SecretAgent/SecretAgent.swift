func protectSecret(_ secret: String, withPassword password: String) -> (String) -> String {
    
    func challenge(_ attempt: String) -> String {
        return password == attempt ? secret : "Sorry. No hidden secrets here."

    }
    return challenge
  
}

func generateCombination(forRoom room: Int, usingFunction f: (Int) -> Int) -> (Int, Int, Int) {
    let first = f(room)
    let second = f(first)
    let third = f(second)
    return (first, second, third)
}
