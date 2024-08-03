import Foundation
/**
 * Date extensions
 */
extension Date {
   /**
    * Converts a date to milliseconds since 1970
    * - Description: This computed property converts the current Date instance to milliseconds elapsed since January 1, 1970, 00:00:00 UTC (also known as the Unix epoch). It provides a convenient way to represent dates as a single integer value, which is often useful for timestamp comparisons, sorting, or when working with systems that expect dates in this format.
    * - Remark: This is useful for working with APIs that require dates to be in this format
    * - Examples:
    *   - Date().mSecSince1970 // 1476889390939
    */
   internal var mSecSince1970: Int64 {
      Int64((self.timeIntervalSince1970 * 1000.0).rounded())
   }
   /**
    * Converts a date to milliseconds since 00:00:00 UTC on 1 January 2001
    * - Description: This computed property converts the current Date instance to milliseconds elapsed since January 1, 2001, 00:00:00 UTC (also known as the reference date in Apple's frameworks). It provides a convenient way to represent dates as a single integer value, which is particularly useful when working with Apple's APIs or when precise timing relative to this reference date is required.
    * - Remark: This is useful for working with APIs that require dates to be in this format
    * - Examples:
    *   - Date().mSecSinceReferenceDate // 631139040000
    */
   internal var mSecSinceReferenceDate: Int64 {
      Int64((self.timeIntervalSinceReferenceDate * 1000.0).rounded())
   }
   /**
    * Returns a short date string for the given date in milliseconds since 1970
    * - Description: This static method converts a given date in milliseconds since 1970 (Unix epoch) to a short date string format. It provides a convenient way to display dates in a concise, readable format, which is particularly useful for user interfaces or when a brief representation of a date is required.
    * - Remark: The date is formatted as "MM/dd/yyyy"
    * - Examples:
    *   - Date.shortModifiedDate(date: Double(0)) // "08/12/2016"
    * - Parameters:
    *   - date: The date in milliseconds since 1970
    * - Returns: The short date string
    */
   internal static func shortModifiedDate(date: Double) -> String {
      Date(timeIntervalSince1970: TimeInterval(date) / 1000).shortDate
   }
   /**
    * Returns a short date and time string for the given date in milliseconds since 1970
    * - Description: This static method converts a given date in milliseconds since 1970 (Unix epoch) to a short date and time string format. It provides a convenient way to display dates with both date and time information in a concise, readable format. This is particularly useful for user interfaces or when a brief representation of a date and time is required.
    * - Remark: The date is formatted as "dd.MM.yy HH:mm"
    * - Examples:
    *   - Date.shortModifiedDateAndTime(date: Double(0)) // "12.08.16 00:00"
    * - Parameters:
    *   - date: The date in milliseconds since 1970
    * - Returns: The short date and time string
    */
   internal static func shortModifiedDateAndTime(date: Double) -> String {
      Date(timeIntervalSince1970: TimeInterval(date) / 1000).shortDateWithTime
   }
}
/**
 * Date extensions
 */
extension Date {
   /**
    * Initializes a new Date instance from milliseconds since 1970
    * - Description: This initializer creates a new Date instance from a given number of milliseconds since January 1, 1970, 00:00:00 UTC (Unix epoch). It converts the milliseconds to seconds and uses the standard Date initializer with timeIntervalSince1970. This method is particularly useful when working with timestamps from systems or APIs that use millisecond precision for their dates.
    * - Examples:
    *   - Date(milliseconds: 0) // "Dec 31, 1969, 4:00 PM" (PDT variant of 1970 UTC)
    * - Parameters:
    *   - milliseconds: The number of milliseconds since 1970
    */
   internal init(milliseconds: Int64) {
      self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
   }
   /**
    * Adds the given time interval to the current date and returns a new Date instance
    * - Description: This method adds a specified time interval to the current date and returns a new Date instance. It's useful for creating future or past dates relative to the current date, which can be particularly helpful in testing scenarios or when you need to calculate dates based on time offsets.
    * - Remark: This is a convenient method used for testing
    * - Examples:
    *   - Date().add(3600) // Adds one hour to the current date
    * - Parameters:
    *   - timeInterval: The time interval to add to the current date
    * - Returns: A new Date instance with the added time interval
    */
   internal func add(_ timeInterval: TimeInterval) -> Date {
      var date: Date = self
      date.addTimeInterval(timeInterval)
      return date
   }
   /**
    * Returns a short date string for the current date
    * - Description: This computed property returns a short date string representation of the current date. It uses the system's current locale settings to format the date, which typically results in a format like "MM/dd/yyyy" for US English locale. This property is useful for displaying dates in a concise, easily readable format that is consistent with the user's regional settings.
    * - Remark: The date is formatted as "MM/dd/yyyy"
    * - Examples:
    *   - Date().shortDate // Outputs: 08/12/2016
    */
   internal var shortDate: String {
      let dateFormatter: DateFormatter = .init()
      dateFormatter.locale = NSLocale.current
      dateFormatter.dateStyle = .short
      return dateFormatter.string(from: self)
   }
   /**
    * Returns a short date and time string for the current date
    * - Description: This computed property returns a short date and time string representation of the current date. It formats the date using a specific pattern "yy.MM.dd HH:mm", which includes the year (last two digits), month, day, hour (in 24-hour format), and minute. This property is useful for displaying dates with time in a compact format, suitable for scenarios where both date and time information is needed in a concise form.
    * - Remark: The date is formatted as "yy.MM.dd HH:mm"
    * - Examples:
    *   - Date().shortDateWithTime // Outputs: 23.06.21 22:00
    */
   internal var shortDateWithTime: String {
      let dateFormatter: DateFormatter = .init()
      dateFormatter.dateFormat = "yy.MM.dd HH:mm"
      dateFormatter.locale = NSLocale.current
      dateFormatter.timeZone = TimeZone.current
      return dateFormatter.string(from: self)
   }
}
