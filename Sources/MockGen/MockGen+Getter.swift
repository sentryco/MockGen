#if DEBUG
import Foundation
/**
 * Email and website mock generators
 * - Note: These methods generate mock email addresses and website URLs based on the specified name and brand. The `getEmail` method combines the lowercased name and website into an email address, while the `getWebsite` method returns the website for the specified brand. The `websites` dictionary contains a list of common brand names and their associated websites.
 * - Note: These methods are marked as `internal` to ensure they can only be accessed within the same module.
 */
extension MockGen {
   /**
    * Email mock generator
    * - Parameters:
    *   - name: The name to use in the email address.
    *   - brand: The brand to use in the email address.
    * - Returns: A mock email address string based on the specified name and brand, or `nil` if the website for the brand is not found.
    */
   public static func getEmail(name: String, brand: String) -> String? {
      guard let website: String = getWebsite(brand: brand) else { return nil } // Get the website for the specified brand
      return name.lowercased() + "@" + website // Combine the lowercased name and website into an email address
   }
   /**
    * Website mock generator
    * - Parameter brand: The brand to use in the website URL.
    * - Returns: A mock website URL string based on the specified brand, or `nil` if the website for the brand is not found.
    */
   public static func getWebsite(brand: String) -> String? {
      guard let website: String = Websites.website(company: brand) else {
         Swift.print("no website for brand: \(brand)")
         return nil
      } // Get the website for the specified brand, or print an error message and return nil if the website is not found
      return website // Return the website for the specified brand
   }
   /**
    * Random first name
    * - Fixme: ⚠️️ Add random last name?
    */
   public static var randomFirstName: String? {
      guard let fullName: String = randomFullName else { Swift.print("no name"); return nil }
      guard let first: String.SubSequence = fullName.split(separator: " ").first else {
         Swift.print("unable to split: >\(fullName)<")
         return nil
      }
      return String(first)
   }
}
// deprecated ⚠️️
//extension MockGen {
//   @available(*, deprecated, renamed: "randomFirstName") // You can also point to new class : "UIAlertController.createAlert"
//   static var randomName: String? {
//      randomFirstName
//   }
//}
#endif
