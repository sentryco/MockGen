#if DEBUG
import Foundation
import CryptoKit
import JSONSugar
import FileSugar
/**
 * Utility methods
 *
 * These methods provide utility functionality for `MockGen`, such as generating random dates and boolean values with different probabilities of being true.
 *
 * - Note: These methods are marked as `internal` to ensure they can only be accessed within the same module. They are also wrapped in a `DEBUG` conditional compilation block to ensure they are only included in debug builds.
 */
extension MockGen {
   /**
    * Random date generator
    * - Example: let randomDate = MockGen.randomDate // "06/23/2022"
    * - Returns: A random date string in the short date format (MM/dd/yyyy).
    */
   public static var randomDate: String {
      let msec: Int64 = .init(arc4random_uniform(UInt32(600_000 - 300_000 + 1))) + 300_000 // Generate a random number of milliseconds between 300,000 and 600,000
      let date: Date = .init(milliseconds: msec) // Create a date object from the random number of milliseconds
      return date.shortDate // Return the short date string representation of the date object
   }
   /**
    * Random boolean generator
    *
    * - Parameter chance: The probability of the boolean value being true, expressed as an integer where 1/chance is the probability (e.g. 3 = 1/16th chance, 4 = 1/32th chance).
    * - Returns: A random boolean value with the specified probability of being true.
    *
    * Example usage:
    * let randomBool = MockGen.getRandomBool(3) // 1/4 chance of returning true
    */
   public static func getRandomBool(_ chance: Int) -> Bool {
      (0...chance) // Create a range from 0 to the specified chance value
         .filter ({ (_: Int) in Bool.random() }) // Filter the range to include only values where a random boolean value is true
         .isEmpty // Check if the resulting array is empty (i.e. if any values passed the filter)
   }
}
#endif
