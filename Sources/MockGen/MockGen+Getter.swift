#if DEBUG
import Foundation
/**
 * Email and website mock generators
 * - Description: This section contains methods for generating mock email
 *                addresses and website URLs, which are essential for testing
 *                email and web-related functionalities in applications.
 * - Note: These methods generate mock email addresses and website URLs based
 *         on the specified name and brand. The `getEmail` method combines
 *         the lowercased name and website into an email address, while the
 *         `getWebsite` method returns the website for the specified brand.
 *         The `websites` dictionary contains a list of common brand names and
 *         their associated websites.
 * - Note: These methods are marked as `internal` to ensure they can only be
 *         accessed within the same module.
 */
extension MockGen {
   /**
    * Email mock generator
    * - Description: Generates a mock email address by concatenating the
    *   provided name and brand with the domain obtained from the `getWebsite`
    *   method. The name is converted to lowercase to simulate a typical email
    *   format.
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
    * - Description: This method generates a mock website URL for a given brand.
    *                It looks up the brand in the `Websites` dictionary to find
    *                the associated website. If the brand is not present in the
    *                dictionary, it logs an error and returns `nil`.
    * - Parameter brand: The brand to use in the website URL.
    * - Returns: A mock website URL string based on the specified brand,
    *            or `nil` if the website for the brand is not found.
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
    * - Description: This method generates a random first name by extracting
    *                the first part of a random full name. If no full name is
    *                available or the name cannot be split, it logs an error and
    *                returns `nil`.
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
   /**
    * Random Address Generator
    * - Description: Generates a random street address using the `AddressGenerator` class.
    * - Returns: A random street address string.
    */
   public static var randomAddress: String {
      return AddressGenerator.randomAddress()
   }
   /**
    * Generates a random `Date` between the specified start and end dates.
    * - Description: This method generates a random `Date` within the specified
    *                date range. It calculates the time interval between `startDate`
    *                and `endDate`, selects a random interval within that range, and
    *                adds it to `startDate` to produce the random date.
    * - Parameters:
    *   - startDate: The beginning of the date range.
    *   - endDate: The end of the date range.
    * - Returns: A randomly generated `Date` within the specified range.
    */
   // fixme: add unit-test for this?
   public static func randomDate(from startDate: Date, to endDate: Date) -> Date {
        let timeInterval = endDate.timeIntervalSince(startDate)
        let randomInterval = TimeInterval.random(in: 0...timeInterval)
        return startDate.addingTimeInterval(randomInterval)
    }
}
#endif
