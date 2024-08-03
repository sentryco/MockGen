#if DEBUG
import Foundation
/**
 * CreditCardIssuers
 * - Description: This class represents a collection of credit card issuers, providing access to a list of issuers stored in a CSV file.
 *   It is designed to be used for generating mock data or testing scenarios related to credit card operations.
 *   The class conforms to the CSVKind protocol, which defines the structure for accessing CSV-based data.
 * - Remark: This class provides a list of credit card issuers for use in testing and debugging.
 * - Remark: The list is loaded from a CSV file named "CreditIssuers.csv".
 * - Note: The file should be located in the module's resource path.
 */
class CreditCardIssuers: CSVKind {
   class var fileName: String { "CreditIssuers.csv" } // The name of the CSV file to load
   static let lines: [String] = {
      CSVUtil.list(fileName: fileName) // Load the CSV file and return its contents as an array of strings
   }()
}
#endif
