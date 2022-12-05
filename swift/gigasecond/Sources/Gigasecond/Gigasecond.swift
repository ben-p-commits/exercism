// Define "Gigasecond" with a "description" property containing
// the result, times are expected in "yyyy-MM-dd'T'HH:mm:ss" format
import Foundation

struct Gigasecond {
    init?(from: String) {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        df.locale = Locale(identifier: "en_US_POSIX")
        df.timeZone = TimeZone(secondsFromGMT: 0)
        guard let date = df.date(from: from) else { return nil }
        let futureDate = date.addingTimeInterval(1e9)
        description = df.string(from: futureDate)
    }
    let description: String
}
