
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
 */

/*
 * Given a string. the Tas is to find the maximum number P, Such that given string
 * can be partitioned into p contiguous substrig such thatany two adjacent substring
 * must be different
 * more formally S=S1S1...SP and Si != Si+1(0<=i<=p-1)
 *
 * Input str = "aabccd"
 * Output: 4
 *
 * Explanation:
 * we can divide the given string intofour string, like "a", "ab", "c","cd".
 * we ca not divide it more than four parts,
 * if we do then the condotions Si!=Si+1(0<=i<=p-1) will not satisfy..
 
 Approach:
 =========
 1. Here we only have to focus on the value of P, not upon finding those P substrings.
 2. We will solve it greedily, we always check the current string that we have with the previous string that has been taken already.
 3. If we found that both of them are same then we will go forward otherwise create a partition here and change the previous track of the string to current string, means we will treat this current string as the previous string for future comparison.
 => Below is the implementation of above Approach...
 */



// Return the count of string
func maxPartition(str: String) -> Int
{
    var  partitionOccurs = 0 /* Will Hold the total partition */
    
    // Current will store current string
    // Previous will store the previous
    var current = "", previous = ""
    
    for charcter in str {
        
        current.append(charcter) // Add a character to current string
        
        if (current != previous) {
            
            // Here we will create a partition and
            // update the previous string with
            // current string
            previous = current;
            
            // Now we will clear the current string
            current = "";
            
            // Increment the count of partition.
            partitionOccurs += 1;
        }
    }
    
    return partitionOccurs;
}

#if false
/*
 * sample input and output
 */
print(maxPartition(str: "aaaa"))
print(maxPartition(str: "aabccd"))
#endif


/*
 * Another approach with different result
 */
/* Hint:using datastructures like binary tree and binary search tree will give better solution
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
#if false
/*
 * sample input and output
 */
print(stringPartitionCount(str: "aaaa"))
print(stringPartitionCount(str: "aabccd"))
#endif




#if false

// @unknown keyword in switch case

/*
 The downside of using a "default" case is that the compiler can no longer alert a developer that a particular enum has elements that aren't explicitly handled in the "switch". To remedy this, switch cases will gain a new attribute, "@unknown".
 */

//Example Shape enum

enum Shape {
    case circle
    case squre
    case rectanlge
    case qube
}

let currentShape = Shape.circle

// only default case (No warning for unused case labels):

switch currentShape {
case .circle:
    print("Circle")
case .squre:
    print("squre")
// Compiler wont give any warning message for unused cases by using normal default keyword
default:
    print("Default Case")
    
}

// Switch with @unknown default case (Giving suggestion warning for unused case labels):

switch currentShape {
case .circle:
    print("Circle")
case .squre:
    print("squre")
// while using @unknown keyword in front of the default, the compiler will show a warning message for unused cases (only if your enum still having case labels) like "Switch must be exhaustive - Do you want to add missing cases?"
@unknown default:
    print("Default Case")
    
}



#endif


/*
 * Day 5: Program - String Replace
 */

/*
 * Requirement: Given a valid (IPv4) IP address, return a defanged version of that IP address.
 * A defanged IP address replaces every period "." with "[.]".
 *
 * Example 1:
 * Input: address = "1.1.1.1"
 * Output: "1[.]1[.]1[.]1"
 */


func stringIPv4PatternReplace(actualString: String, newPattern: String) -> String {
    let ipPartionStringArray = actualString.split(separator: ".")
    
    let filteredResult = ipPartionStringArray.filter { ipPartionString in
        guard let number = Int(ipPartionString) else { return false }
        return number >= 0 && number < 256
    }
    guard 4 == filteredResult.count else {
        return "Invalid IP"
    }
    return ipPartionStringArray.joined(separator: newPattern)
}

#if true
print(stringIPv4PatternReplace(actualString: "1.1.1.1", newPattern: "[.]"))
print(stringIPv4PatternReplace(actualString: "1a.1.1.1", newPattern: "[.]"))
#endif

