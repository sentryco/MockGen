#if DEBUG
import Foundation
/**
 * A class that provides access to a list of names from a CSV file in the debug build.
 * - Description: This class provides access to a list of names stored in a CSV file.
 *   It is designed to be used for generating mock data or testing scenarios that require
 *   realistic person names, genders, ages, and occupations. The class conforms to the
 *   CSVKind protocol, which defines the structure for accessing CSV-based data.
 * - Note: This class is only available in DEBUG builds to ensure it's not included in production code.
 */
class Names: CSVKind {
   /**
    * Load the list of names from the CSV file when the class is first accessed.
    *
    * The list of names is stored in a CSV file with the following structure:
    *
    * - The first column contains the first name of the person.
    * - The second column contains the last name of the person.
    * - The third column contains the gender of the person (either "male" or "female").
    * - The fourth column contains the age of the person (in years).
    * - The fifth column contains the occupation of the person.
    *
    * Example:
    * John,Smith,male,32,engineer
    * Jane,Doe,female,27,teacher
    * ...
    *
    * - Return An array of strings representing the lines in the CSV file.
    */
   static let lines: [String] = {
      CSVUtil.list(fileName: fileName)
   }()
   /**
    * The name of the CSV file that contains the list of names.
    */
   static let fileName: String = "Names.csv"
}
#endif
