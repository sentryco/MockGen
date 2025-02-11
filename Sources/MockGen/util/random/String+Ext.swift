#if DEBUG
import Foundation
/**
 * An extension of `String` that provides utility methods for generating random strings, particularly random passwords with customizable lengths and character sets.
 * - Description: This extension on the `String` class provides utility methods for generating random strings, particularly random passwords with customizable lengths and character sets. It is designed to facilitate the creation of secure, unpredictable passwords for testing and development purposes within the `MockGen` framework.
 * - Note: We can use this in other frameworks if we use `@testable import ...`
 */
extension String {
   /**
    * A string containing all the characters that can be used to generate a password.
    * - Abstract: Defines the character set used for generating random passwords, including lowercase and uppercase letters, numbers, and special characters to ensure complexity and security.
    * - Description: This constant defines a set of characters that can be used to generate strong and secure passwords. It includes a mix of lowercase and uppercase letters, numbers, and special characters to ensure complexity and reduce the likelihood of password cracking.
    * - Remark: The string contains lowercase letters, uppercase letters, numbers, and special characters.
    */
   fileprivate static let pwdLetters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%&()0123456789"
   /**
    * Generates a random password string of the specified length
    * - Abstract: Generates a random password string of the specified length using a predefined character set.
    * - Description: This method generates a random password by selecting characters from a predefined set of alphanumeric and special characters. Each character is chosen randomly from the `pwdLetters` constant, ensuring that the password is unpredictable and secure for use in testing environments.
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
    * - Abstract: Provides static constants for generating random strings.
    * - Description: This nested enum `Statics` serves as a container for static constants used in generating random strings. It provides a centralized location for defining character sets that are used throughout the `String` extension, ensuring consistency and reusability of the code.
    */
   fileprivate enum Statics {
      /**
       * A range of Unicode scalar values that includes lowercase letters, uppercase letters, and numbers.
       * - Abstract: Define a range of Unicode scalar values that includes lowercase letters, uppercase letters, and numbers
       * - Description: This range of Unicode scalar values is carefully selected to encompass the alphanumeric character set, which includes all lowercase and uppercase letters of the English alphabet as well as the digits from 0 to 9. This range is essential for generating random strings that are both human-readable and suitable for a wide variety of testing purposes where alphanumeric characters are required.
       * - Remark: The range is used to generate a set of characters that can be used to create a random string.
       */
      static let scalars: FlattenSequence<[ClosedRange<UInt32>]> = [
                       UnicodeScalar("a").value...UnicodeScalar("z").value, // lowercase letters
                       UnicodeScalar("A").value...UnicodeScalar("Z").value, // uppercase letters
                       UnicodeScalar("0").value...UnicodeScalar("9").value].joined() // numbers
      /**
       * An array of characters that includes lowercase letters, uppercase letters, and numbers.
       * - Description: This array is a collection of `Character` instances created from a range of Unicode scalar values. It includes all the lowercase and uppercase letters of the English alphabet and the digits from 0 to 9. This array is utilized in functions that require a pool of alphanumeric characters to generate random strings.
       * - Remark: The array is generated from a range of Unicode scalar values that includes lowercase letters, uppercase letters, and numbers.
       */
      static let characters: [Character] = scalars.compactMap { UnicodeScalar($0) }.map { Character($0) }
   }
   /**
    * Generates a random string of the specified length.
    * - Abstract: The function generates a random string by selecting
    *             characters from an array that includes lowercase letters,
    *             uppercase letters, and numbers.
    * - Description: This function generates a random string of a specified
    *                length. It uses a predefined set of characters that
    *                includes lowercase letters, uppercase letters, and
    *                numbers. Each character in the string is selected
    *                randomly from this set, ensuring a high degree of
    *                randomness and complexity in the resulting string. This
    *                function is particularly useful for generating test data
    *                or creating unique identifiers.
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
