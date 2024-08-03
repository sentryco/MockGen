#if DEBUG
import Foundation
import CryptoKit
import JSONSugar
import FileSugar
/**
 * This class provides functions for generating random secret strings.
 * - Description: The `SecRan` class provides secure randomization utilities for generating secret strings of variable lengths. These strings can be used for tokens, passwords, or any other cryptographic operations where random strings are required.
 * - Note: We can use this in other frameworks if we use `@testable import Account`
 */
public class SecRan {
   /**
    * Generates a random secret string of length between `min` and `max` characters
    * - Description: This method is responsible for creating a secure, random string that can be used as a secret key or password. The length of the generated string will be within the range specified by the `min` and `max` parameters, providing flexibility in the strength and complexity of the secret.
    * - Parameters:
    *   - min: The minimum length of the secret string. Default is 8.
    *   - max: The maximum length of the secret string. Default is 44.
    * - Returns: A random secret string of length between `min` and `max` characters, or nil if `min` is greater than `max`.
    * Example usage:
    * let secret = SecRan.randomSecret() // Generates a random secret string between min and max characters in length.
    */
   public static func randomSecret(min: Int = 8, max: Int = 44) -> String? {
      guard min < max else { Swift.print("Error: min \(min) length must be less than or max \(max)"); return nil } // Check if max length is less than or equal to 44
      guard let length: Int = (min..<max).randomElement() else { return nil } // Generate a random length between min and max
      return randomSecret(length: length) // Return a random secret string of the generated length
   }
   /**
    * Generates a random secret string of the specified length.
    * - Abstract: This function generates a random secret string by generating a random 256-bit symmetric key, converting it to a Data object, and then encoding it as a base64-encoded string. The function then limits the string to the desired length.
    * - Description: This method securely generates a random string of a specified length. It uses cryptographic functions to ensure the randomness and unpredictability of the output, suitable for creating secrets such as tokens or passwords.
    * - Fixme: ⚠️️ Make it throw? and add max as an option?
    * - Fixme: ⚠️️ Doc each line, use copilot
    * - Fixme: ⚠️️ figure out a more precise way than multiplying with 8, this is just for testing, so not critical
    * ## Examples:
    * - `randomSecret(length: 8)` returns "UGT7+4P2"
    * - `randomSecret(length: 9)` returns "UZYVJ1OS2"
    * - Parameters:
    *   - length: The length of the secret string.
    * - Returns: A random secret string of the specified length, or nil if `length` is greater than 44.
    * - Remark: The function generates a random 256-bit symmetric key and uses it as a salt to generate a base64-encoded string. The function then limits the string to the desired length.
    */
   public static func randomSecret(length: Int) -> String? {
      // guard length <= 44 else { Swift.print("Error: length must be less than or equal to 44"); return nil } // Check if length is less than or equal to 44
      let symKeySalt: SymmetricKey = .init(size: .init(bitCount: length * 8)) // Generate a random 256-bit symmetric key
      let salt: Data = symKeySalt.withUnsafeBytes { Data($0) } // Convert the symmetric key to a Data object
      let secret: String = salt.base64EncodedString() // Generate a base64-encoded string from the Data object
      let range: String = { // Limit the secret to the desired length
         let start: String.Index = secret.index(secret.startIndex, offsetBy: 0)
         let end: String.Index = secret.index(secret.startIndex, offsetBy: length)
         return String(secret[start..<end])
      }() // Use a closure to limit the secret to the desired length
      return range // Return the generated secret string
   }
}
#endif

 