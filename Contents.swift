let firstName = "Steve"
var lastName : String? = "Jobs"

var otherLastName : String? = "Wozniak"
//var otherLastName : String? = nil

print("\(firstName) \(lastName!) é um dos fundadores da Apple")

if otherLastName != nil {
    print("\(firstName) \(otherLastName!) é um dos fundadores da Apple")
}else{
    print("\(firstName) \(lastName!) e \(firstName) Wozniak são os fundadores da Apple")
}

