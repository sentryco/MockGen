[![Tests](https://github.com/sentryco/MockGen/actions/workflows/tests.yml/badge.svg)](https://github.com/sentryco/MockGen/actions/workflows/tests.yml)
[![codebeat badge](https://codebeat.co/badges/6f474052-1ae2-4c61-b72f-dcd23e442278)](https://codebeat.co/projects/github-com-sentryco-mockgen-main)
[![Swift Version](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://swift.org)
![Platforms](https://img.shields.io/badge/platforms-macOS%20|%20iOS-blue.svg)

# 🧪 MockGen

`MockGen` is a Swift library that generates mock data for testing and development purposes. It includes methods for generating random data of different types, such as bank names, notes, and full names, as well as methods for generating passwords and secrets. The library pulls data from `.json` and `.csv` files embedded in the SPM package.

> [!WARNING]  
> Use this data for testing, not for production code, there are better ways to generate secrets for production apps

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [FAQ](#FAQ)
- [Contributing](#contributing)
- [License](#license)

## Installation

To use `MockGen` in your project, add it to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/sentryco/MockGen", branch: "main")
]
```

Then, run `swift build` to build your project and download the dependencies.

## Usage

To use `MockGen` in your code, import the module:

```swift
import MockGen
```

Generating passwords using `arc4random_uniform`:

```swift
CodeGen.generatePassword(length: Int.random(in: 2...48)) // $3K#j9@Lm
let secret = CodeGen.generatePassword(length: 8, useLowercase: false, useNumbers: false, useSpecialChars: false) //
print(secret) // GVHYWQAB
```

Another password generator:

```swift
let secret = SecRan.randomSecret(min: 8, max: 44) // Generates a random secret string between 8 and 44 characters in length.
```

Using symetric key data to generate secrets:

```swift
SecRan.randomSecret(length: 8) //  "UGT7+4P2"
SecRan.randomSecret(length: 9) // "UZYVJ1OS2"
```

Generating passwords using `.randomElement` 

```swift
// from a string 
print(String.randomPassword(pwdLength: Int.random(in: 2...48))) // $3K#j9@Lm
// from scalars
let randomString = String.random(length: 10) // Generates a random string of length 10. aB48xhKk2Yc
```

Lower level calls:

```swift
let randomFullName = MockGen.randomFullName // Returns a random full name.
let randomEmail = MockGen.getEmail(name: "John Doe", brand: "Acme Corp") // Returns a random email address with the specified name and brand.
let randomEmail2 = MockGen.randomEmail // Returns a random email address with a random name and random brand.
let randomWebsite = MockGen.getWebsite(brand: "Acme Corp") // Returns a random website URL with the specified brand.
let randomDate = MockGen.randomDate // Returns a random date string.
let randomInt = MockGen.randomInt(min: 1, max: 100) // Returns a random integer between the specified minimum and maximum values.
let randomDouble = MockGen.randomDouble(min: 0.0, max: 1.0) // Returns a random double between the specified minimum and maximum values.
let randomBool = MockGen.randomBool // Returns a random boolean value.
let randomFirstName = MockGen.randomFirstName // Returns a random first name.
let randomLastName = MockGen.randomLastName // Returns a random last name.
let randomPhoneNumber = MockGen.randomPhoneNumber // Returns a random phone number.
let randomStreetAddress = MockGen.randomStreetAddress // Returns a random street address.
let randomCity = MockGen.randomCity // Returns a random city name.
let randomState = MockGen.randomState // Returns a random state abbreviation.
let randomZipCode = MockGen.randomZipCode // Returns a random zip code.
// e.g., "123 Main St, Springfield, IL 62704"
let randomAddress = MockGen.randomAddress // Returns a random street address.
let randomSSID = MockGen.randomSSID // Returns a random Wi-Fi SSID.
let randomIssuer = MockGen.randomIssuer // Returns a random issuer name.
let randomBrand = MockGen.randomBrand // Returns a random brand name.
let randomOTP = MockGen.randomOTP // Returns a random OTP URL.
```

## Generating Random User Profiles

MockGen can generate comprehensive user profiles combining multiple data points:

```swift
struct UserProfile {
    let fullName: String
    let email: String
    let phoneNumber: String
    let address: String
}

extension MockGen {
    static var randomUserProfile: UserProfile {
        let fullName = randomFullName ?? "John Doe"
        let email = getEmail(name: fullName, brand: randomBrand ?? "example.com") ?? "johndoe@example.com"
        let phoneNumber = randomPhoneNumber()
        let address = randomAddress ?? "123 Main St"
        return UserProfile(fullName: fullName, email: email, phoneNumber: phoneNumber, address: address)
    }
}

// Usage
let userProfile = MockGen.randomUserProfile
print(userProfile.fullName)      // e.g., "Jane Smith"
print(userProfile.email)         // e.g., "jane.smith@example.com"
print(userProfile.phoneNumber)   // e.g., "(555) 123-4567"
print(userProfile.address)       // e.g., "456 Elm St, Anytown, CA 90210"
```

The `SecRan` class provides methods for generating secure random secrets. Including usage examples will demonstrate how to generate cryptographically secure secrets.

```swift
let secret = SecRan.randomSecret(length: 16) // Generates a random secret string of length 16.
let secretInRange = SecRan.randomSecret(min: 8, max: 32) // Generates a random secret string with length between 8 and 32.
```

## FAQ:

- Q: What is `MockGen`?
- A: `MockGen` is a Swift class that generates mock data for testing and development purposes. It includes methods for generating random data of different types, such as bank names, notes, and full names, as well as methods for generating for passwords.
- Q: How do I use `MockGen`?
- A: To use `MockGen` in your code, create an instance of the class: `let mockGen = MockGen()` Then, call the appropriate method to generate the desired mock data: `let randomBankName = mockGen.randomBank`
- Q: Can I customize the generated data?
- A; Yes! `MockGen` includes several methods that allow you to customize the generated data, such as `randomFullNameWithPrefix` and `randomCreditCardWithIssuer`. You can also modify the arrays of data used by `MockGen` to generate the mock data.
- Q: How do I contribute to `MockGen`?
- A: If you find a bug or have a feature request, please open an issue or submit a pull request. Contributions are welcome!
- Q: What license is `MockGen` released under?
- A: `MockGen` is released under the MIT license. See [LICENSE](LICENSE) for more information.

## Resources

- Similar package: https://github.com/vadymmarkov/Fakery

## Todo: 
- Add usage gif
- Refactoring and Code Cleanup
- Error Handling in WordList: The WordList class lacks proper error handling and logging. Implementing error propagation and more detailed logging would make the system more robust and easier to debug.
- Testing and Documentation
Enhance Unit Tests: The current testing suite could be expanded to cover more scenarios and edge cases, particularly for the password and secret generation methods.
- Dependency Management: Review and possibly update the dependencies to ensure they are up-to-date and secure. This includes checking the pinned versions in
- User Documentation
Enhance README Documentation: The README.md file could be expanded to include more detailed examples, a clearer explanation of the project's capabilities, and a more comprehensive guide for new users and contributors.
- Add New Mock Data Generators:
Address Generation: Implement functions to generate random street addresses, including street names, numbers, cities, states/provinces, and postal codes.
- Phone Numbers: Generate random phone numbers formatted according to different country standards.
- Payment Information: Add support for generating mock payment data like bank account numbers, IBANs, or Bitcoin wallet addresses.
- User Profiles: Create composite data structures that represent user profiles, combining names, emails, addresses, and other personal information.
- Company Data: Generate random company names, business types, and related data.
- It might be needed to store resources in assets.bundle they can simply be stored in resources root. See Quirks project. Confirm with copilot
- enhance the error handling in your WordList class:


```
public final class WordList {
    public static func loadWords() throws -> [String] {
        guard let resourcePath = Bundle.module.resourcePath else {
            throw WordListError.resourcePathNotFound
        }
        let filePath = resourcePath + "/" + "words.json"
        guard let data = FileParser.data(filePath: filePath) else {
            throw WordListError.fileNotFound(filePath)
        }
        do {
            let items: [String] = try data.decode()
            return items.sorted()
        } catch {
            throw WordListError.decodingFailed(error)
        }
    }
}

public enum WordListError: Error, LocalizedError {
    case resourcePathNotFound
    case fileNotFound(String)
    case decodingFailed(Error)
    
    public var errorDescription: String? {
        switch self {
        case .resourcePathNotFound:
            return "Resource path could not be found."
        case .fileNotFound(let path):
            return "File not found at path: \(path)"
        case .decodingFailed(let error):
            return "Failed to decode words.json: \(error.localizedDescription)"
        }
    }
}
```