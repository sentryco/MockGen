import Foundation // Provides fundamental networking and data-handling classes and protocols.
import FileSugar // Provides a collection of file and directory utilities.
import JSONSugar // Provides a collection of JSON utilities.
/**
 * Websites
 * - Description: This enum provides a centralized access point for retrieving
 *                website URLs associated with different companies. It supports
 *                adding custom brand-specific websites and allows overriding
 *                the default behavior to accommodate specific needs.
 * - Fixme: ⚠️️ Make this a class that can be overriden
 */
public enum Websites {
   /**
    * A tuple representing a company and its associated website URL
    * - Description: This tuple holds the company name and its corresponding
    *                website URL, facilitating easy access and management of web
    *                resources associated with different companies.
    */
   public typealias Website = (company: String, website: String)
   /**
    * Returns the website URL for a given company name.
    * - Description: This function retrieves the website URL associated with
    *                a specified company name by searching through a combined list of default
    *                and brand-specific websites.
    * - Fixme: ⚠️️ This function is not currently overridable to add brand-specific websites. To make it overridable, refactor the function to use a protocol and provide a default implementation in an extension.
    * ## Examples:
    * website(company: "adobe") // Returns "adobe.com"
    * - Parameter company: The name of the company to look up.
    * - Returns: The website URL for the given company, or nil if no website is found.
    */
   public static func website(company: String) -> String? {
      let sites: [Websites.Website] = Self.brandSites + Self.websites
      return sites.first { $0.company.lowercased() == company.lowercased() }?.website
   }
}
/**
 * Helper
 */
extension Websites {
   /**
    * Returns an array of `Website` tuples parsed from a CSV file.
    * - Description: This method loads and parses a CSV file containing
    *                company names and their associated website URLs into an array of
    *                `Website` tuples.
    * - Remark: The `.csv` file will not parse as utf8, so we use roman, see https://stackoverflow.com/a/26454159/5389500 for more info.
    * - Remark: The CSV file should have the following format:
    *   - The file is a CSV (comma-separated values) file.
    *   - Each line of the file represents a company and its associated website URL.
    *   - The company name and website URL are separated by a comma and a space (", ").
    *   - The first value in each line is the company name.
    *   - The last value in each line is the website URL.
    * - Fixme: ⚠️️ Refactor this function to throw an error if the CSV file cannot be loaded or parsed.
    * - Parameter lines: An array of strings representing the lines of the CSV file.
    * - Returns: An array of `Website` tuples parsed from the CSV file.
    */
   fileprivate static var websites: [Website] = {
      // Load the CSV file as an array of strings
      let lines: [String] = CSVUtil.list(fileName: "websites.csv", seperator: ",\r") // Split on line breaks (⚠️️ used to be \n\r but something changed somewhere)
      // Parse the array of strings into an array of `Website` tuples
      return companyAndWebsites(lines: lines)
   }()
   /**
    * Provides a description of the expected format of the `brandsites.csv` file.
    * - Description: This section provides details about the `brandsites.csv`
    *                file used to store brand-specific website URLs. Each line in the CSV file
    *                represents a unique brand and its corresponding website URL, allowing for
    *                easy retrieval and management of brand-specific web resources.
    * - Remark: The file is a CSV (comma-separated values) file.
    * - Remark: Each line of the file represents a company and its associated website URL.
    * - Remark: The company name and website URL are separated by a comma.
    * - Remark: The first value in each line is the company name.
    * - Remark: The last value in each line is the website URL.
    * - Remark: Note that there are some duplicate entries in the file, which may need to be handled appropriately depending on the use case.
    */
   fileprivate static var brandSites: [Website] = {
      // Load the CSV file as an array of strings
      let lines: [String] = CSVUtil.list(fileName: "brandsites.csv", seperator: ",\n") // Split on line breaks (⚠️️ used to be \n\r but something changed somewhere)
      // Parse the array of strings into an array of `Website` tuples
      return companyAndWebsites(lines: lines)
   }()
   /**
    * Parses an array of CSV lines into an array of `Website` objects.
    * - Note: Each CSV line should contain a company name and its associated
    *         website URL, separated by a comma and a space.
    * - Returns: An array of `Website` objects, where each object contains the
    *            company name and website URL as properties.
    */
   fileprivate static func companyAndWebsites(lines: [String]) -> [Website] {
      // For each line in the CSV file...
      lines.compactMap {
         // Split the line into an array of strings using the comma as a separator
         let strings: [String] = $0.components(separatedBy: ", ")
         // Extract the company name and website URL from the array of strings
         guard let company: String = strings.first, let website: String = strings.last else { return nil }
         // Return a tuple representing the company and its associated website URL
         return (company: company, website: website)
      }
   }
}
