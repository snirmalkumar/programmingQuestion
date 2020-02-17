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
