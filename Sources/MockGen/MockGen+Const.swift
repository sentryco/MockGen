#if DEBUG
import Foundation
import CryptoKit
import JSONSugar
import FileSugar
/**
 * Data
 */
extension MockGen {
    /**
    * Random bank name
    */
   static var randomBank: String? { Banks.line }
   /**
    * Random note
    */
   static var randomNote: String? { Notes.line }
   /**
    * Random full name
    *
    * - Fixme: ⚠️️ Create firstNames, lastNames, fullNames?
    */
   static var randomFullName: String? { Names.line }
}
/**
 * Extra
 */
extension MockGen {
   /**
    * Random SSID generator
    *
    * This method generates a random SSID from the `SSIDS` array, which contains a list of common wifi network names. If the array is empty, the method returns `nil`.
    *
    * - Returns: A random SSID string from the `SSIDS` array, or `nil` if the array is empty.
    */
   internal static var randomSSID: String? { SSIDS.line }
   /**
    * Random credit card issuer generator
    *
    * This method generates a random credit card issuer name from the `CreditCardIssuers` array, which contains a list of common credit card issuers. If the array is empty, the method returns `nil`.
    *
    * - Returns: A random credit card issuer name string from the `CreditCardIssuers` array, or `nil` if the array is empty.
    */
   internal static var randomIssuer: String? { CreditCardIssuers.line }
   /**
    * Random brand name generator
    *
    * This method generates a random brand name from the `Brands` array, which contains a list of common brand names. If the array is empty, the method returns `nil`.
    *
    * - Returns: A random brand name string from the `Brands` array, or `nil` if the array is empty.
    */
   internal static var randomBrand: String? { Brands.brands.randomElement() }
   /**
    * - Remark: Secret has a format behind it.  Uppercase random string seems to work
    * - Fixme: ⚠️️⚠️️ We should also add other random elements to the OTP url later 👈
    * - Fixme: ⚠️️ Maybe use TWOFA lib to gen the secret? we cant access seclib here so no
    */
   internal static var randomOTP: String? { // internal static let otps: [String] = ["otpauth://totp/test?secret=GEZDGNBV", "otpauth://hotp/test?secret=GEZDGNBV&algorithm=SHA512&digits=6&counter=1", "otpauth://totp/ACME%20Co:john.doe@email.com?secret=GEZDGNBV&algorithm=SHA512&digits=6&period=30.0&issuer=ACME%20Co&image=https://www.images.com/image.png"]
      let secret: String = CodeGen.generatePassword(length: 8, useLowercase: false, useNumbers: false, useSpecialChars: false) //
      let urlString: String = "otpauth://totp/ACME%20Co:john.doe@email.com?secret=\(secret)&algorithm=SHA512&digits=6&period=30.0&issuer=ACME%20Co&image=https://www.images.com/image.png"
      return urlString
      // "otpauth://totp/test?secret=\(secret)" // GEZDGNBV
   }
}
/**
 * Random boolean generators
 * These methods generate random boolean values with different probabilities of being true, such as 1/8, 1/16, and 1/32. The methods use the `getRandomBool` method to generate the boolean values with the specified probability.
 * - Note: These methods are marked as `internal` to ensure they can only be accessed within the same module.
 */
internal extension MockGen {
   /**
    * Random favorite boolean
    *
    * - Returns: A random boolean value with a 1/8 probability of being true.
    */
   static var randomFavorite: Bool { getRandomBool(3) } // 1 / 8
   /**
    * Random archive boolean
    *
    * - Returns: A random boolean value with a 1/16 probability of being true.
    */
   static var randomArchive: Bool { getRandomBool(4) } // 1 / 16
   /**
    * Random trash boolean
    *
    * - Returns: A random boolean value with a 1/32 probability of being true.
    */
   static var randomTrash: Bool { getRandomBool(5) } // 1 / 32
}
#endif
