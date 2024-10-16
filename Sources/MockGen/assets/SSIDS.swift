#if DEBUG
import Foundation
/*
 * SSIDS is a class that represents a CSV file containing a list of SSIDs.
 * - Note: It conforms to the CSVKind protocol, which defines methods for working with CSV files.
 * - Note: The CSV file should have the following structure:
 *   - The first line should contain the column headers.
 *   - Each subsequent line should contain the data for a single SSID, with columns separated by commas.
 *   - The CSV file should contain the following columns:
 *     - `name`: the name of the SSID, represented as a string.
 *     - `password`: the password for the SSID, represented as a string.
 */
class SSIDS: CSVKind {
   /*
    * The fileName property is a static computed property that returns the name of the CSV file.
    */
   static let fileName: String = { "SSIDS.csv" }()
   /*
    * The lines property is a static computed property that reads the contents of the CSV file into an array of strings.
    */
   static let lines: [String] = {
      CSVUtil.list(fileName: fileName)
   }()
}
#endif
