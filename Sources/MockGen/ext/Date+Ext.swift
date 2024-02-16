import Foundation
/**
 * Date extensions
 */
extension Date {
   /**
    * Converts a date to milliseconds since 1970
    * - Remark: This is useful for working with APIs that require dates to be in this format
    * - Examples:
    *   - Date().mSecSince1970 // 1476889390939
    */
   internal var mSecSince1970: Int64 {
      Int64((self.timeIntervalSince1970 * 1000.0).rounded())
   }
   /**
    * Converts a date to milliseconds since 00:00:00 UTC on 1 January 2001
    * - Remark: This is useful for working with APIs that require dates to be in this format
    * - Examples:
    *   - Date().mSecSinceReferenceDate // 631139040000
    */
   internal var mSecSinceReferenceDate: Int64 {
      Int64((self.timeIntervalSinceReferenceDate * 1000.0).rounded())
   }
   /**
    * Returns a short date string for the given date in milliseconds since 1970
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
