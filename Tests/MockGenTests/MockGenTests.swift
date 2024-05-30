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
   /**
    * - Fixme: ⚠️️ add description
    */
   fileprivate static func testGetEmail() {
      let email = MockGen.getEmail(name: "John", brand: "Apple")
      XCTAssertNotNil(email, "getEmail returned nil.")
      XCTAssertTrue(email?.contains("@") ?? false, "getEmail did not return a valid email.")
   }
   /**
    * - Fixme: ⚠️️ add description
    */
   fileprivate static func testGetWebsite() {
      let website: String? = MockGen.getWebsite(brand: "Apple")
      XCTAssertNotNil(website, "getWebsite returned nil.")
   }
   /**
    * - Fixme: ⚠️️ add description
    */
   fileprivate static func testRandomFirstName() {
      let firstName: String? = MockGen.randomFirstName
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
   /**
    * - Fixme: ⚠️️ add description
    */
   fileprivate static func testRandomDate() {
      let date: String = MockGen.randomDate
      XCTAssertNotNil(date, "randomDate returned nil.")
      // Add more assertions here to validate the format and range of the date
   }
   /**
    * - Fixme: ⚠️️ add description
    */
   fileprivate static func testGetRandomBool() {
      let bool: Bool = MockGen.getRandomBool(3) // chance factor
      // This assertion is a bit tricky because the result is random
      // But you can run it multiple times to statistically verify that it's working correctly
      XCTAssertTrue(bool == true || bool == false, "getRandomBool did not return a boolean.")
   }
}
/**
 * variable test
 */
extension MockGenTests {
   /**
    * - Fixme: ⚠️️ add description
    */
   fileprivate static func testRandomBank() {
      let bank: String? = MockGen.randomBank
      XCTAssertNotNil(bank, "randomBank returned nil.")
   }
   /**
    * - Fixme: ⚠️️ add description
    */
   fileprivate static func testRandomNote() {
      let note: String? = MockGen.randomNote
      XCTAssertNotNil(note, "randomNote returned nil.")
   }
   /**
    * - Fixme: ⚠️️ add description
    */
   fileprivate static func testRandomFullName() {
      let fullName: String? = MockGen.randomFullName
      XCTAssertNotNil(fullName, "randomFullName returned nil.")
   }
   /**
    * - Fixme: ⚠️️ add description
    */
   fileprivate static func testRandomSSID() {
      let ssid: String? = MockGen.randomSSID
      XCTAssertNotNil(ssid, "randomSSID returned nil.")
   }
   /**
    * - Fixme: ⚠️️ add description
    */
   fileprivate static func testRandomIssuer() {
      let issuer: String? = MockGen.randomIssuer
      XCTAssertNotNil(issuer, "randomIssuer returned nil.")
   }
   /**
    * - Fixme: ⚠️️ add description
    */
   fileprivate static func testRandomBrand() {
      let brand: String? = MockGen.randomBrand
      XCTAssertNotNil(brand, "randomBrand returned nil.")
   }
   /**
    * - Fixme: ⚠️️ add description
    */
   fileprivate static func testRandomOTP() {
      let otp: String? = MockGen.randomOTP
      XCTAssertNotNil(otp, "randomOTP returned nil.")
      XCTAssertTrue(otp?.contains("otpauth://") ?? false, "randomOTP did not return a valid OTP.")
   }
}
/**
 * - Fixme: ⚠️️ add description
 */
extension MockGenTests {
   /**
    * - Fixme: ⚠️️ add description
    */
    fileprivate static func testGeneratePassword() {
        let password: String = CodeGen.generatePassword(length: 92)
        XCTAssertNotNil(password, "generatePassword returned nil.")
        XCTAssertEqual(password.count, 92, "Password length is not correct.")
        
        let passwordWithoutLowercase: String = CodeGen.generatePassword(length: 44, useLowercase: false)
        XCTAssertFalse(passwordWithoutLowercase.range(of: "[a-z]", options: .regularExpression) != nil, "Password contains lowercase letters.")
        
        let passwordWithoutNumbers: String = CodeGen.generatePassword(length: 32, useNumbers: false)
        XCTAssertFalse(passwordWithoutNumbers.range(of: "[0-9]", options: .regularExpression) != nil, "Password contains numbers.")
        
        let passwordWithoutSpecialChars: String = CodeGen.generatePassword(length: 8, useSpecialChars: false)
        XCTAssertFalse(passwordWithoutSpecialChars.range(of: "[!@#$%^&*]", options: .regularExpression) != nil, "Password contains special characters.")
    }
}
/**
 * - Fixme: ⚠️️ add description
 */
extension MockGenTests {
   /**
    * - Fixme: ⚠️️ add description
    */
   fileprivate static func testRandomSecretWithMinMax() {
      let minMax = (min: 32, max: 64)
      let secret: String? = SecRan.randomSecret(min: minMax.min, max: minMax.max)
      XCTAssertNotNil(secret, "randomSecret(min:max:) returned nil.")
      XCTAssertTrue((minMax.min...minMax.max).contains(secret?.count ?? 0), "Secret length is not within the specified range.")
   }
   /**
    * - Fixme: ⚠️️ add description
    */
    fileprivate static func testRandomSecretWithLength() {
       let len = 128
       let secret: String? = SecRan.randomSecret(length: len)
        XCTAssertNotNil(secret, "randomSecret(length:) returned nil.")
        XCTAssertEqual(secret?.count, len, "Secret length is not correct.")
    }
}
/**
 * - Fixme: ⚠️️ add description
 */
extension MockGenTests {
   /**
    * - Fixme: ⚠️️ add description
    */
    fileprivate static func testRandomPassword() {
        let password: String = String.randomPassword(pwdLength: 64)
        XCTAssertEqual(password.count, 64, "Password length is not correct.")
    }
   /**
    * - Fixme: ⚠️️ add description
    */
    fileprivate static func testRandom() {
        let randomString: String = String.random(length: 88)
        XCTAssertEqual(randomString.count, 88, "Random string length is not correct.")
    }
}
