import Foundation

/**
 * AddressGenerator is a utility class for generating random addresses.
 * - Description: This class provides static methods and data arrays to generate random addresses,
 *                including street numbers, street names, street types, cities, states, and zip codes.
 *                It can be used for testing, mocking, or any other situation where random address data is needed.
 */
public class AddressGenerator {
    /// An array of common street names.
    private static let streetNames = ["Main", "High", "Maple", "Oak", "Pine", "Cedar", "Elm", "Washington", "Lake", "Hill"]
    
    /// An array of common street types.
    private static let streetTypes = ["St", "Ave", "Blvd", "Rd", "Ln", "Way"]
    
    /// An array of major US cities.
    private static let cities = ["New York", "Los Angeles", "Chicago", "Houston", "Phoenix"]
    
    /// An array of US state abbreviations.
    private static let states = ["NY", "CA", "IL", "TX", "AZ"]
    
    /// An array of example zip codes corresponding to the cities.
    private static let zipCodes = ["10001", "90001", "60601", "77001", "85001"]
    
    /**
     * Generates a random address string.
     * - Description: Combines random elements from the street names, street types, cities, states, and zip codes arrays
     *                to create a realistic random address. The street number is randomly generated between 1 and 9999.
     * - Returns: A string representing a random address in the format "1234 Main St, City, State ZIP".
     * ## Examples:
     * ```
     * let address = AddressGenerator.randomAddress()
     * print(address) // "123 Maple Ave, Chicago, IL 60601"
     * ```
     */
    public static func randomAddress() -> String {
        let number = Int.random(in: 1...9999)
        let streetName = streetNames.randomElement()!
        let streetType = streetTypes.randomElement()!
        let city = cities.randomElement()!
        let state = states.randomElement()!
        let zipCode = zipCodes.randomElement()!
        return "\(number) \(streetName) \(streetType), \(city), \(state) \(zipCode)"
    }
}