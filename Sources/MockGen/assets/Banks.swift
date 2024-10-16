#if DEBUG
import Foundation

/**
 * Banks CSV data
 * - Description: This class represents a collection of banks, providing
 *                access to a list of bank information stored in a CSV file.
 *                It is designed to be used for generating mock data or testing
 *                scenarios related to banking operations. The class conforms
 *                to the CSVKind protocol, which defines the structure for
 *                accessing CSV-based data.
 * - Note: This class provides access to the list of banks stored in a CSV
 *         file. The `lines` property contains an array of strings, where
 *         each string represents a line in the CSV file. The `fileName`
 *         property specifies the name of the CSV file to load.
 * - Note: This class is only available in DEBUG builds.
 */
class Banks: CSVKind {
   /**
   * Banks CSV format
   *
   * The `Banks.csv` file is a comma-separated values (CSV) file that contains a list of banks. Each line in the file represents a single bank, and contains the following fields in order:
   *
   * 1. Bank name (string)
   * 2. Bank code (string)
   * 3. Routing number (string)
   * 4. Address (string)
   * 5. City (string)
   * 6. State (string)
   * 7. Zip code (string)
   *
   * The fields are separated by commas, and each line ends with a newline character. The file should not contain a header row. Here's an example of what the contents of the `Banks.csv` file might look like:
   *
   * ```
   * Bank of America,BOFA,123456789,123 Main St,San Francisco,CA,94105
   * Wells Fargo,WFC,987654321,456 Oak St,Los Angeles,CA,90001
   * Chase,CHAS,456789123,789 Elm St,New York,NY,10001
   * ```
   *
   * This file contains three banks, with each bank's name, code, routing number, address, city, state, and zip code listed in the appropriate fields.
   */
   static let lines: [String] = {
      CSVUtil.list(fileName: fileName) // Load the CSV file with the specified file name using the `CSVUtil` class
      }()
      static let fileName: String = { "Banks.csv" }() // Set the file name to "Banks.csv"
}
#endif
