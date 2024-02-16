import Foundation
/**
 * A protocol for defining a CSV kind.
 * - Remark: The protocol defines a file name and an array of lines for the CSV kind.
 */
protocol CSVKind {
   static var fileName: String { get } // The file name for the CSV kind
   static var lines: [String] { get } // An array of lines for the CSV kind
}
/**
 * A helper extension for the CSVKind protocol.
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
