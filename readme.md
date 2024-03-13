[![Tests](https://github.com/sentryco/MockGen/actions/workflows/tests.yml/badge.svg)](https://github.com/sentryco/MockGen/actions/workflows/tests.yml)
[![codebeat badge](https://codebeat.co/badges/6f474052-1ae2-4c61-b72f-dcd23e442278)](https://codebeat.co/projects/github-com-sentryco-mockgen-main)

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
    .package(url: "https://github.com/username/MockGen.git", branch: "main")
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

## Contributing

If you find a bug or have a feature request, please open an issue or submit a pull request. Contributions are welcome!

## License

`MockGen` is released under the MIT license. See [LICENSE](LICENSE) for more information.
