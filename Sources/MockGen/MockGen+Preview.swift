#if DEBUG
import SwiftUI
/**
 * Preview for mockgen
 */
#Preview {
   VStack {
      Text("\(MockGen.randomFullName ?? "Nothing")")
      Text("\(MockGen.randomEmail ?? "Nothing")")
      Text("\(MockGen.randomBrand ?? "Nothing")")
      Text("\(MockGen.getWebsite(brand: MockGen.randomBrand ?? "Nothing") ?? "Nothing")")
      Text("\(MockGen.getEmail(name: MockGen.randomFirstName ?? "Nothing", brand: MockGen.randomBrand ?? "Nothing") ?? "Nothing")")
      Text("\(MockGen.randomFirstName ?? "Nothing")")
      Text("\(MockGen.randomDate/* ?? "Nothing"*/)")
   }
   .frame(width: 300, height: 300)
}
#endif
