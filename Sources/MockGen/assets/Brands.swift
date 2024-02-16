import Foundation
import FileSugar
import JSONSugar
import Logger
/**
 * Brands
 * - Remark: These types have accociated icon graphic
 */
public enum Brands {
   /**
    * Brands
    * - Remark: These types have associated icon graphic
    * - Remark: We store the brands in an array to avoid loading them repeatedly.
    * - Remark: We cannot use `Config.Bundle.assets` for this purpose.
    * - Remark: It appears that files inside the assets bundle are moved into the resource path.
    * - Fixme: Consider refactoring this into a method that throws an error if the brands cannot be loaded.
    * - Note: The `brands.json` file should contain a JSON array of strings, where each string represents the name of a brand.
    * - Note: The array should be enclosed in square brackets (`[]`) and each string should be enclosed in double quotes (`"`).
    * - Example: 
    * ```
    * [
    *    "Apple",
    *    "Samsung",
    *    "Google",
    *    "Microsoft",
    *    ...
    * ]
    * ```
    */
   public static let brands: [String] = {
      guard let resourcePath: String = Foundation.Bundle.module.resourcePath else {
         Logger.error("\(Trace.trace()) - Err getting resourcePath")
         return []
      } // Get the resource path for the module
      let filePath: String = resourcePath + "/" + "brands.json" // Construct the file path for the brands.json file
      guard let data: Data = FileParser.data(filePath: filePath) else {
         Logger.error("\(Trace.trace()) - importItems.err \(filePath)")
         return []
      } // Get the data from the file path
      guard let items: [String] = try? data.decode() else {
         Logger.error("\(Trace.trace()) - Err ⚠️️ parsing json")
         return []
      } // Decode the data into an array of strings
      return items.sorted() // Return the array of strings sorted alphabetically
   }()
   /**
    * Returns icon-Image-URL (file path to icon graphic)
    * - Parameter title: title of icon
    */
   public static func iconImageUrl(title: String) -> String {
      Self.brands.first { $0 == title } ?? ""
   }
}
