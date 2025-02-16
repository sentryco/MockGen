import Foundation
import FileSugar
//import Logger
/**
 * A utility class for working with CSV files.
 * Abstract: Provides utility methods for reading and processing CSV files, enabling operations such as retrieving file contents and extracting lines with specified separators.
 * - Description: This class provides methods to read and process CSV files,
 *                allowing for operations such as retrieving the entire content
 *                of a file or extracting individual lines based on a specified separator.
 */
class CSVUtil {
   /**
    * Returns an array of strings representing the lines in the specified CSV file
    * Abstract: Retrieves all lines from a specified CSV file as an array of strings, facilitating CSV data processing.
    * - Description: This method reads the contents of a CSV file and splits
    *                it into an array of strings based on the specified separator.
    *                It is useful for processing CSV files to extract data line by line.
    * - Remark: The function reads the contents of the CSV file and splits
    *           it into an array of strings using the specified separator.
    * - Parameters:
    *   - fileName: The name of the CSV file to read
    *   - seperator: The separator used in the CSV file. Default is ",\n"
    * - Returns: An array of strings representing the lines in the specified CSV file
    */
   static func list(fileName: String, seperator: String = ",\n") -> [String] {
      content(fileName: fileName)?.components(separatedBy: seperator) ?? []
   }
   /**
    * Returns the contents of the specified CSV file as a string
    * - Abstract: Reads and returns the entire contents of a CSV file.
    * - Description: This method reads the contents of a specified CSV file
    *                and returns it as a string. It's useful for retrieving the
    *                raw content of a CSV file for further processing or analysis.
    * - Remark: The function reads the contents of the CSV file and returns it as a string
    * - Parameters:
    *   - fileName: The name of the CSV file to read.
    * - Returns: The contents of the specified CSV file as a string
    */
   static func content(fileName: String) -> String? {
      guard let resourcePath: String = Foundation.Bundle.module.resourcePath else {
         // Logger.error("\(Trace.trace()) - Err getting resourcePath")
         return nil
      }
      let filePath: String = resourcePath + "/" + fileName
      guard FileAsserter.exists(path: filePath) else { /*Logger.error("\(Trace.trace()) - no file for filename: \(fileName) at path: \(filePath)");*/ return nil }
      guard let content: String = FileParser.content(filePath: filePath, encoding: .macOSRoman) else {
         // Logger.error("\(Trace.trace()) - Err filePath: \(filePath)")
         return nil
      }
      return content
   }
}
