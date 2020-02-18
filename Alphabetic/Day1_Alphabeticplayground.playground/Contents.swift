
/*
 * Daily Pratice - Swift Programs
 */

import Foundation

/*
 * Program 1: Basic string encoding based on below constraint for every letter in the string
 *
 * a) If letter is "vowel", Should change it to previous alpha letter from the order
 *    Ex: "a" means, Should change to "z", "b" means, Should change to "a", and so on
 * b) If letter is non "vowel", Should change it to next alpha letter from the order
 *    Ex: "b" means, Should change to "c", "z" means, Should change to "a", and so on
 * c) If other than alpha, we should add it as it is.
 */

func encryption(word: String) -> String {
    
    let vowels = "AEIOUaeiou"
    let letters = CharacterSet.letters
    var encryptedWord = ""
    
    for charValue in word {
        guard charValue.isASCII, let asciiValue = charValue.asciiValue, letters.contains(UnicodeScalar(asciiValue)) else {
            encryptedWord.append(charValue)
            continue
        }
        
        let baseASCIIvalue: UInt8 = asciiValue >= 97 ? 97 : 65
        let charASCIIfromBase = asciiValue - baseASCIIvalue
        
        if vowels.contains(charValue) {
            encryptedWord.append(Character(UnicodeScalar(baseASCIIvalue + (((charASCIIfromBase + 26) - 1) % 26))))
        } else {
        encryptedWord.append(Character(UnicodeScalar(baseASCIIvalue + ((charASCIIfromBase + 1) % 26))))
        }
    }
    return encryptedWord
}


#if false
/* Program 1 : Sample input and output */
print(encryption(word: "Zoo"))
print(encryption(word: "Aello 2 all"))
#endif

/*
* Program 2 : Maximum String Partition
* Given a string. the Tas is to find the maximum number P, Such that given string can be partitioned into p contiguous substrig such thatany two adjacent substring must be different
*more formally S=S1S1...SP and Si != Si+1(0<=i<=p-1)
* Input str = "aabccd"
* Output: 4
 Explanation:we can divide the given string intofour string, like "a", "ab", "c","cd" we ca not divide it more than four parts, if we do then the condotions Si!=Si+1(0<=i<=p-1) will not satisfy
*/

/* Hint:using datastructures like binary tree and binary search tree will give better solution
 */

/*
 */
func stringPartitionCount(str: String)  -> Int {
    var partitionArray = [String]()
    var currentPatitionString = ""
    for charcter in str {
        currentPatitionString.append(charcter)
        if !partitionArray.contains(currentPatitionString) {
            partitionArray.append(currentPatitionString)
            currentPatitionString = ""
        }
    }
    return partitionArray.count
}
#if true /*
 sample input and output
 */
print(stringPartitionCount(str: "aabddccd"))
#endif
