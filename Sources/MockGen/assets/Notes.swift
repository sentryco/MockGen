#if DEBUG
import Foundation

/*
 * Notes is a class that represents a CSV file containing notes.
 * It conforms to the CSVKind protocol, which defines methods for working with CSV files.
 */
class Notes: CSVKind {
   /*
    * The lines property is a static computed property that reads the contents of the CSV file into an array of strings.
    * The CSV file should have the following structure:
    * - The first line should contain the column headers. The column headers should be separated by commas and should match the properties of the `Note` struct.
    * - Each subsequent line should contain the data for a single note, with columns separated by commas. The order of the columns should match the order of the properties in the `Note` struct. The data for each note should be on a separate line.
    * The `Note` struct has the following properties:
    * - `id`: a unique identifier for the note, represented as an integer.
    * - `title`: the title of the note, represented as a string.
    * - `body`: the body of the note, represented as a string.
    * - `timestamp`: the timestamp of the note, represented as a string in the format "yyyy-MM-dd HH:mm:ss".
    */
   static let lines: [String] = {
      CSVUtil.list(fileName: fileName)
   }()
   /*
    * The fileName property is a static computed property that returns the name of the CSV file.
    */
   static let fileName: String = { "Notes.csv" }()
}
#endif
