
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


#if true
/* Program 1 : Sample input and output */
print(encryption(word: "Zoo"))
print(encryption(word: "Aello 2 all"))
#endif

