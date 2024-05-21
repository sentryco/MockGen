import Foundation
/**
 * A protocol for defining a CSV kind.
 * - Remark: The protocol defines a file name and an array of lines for the CSV kind.
 */
protocol CSVKind {
   /**
    * The file name for the CSV kind
    */
   static var fileName: String { get }
   /**
    * An array of lines for the CSV kind
    */
   static var lines: [String] { get }
}
/**
 * A helper extension for the CSVKind protocol
 * - Remark: The extension provides a function for getting a random line from the array of lines for the CSV kind.
 */
extension CSVKind {
   /**
    * Returns a random line from the array of lines for the CSV kind.
    */
   static var line: String? {
      lines.randomElement()
   }
}
