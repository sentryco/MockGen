import Foundation
import FileSugar
import Logger
/**
 * A utility class for working with CSV files.
 */
class CSVUtil {
   /**
    * Returns an array of strings representing the lines in the specified CSV file
    * - Remark: The function reads the contents of the CSV file and splits it into an array of strings using the specified separator.
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
    * - Remark: The function reads the contents of the CSV file and returns it as a string
    * - Parameters:
    *   - fileName: The name of the CSV file to read.
    * - Returns: The contents of the specified CSV file as a string
    */
   static func content(fileName: String) -> String? {
      guard let resourcePath: String = Foundation.Bundle.module.resourcePath else {
         Logger.error("\(Trace.trace()) - Err getting resourcePath")
         return nil
      }
      let filePath: String = resourcePath + "/" + fileName
      guard FileAsserter.exists(path: filePath) else { Logger.error("\(Trace.trace()) - no file for filename: \(fileName) at path: \(filePath)"); return nil }
      guard let content: String = FileParser.content(filePath: filePath, encoding: .macOSRoman) else {
         Logger.error("\(Trace.trace()) - Err filePath: \(filePath)")
         return nil
      }
      return content
   }
}
