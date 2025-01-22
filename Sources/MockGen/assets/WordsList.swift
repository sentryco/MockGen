import Foundation
import JSONSugar
import FileSugar
//import Logger
/**
 * JSON -> String-Array
 */
public final class WordList {
   /**
    * A utility class for retrieving a list of bitcoin seed words.
    * - Note: The list of words is stored in a text file located in the app's resource path.
    * - Note: The text file is parsed into an array of strings, which is then returned.
    * - Note: https://github.com/bitcoin/bips/blob/master/bip-0039/english.txt#L608 (The selected URL points to the English word list file for the BIP-0039 standard on the official Bitcoin Improvement Proposals (BIP) repository on GitHub. The file contains a list of 2048 words that are used for generating word-based passwords in the context of Bitcoin wallets and other applications that use the BIP-0039 standard.)
    * - Note: The list of words is based on the BIP-0039 standard and is used for generating word-based passwords.
    * - Remark: The text file is located at `Config.Bundle.assets/english.txt`.
    * - Fixme: ⚠️️ Consider storing the list of words in a plist instead of a text file.
    * - Fixme: ⚠️⚠️️ Refactor this class to throw an error if the resource path cannot be obtained or if the data cannot be read or parsed.
    */
   public final class WordList {
      /**
       * Returns an array of bitcoin seed words.
       */
      public static let words: [String] = {
         // Get the resource path for the Xcode project module
         guard let resourcePath: String = Foundation.Bundle.module.resourcePath else {
            // Logger.error("\(Trace.trace()) - Err getting resourcePath")
            return [] // Return an empty array if the resource path cannot be obtained
         }
         // Construct the file path to the english.txt file
         let filePath: String = resourcePath + "/" + "english.txt"
         // Read the data from the english.txt file
         guard let data: Data = FileParser.data(filePath: filePath) else {
            // Logger.error("\(Trace.trace()) - Err reading data: \(filePath)")
            return [] // Return an empty array if the data cannot be read
         }
         // Parse the data into an array of strings
         guard let items: [String] = String(data: data, encoding: .utf8)?.components(separatedBy: .newlines) else {
            // Logger.error("\(Trace.trace()) - Err parsing data: \(data)")
            return [] // Return an empty array if the data cannot be parsed
         }
         // Return the array of strings
         return items
      }()
   }
   public static let words: [String] = {
      // Get the resource path for the Xcode project module
      guard let resourcePath: String = Foundation.Bundle.module.resourcePath else {
         // Logger.error("\(Trace.trace()) - Err getting resourcePath")
         return [] // Return an empty array if the resource path cannot be obtained
      }
      // Construct the file path to the words.json file
      let filePath: String = resourcePath + "/" + "words.json"
      // Read the data from the words.json file
      guard let data: Data = FileParser.data(filePath: filePath) else {
         // Logger.error("\(Trace.trace()) - Err reading data: \(filePath)")
         return [] // Return an empty array if the data cannot be read
      }
      // Parse the data into an array of strings
      guard let items: [String] = try? data.decode() else {
         // Logger.error("\(Trace.trace()) - Err ⚠️️ parsing json")
         return [] // Return an empty array if the data cannot be parsed
      }
      // Sort the array of strings alphabetically and return it
      return items.sorted()
   }()
}
