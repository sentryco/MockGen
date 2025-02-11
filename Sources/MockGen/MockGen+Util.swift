#if DEBUG
import Foundation
import CryptoKit
import JSONSugar
import FileSugar
/**
 * These methods provide utility functionality for `MockGen`, such as generating random dates and boolean values with different probabilities of being true.
 * - Abstract: Provides utility methods for generating random dates and boolean values for mock data generation.
 * - Description: The utility methods in this extension are designed to assist
 *                in the creation of mock data by providing random date and
 *                boolean value generation. These methods are particularly
 *                useful for testing scenarios that require data variability.
 * - Note: These methods are marked as `internal` to ensure they can only be
 *         accessed within the same module. They are also wrapped in a `DEBUG`
 *         conditional compilation block to ensure they are only included in
 *         debug builds.
 */
extension MockGen {
   /**
    * Random date generator (between 1970 and Now)
    * - Abstract: Generates a random date string between 1970 and now.
    * - Description: Generates a random date within a specified range of
    *                milliseconds. This method is useful for creating date data for testing
    *                purposes, ensuring variability in the generated dates.
    * Explanation:
    * 1. Calculate Current Time: let now = Date() gets the current date and time.
    * 2. Start Date: let start = Date(timeIntervalSince1970: 0) sets the start date to January 1, 1970.
    * 3. Interval Calculation: let interval = now.timeIntervalSince(start) calculates the total number of seconds from 1970 to the current date.
    * 4. Random Interval: let randomInterval = TimeInterval(arc4random_uniform(UInt32(interval))) generates a random number of seconds within the calculated interval.
    * 5. Random Date Creation: let randomDate = Date(timeIntervalSince1970: randomInterval) creates a new date object starting from 1970 plus the random interval.
    * Date Formatting: The date is then formatted to a short style string and returned.
    * ## Examples:
    * let randomDate = MockGen.randomDate // "06/23/2022"
    * - Returns: A random date string in the short date format (MM/dd/yyyy)
    */
   public static var randomDate: String {
      // let msec: Int64 = .init(arc4random_uniform(UInt32(600_000_000_000 - 300_000_000_000 + 1))) + 300_000_000_000 // Generate a random number of milliseconds between 300,000 and 600,000
      // Swift.print("msec:  \(msec)")
      // let date: Date = .init(milliseconds: msec) // Create a date object from the random number of milliseconds
      // Swift.print("date:  \(date)")
      // return date.shortDate // Return the short date string representation of the date object
      let now = Date()
      let start = Date(timeIntervalSince1970: 0) // January 1, 1970
      let interval = now.timeIntervalSince(start) // Total seconds from 1970 to now
      let randomInterval = TimeInterval(arc4random_uniform(UInt32(interval))) // Generate a random TimeInterval within the range
      let randomDate = Date(timeIntervalSince1970: randomInterval) // Create a random Date from 1970
      // Swift.print("randomDate: \(randomDate)")
      // return DateFormatter.localizedString(from: randomDate, dateStyle: .short, timeStyle: .none) // Format the date to a short style string
      return randomDate.shortDate // Return the short date string representation of the date object
   }
   /**
    * Random boolean generator
    * - Abstract: Generates a random boolean value based on a specified probability.
    * - Description: This method provides a way to generate a boolean value
    *                based on a given chance. The higher the `chance` parameter
    *                value, the lower the probability of the method returning
    *                `true`. This is useful for simulating conditions with
    *                varying likelihoods in testing scenarios.
    * - Parameter chance: The probability of the boolean value being true,
    *                     expressed as an integer where 1/chance is the probability
    *                     (e.g. 3 = 1/16th chance, 4 = 1/32th chance).
    * - Returns: A random boolean value with the specified probability of being true
    * ## Examples:
    * let randomBool = MockGen.getRandomBool(3) // 1/4 chance of returning true
    */
   public static func getRandomBool(_ chance: Int) -> Bool {
      (0...chance) // Create a range from 0 to the specified chance value
         .filter { (_: Int) in Bool.random() } // Filter the range to include only values where a random boolean value is true
         .isEmpty // Check if the resulting array is empty (i.e. if any values passed the filter)
   }
}
#endif
