import Foundation
/**
 * A protocol for defining a CSV kind.
 * - Description: The `CSVKind` protocol is used to define the structure and content of a CSV (Comma-Separated Values) file type within the application. It specifies the requirements for any type that conforms to it, such as having a static file name and an array of strings representing the lines of the CSV file.
 * - Remark: The protocol defines a file name and an array of lines for the CSV kind.
 */
protocol CSVKind {
   /**
    * The file name for the CSV kind
    * - Description: The `fileName` property uniquely identifies the CSV file associated with a particular CSV kind. It is used to locate and differentiate the CSV file when performing file operations such as reading or writing.
    */
   static var fileName: String { get }
   /**
    * An array of lines for the CSV kind
    * - Description: Represents the content of the CSV file as an array of strings, each string being a line from the CSV file.
    */
   static var lines: [String] { get }
}
/**
 * A helper extension for the CSVKind protocol
 * - Description: This extension provides utility functions that operate on types conforming to the `CSVKind` protocol.
 * - Remark: The extension provides a function for getting a random line from the array of lines for the CSV kind.
 */
extension CSVKind {
   /**
    * Returns a random line from the array of lines for the CSV kind.
    * - Description: This method retrieves a random line from the `lines` array, which represents individual entries or records in the CSV file. It is useful for testing or when a random sample from the dataset is needed.
    */
   static var line: String? {
      lines.randomElement()
   }
}
