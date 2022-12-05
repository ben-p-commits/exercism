import Foundation

func splitOnNewlines(_ poem: String) -> [String] {
    return poem.components(separatedBy: .newlines)
}

func firstLetter(_ line: String) -> Character {
    return line.first ?? Character("_")
}

func capitalize(_ phrase: String) -> String {
    return phrase.capitalized
}

func trimFromEnd(_ line: String) -> String {
    return line.trimmingCharacters(in: .whitespacesAndNewlines)
}

func lastLetter(_ line: String) -> Character {
    return line.last ?? Character("_")
}

func backDoorPassword(_ phrase: String) -> String {
    return "\(phrase.capitalized), please"
}

func ithLetter(_ line: String, i: Int) -> Character {
    guard i >= 0 && i < line.count else {
        return " "
    }
    return line[i]
}

func secretRoomPassword(_ phrase: String) -> String {
    return "\(phrase.uppercased())!"
}


extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
