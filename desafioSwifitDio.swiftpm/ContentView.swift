import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            let firstName : String = "Steve"
            var lastName : String? = "Jobs"
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("\(firstName) \(lastName!) \n é um dos fundadores da Apple")
        }
    }
}
