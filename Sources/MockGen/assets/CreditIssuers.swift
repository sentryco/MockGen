#if DEBUG
import Foundation

/**
 * CreditCardIssuers
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
