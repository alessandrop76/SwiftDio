import UIKit

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

makeArray(repeating: "Bater", numberOfTimes: 5)

enum OptionalValue<Warapped> {
    case none
    case some(Warapped)
}

var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

func anyCommonElement<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
where T.Element: Equatable, T.Element == U.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem{
                return true
            }
        }
    }
    return false
}

anyCommonElement([1,3,4,5,6,8,9], [92])
