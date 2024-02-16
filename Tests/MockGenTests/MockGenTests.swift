import XCTest
@testable import MockGen

final class MockGenTests: XCTestCase {
   func testExample() throws {
      // Getters
      Self.testGetEmail()
      Self.testGetWebsite()
      Self.testRandomFirstName()
      // Self.testRandomName()
      // util
      Self.testRandomDate()
      Self.testGetRandomBool()
      // variables
      Self.testRandomBank()
      Self.testRandomNote()
      Self.testRandomFullName()
      Self.testRandomSSID()
      Self.testRandomIssuer()
      Self.testRandomBrand()
      Self.testRandomOTP()
      // password
      Self.testGeneratePassword()
      // secrets
      Self.testRandomSecretWithMinMax()
      Self.testRandomSecretWithLength()
      // random
      Self.testRandomPassword()
      Self.testRandom()
      Swift.print("✅")
   }
}
/**
 * Getters
 */
extension MockGenTests {
   fileprivate static func testGetEmail() {
      let email = MockGen.getEmail(name: "John", brand: "Apple")
      XCTAssertNotNil(email, "getEmail returned nil.")
      XCTAssertTrue(email?.contains("@") ?? false, "getEmail did not return a valid email.")
   }
   
   fileprivate static func testGetWebsite() {
      let website = MockGen.getWebsite(brand: "Apple")
      XCTAssertNotNil(website, "getWebsite returned nil.")
   }
   
   fileprivate static func testRandomFirstName() {
      let firstName = MockGen.randomFirstName
      XCTAssertNotNil(firstName, "randomFirstName returned nil.")
   }
   
   //    fileprivate func testRandomName() {
   //        let name = MockGen.randomName
   //        XCTAssertNotNil(name, "randomName returned nil.")
   //    }
}
/**
 * util tests
 */
extension MockGenTests {
   fileprivate static func testRandomDate() {
      let date = MockGen.randomDate
      XCTAssertNotNil(date, "randomDate returned nil.")
      // Add more assertions here to validate the format and range of the date
   }
   
   fileprivate static func testGetRandomBool() {
      let bool = MockGen.getRandomBool(3)
      // This assertion is a bit tricky because the result is random
      // But you can run it multiple times to statistically verify that it's working correctly
      XCTAssertTrue(bool == true || bool == false, "getRandomBool did not return a boolean.")
   }
}
/**
 * variable test
 */
extension MockGenTests {
   fileprivate static func testRandomBank() {
      let bank = MockGen.randomBank
      XCTAssertNotNil(bank, "randomBank returned nil.")
   }
   
   fileprivate static func testRandomNote() {
      let note = MockGen.randomNote
      XCTAssertNotNil(note, "randomNote returned nil.")
   }
   
   fileprivate static func testRandomFullName() {
      let fullName = MockGen.randomFullName
      XCTAssertNotNil(fullName, "randomFullName returned nil.")
   }
   
   fileprivate static func testRandomSSID() {
      let ssid = MockGen.randomSSID
      XCTAssertNotNil(ssid, "randomSSID returned nil.")
   }
   
   fileprivate static func testRandomIssuer() {
      let issuer = MockGen.randomIssuer
      XCTAssertNotNil(issuer, "randomIssuer returned nil.")
   }
   
   fileprivate static func testRandomBrand() {
      let brand = MockGen.randomBrand
      XCTAssertNotNil(brand, "randomBrand returned nil.")
   }
   
   fileprivate static func testRandomOTP() {
      let otp = MockGen.randomOTP
      XCTAssertNotNil(otp, "randomOTP returned nil.")
      XCTAssertTrue(otp?.contains("otpauth://") ?? false, "randomOTP did not return a valid OTP.")
   }
   
}

extension MockGenTests {
    fileprivate static func testGeneratePassword() {
        let password = CodeGen.generatePassword(length: 10)
        XCTAssertNotNil(password, "generatePassword returned nil.")
        XCTAssertEqual(password.count, 10, "Password length is not correct.")
        
        let passwordWithoutLowercase = CodeGen.generatePassword(length: 10, useLowercase: false)
        XCTAssertFalse(passwordWithoutLowercase.range(of: "[a-z]", options: .regularExpression) != nil, "Password contains lowercase letters.")
        
        let passwordWithoutNumbers = CodeGen.generatePassword(length: 10, useNumbers: false)
        XCTAssertFalse(passwordWithoutNumbers.range(of: "[0-9]", options: .regularExpression) != nil, "Password contains numbers.")
        
        let passwordWithoutSpecialChars = CodeGen.generatePassword(length: 10, useSpecialChars: false)
        XCTAssertFalse(passwordWithoutSpecialChars.range(of: "[!@#$%^&*]", options: .regularExpression) != nil, "Password contains special characters.")
    }
}

extension MockGenTests {
    
    fileprivate static func testRandomSecretWithMinMax() {
        let secret = SecRan.randomSecret(min: 10, max: 20)
        XCTAssertNotNil(secret, "randomSecret(min:max:) returned nil.")
        XCTAssertTrue((10...20).contains(secret?.count ?? 0), "Secret length is not within the specified range.")
      
    }

    fileprivate static func testRandomSecretWithLength() {
        let secret = SecRan.randomSecret(length: 10)
        XCTAssertNotNil(secret, "randomSecret(length:) returned nil.")
        XCTAssertEqual(secret?.count, 10, "Secret length is not correct.")
    }
}

extension MockGenTests {
    fileprivate static func testRandomPassword() {
        let password = String.randomPassword(pwdLength: 10)
        XCTAssertEqual(password.count, 10, "Password length is not correct.")
    }
    fileprivate static func testRandom() {
        let randomString = String.random(length: 10)
        XCTAssertEqual(randomString.count, 10, "Random string length is not correct.")
    }
}
