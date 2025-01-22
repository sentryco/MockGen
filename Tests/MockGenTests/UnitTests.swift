import XCTest
@testable import MockGen

final class MockGenTests: XCTestCase {
  //  tests for edge cases like zero length passwords.
  func testGeneratePasswordWithZeroLength() {
    let password = CodeGen.generatePassword(length: 0)
    XCTAssertTrue(password.isEmpty, "Password should be empty when length is zero.")
  }
  /**
    * Tests the `randomAddress` property of `MockGen`
    * - Description: Verifies that the `randomAddress` returns a non-empty string. Optionally, you can check if it matches a specific address format using a regular expression.
    */
  func testRandomAddress() {
      // Act
      let address = MockGen.randomAddress
      
      // Assert
      XCTAssertFalse(address.isEmpty, "The randomAddress should not be empty")

      // Optionally, verify the address format using a regular expression
      let addressPattern = "^[0-9]+\\s+[A-Za-z]+\\s+[A-Za-z]+,\\s+[A-Za-z\\s]+,\\s+[A-Za-z]{2}\\s+[0-9]{5}$"
      let regex = try! NSRegularExpression(pattern: addressPattern)
      let range = NSRange(location: 0, length: address.utf16.count)
      let match = regex.firstMatch(in: address, options: [], range: range)
      XCTAssertNotNil(match, "The randomAddress does not match the expected format")
  }
}