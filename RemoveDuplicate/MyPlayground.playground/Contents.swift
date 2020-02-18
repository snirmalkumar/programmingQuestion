import UIKit

var str = "Hello"
var str1 = "transaction"

func removeDuplicatedCharacters(str: String) {
    var nonRepeatCharcters:[Character] = [Character]()
    for c in str {
        if nonRepeatCharcters.contains(c) {
            continue
        } else {
            nonRepeatCharcters.append(c)
        }
    }
    print(String(nonRepeatCharcters))
}
removeDuplicatedCharacters(str: str)
removeDuplicatedCharacters(str: str1)

/*
 * An associated type gives a placeholder name to a type that is used as part of the protocol.
 * The actual type to use for that associated type isn’t specified until the protocol is adopted.
 * Associated types are specified with the associatedtype keyword.
 */

/*
 * Example
 */

protocol ItemsBasket {
    associatedtype ItemDataType
    var itemsList: [ItemDataType] {get set}
    mutating func addItem(id: ItemDataType)
    func getAllBasketItems()-> [ItemDataType]
}

struct NumericProductItemsBasket: ItemsBasket {
    typealias ItemDataType = UInt
    var itemsList = [UInt]()

    mutating func addItem(id: UInt) {
        itemsList.append(id)
    }

    func getAllBasketItems() -> [UInt] {
        return itemsList
    }

}

struct AlphaProductItemsBasket: ItemsBasket {
    typealias ItemDataType = String
    var itemsList = [String]()

    mutating func addItem(id: String) {
        itemsList.append(id)
    }

    func getAllBasketItems() -> [String] {
        return itemsList
    }

}

#if true
var numericProducts = NumericProductItemsBasket()

numericProducts.addItem(id: 100)
numericProducts.addItem(id: 101)
print(numericProducts.getAllBasketItems())

var alphaProducts = AlphaProductItemsBasket()

alphaProducts.addItem(id: "ABC100")
alphaProducts.addItem(id: "ABC101")
print(alphaProducts.getAllBasketItems())
#endif

