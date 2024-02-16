#if DEBUG
import Foundation
/**
 * - Remark: There is also: SecCreateSharedWebCredentialPassword() as String?
 * - Note: We can use this in other frameworks if we use `@testable import Account`
 */
internal enum CodeGen {
   /**
    * A utility function for generating a random password string of a given length.
    * The password string can include uppercase letters, lowercase letters, numbers, and special characters.
    * - Parameter length: The length of the password string to generate.
    * - Parameter useLowercase: Whether to include lowercase letters in the password string. Default is `true`.
    * - Parameter useNumbers: Whether to include numbers in the password string. Default is `true`.
    * - Parameter useSpecialChars: Whether to include special characters in the password string. Default is `true`.
    * - Returns: A random password string of the given length.
    * ## Examples:
    * CodeGen.generatePassword(length: Int.random(in: 2...48)) // $3K#j9@Lm
    * let secret = CodeGen.generatePassword(length: 8, useLowercase: false, useNumbers: false, useSpecialChars: false) //
    * print(secret) // GVHYWQAB
    */
   internal static func generatePassword(length: Int, useLowercase: Bool = true, useNumbers: Bool = true, useSpecialChars: Bool = true) -> String {
      var letters: String = base // Define the base set of characters to use in the password string
      if useLowercase { // Add lowercase letters to the set of characters if requested
         letters += lowerChars
      }
      if useNumbers { // Add numbers to the set of characters if requested
         letters += numberChars
      }
      if useSpecialChars { // Add special characters to the set of characters if requested
         letters += specialChars
      }
      let characters: [String.Element] = Array(letters) // Convert the set of characters to an array
      let numChars: UInt32 = UInt32(characters.count) // Get the number of characters in the array
      let result: String = .init((0..<length).map { (_: Int) in // Generate a random password string of the given length using the set of characters
         characters[Int(arc4random_uniform(numChars))]
      })
      return result // Return the generated password string
   }
}
/**
 * Const
 */
extension CodeGen {
   // fix we can also use Alphabet class. maybe copy it here? yepp! 
   private static let base: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" // Define the base set of characters to use in the password string
   private static let lowerChars: String = "abcdefghijklmnopqrstuvwxyz" // Define lowercase letters to use in the password string
   private static let numberChars: String = "1234567890" // Define numbers to use in the password string
   private static let specialChars: String = "!@#$%^&*" // Define special characters to use in the password string
}
#endif
