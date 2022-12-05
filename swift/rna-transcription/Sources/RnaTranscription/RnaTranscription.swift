// Define the 'Nucleotide' enum, its `init`, and its `complementOfDNA` method

import Foundation

struct RnaTranscription {
    enum TranscriptionError: Error {
        case invalidNucleotide(message: String)
    }
}

enum Nucleotide {
    case nucleotide(value: String)
    
    init(_ value: String) {
        self = .nucleotide(value: value)
    }

    func complementOfDNA() throws -> String {
        let allowedBases = "GCAT"
        var complement = ""
        if case let .nucleotide(value) = self {
            for char in value {
                if !allowedBases.contains(char) {
                    throw RnaTranscription.TranscriptionError.invalidNucleotide(message: "\(char) is not a valid Nucleotide")
                }
                switch char {
                case "G": complement += "C"
                case "C": complement += "G"
                case "A": complement += "U"
                case "T": complement += "A"
                default:
                    fatalError()
                }
            }
            return complement
        } else {
            fatalError()
        }
    }
}
