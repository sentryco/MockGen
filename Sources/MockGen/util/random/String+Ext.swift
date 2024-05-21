#if DEBUG
import Foundation
/**
 * - Note: We can use this in other frameworks if we use `@testable import ...`
 */
extension String {
   /**
    * A string containing all the characters that can be used to generate a password.
    * - Remark: The string contains lowercase letters, uppercase letters, numbers, and special characters.
    */
   fileprivate static let pwdLetters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%&()0123456789"
   /**
    * Generates a random password string of the specified length
    * - Remark: The function generates a password string by randomly selecting characters from a set of letters that includes lowercase letters, uppercase letters, numbers, and special characters.
    * - Fixme: ⚠️️ doc each line, use copilot
    * - Parameters:
    *   - pwdLength: The length of the password string. Must be between 2 and 48.
    * - Returns: A random password string of the specified length
    * ## Examples:
    * print(String.randomPassword(pwdLength: Int.random(in: 2...48))) // $3K#j9@Lm
    */
   public static func randomPassword(pwdLength: Int) -> String {
      // - Fixme: ⚠️️ Needs refactoring
      let array: [String] = (0..<pwdLength).enumerated().compactMap { (_: (offset: Int, element: Int)) in
         guard let element: String.Element = pwdLetters.randomElement() else { return nil }
         return String(element)
      }
      return array.joined()
   }
   /**
    * Used in the random method
    */
   fileprivate enum Statics {
      /**
       * A range of Unicode scalar values that includes lowercase letters, uppercase letters, and numbers.
       * - Description: Define a range of Unicode scalar values that includes lowercase letters, uppercase letters, and numbers
       * - Remark: The range is used to generate a set of characters that can be used to create a random string.
       */
      static let scalars: FlattenSequence<[ClosedRange<UInt32>]> = [
                       UnicodeScalar("a").value...UnicodeScalar("z").value, // lowercase letters
                       UnicodeScalar("A").value...UnicodeScalar("Z").value, // uppercase letters
                       UnicodeScalar("0").value...UnicodeScalar("9").value].joined() // numbers
      /**
       * An array of characters that includes lowercase letters, uppercase letters, and numbers.
       * - Remark: The array is generated from a range of Unicode scalar values that includes lowercase letters, uppercase letters, and numbers.
       */
      static let characters: [Character] = scalars.compactMap { UnicodeScalar($0) }.map { Character($0) }
   }
   /**
    * Generates a random string of the specified length.
    * - Description: The function generates a random string by selecting characters from an array that includes lowercase letters, uppercase letters, and numbers.
    * - Parameter length: The length of the random string.
    * - Returns: A random string of the specified length.
    * Example usage:
    * let randomString = String.random(length: 10) // Generates a random string of length 10. aB48xhKk2Yc
    */
   public static func random(length: Int) -> String {
      let result: [Character] = (0..<length).compactMap { (_: Int) in 
         Statics.characters.randomElement() 
      } // Generate an array of random characters of the specified length
      return String(result) // Convert the array of characters to a string and return it
   }
}
#endif
