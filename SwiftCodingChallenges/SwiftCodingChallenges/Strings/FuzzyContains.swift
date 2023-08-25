//
//  FuzzyContains.swift
//  SwiftCodingChallenges
//
//  Created by Colin Evans on 2023-08-23.
//

import Foundation

// Write your own version of the contains() method on String that ignores letter case, and
// without using the existing contains() method.

// Runtime O(n + m)
extension String {
  // Exception: Empty `substring` returns `true`
  func fuzzyContains(_ substring: String) -> Bool {
    // Step match the case of the string
    let lowerSubString = Array(substring.lowercased())
    let lowerSelf = Array(self.lowercased())

    guard let firstChar = lowerSubString.first else {
      return true
    }
    
    // Base case
    var firstIndex = lowerSelf.firstIndex(of: firstChar)
    
    // The index cannot go out of bounds of `Self`
    while(firstIndex != nil && firstIndex! < lowerSelf.count) {
      let potentialSubString = Array(lowerSelf[firstIndex!...])
      
      // Check if the substring is a match to the current pointer
      var matchLength = lowerSubString.count
      for index in lowerSubString.indices {
        if lowerSubString[index] == potentialSubString[index] {
          matchLength -= 1
        } else {
          break
        }
      }
      
      // Check if we iterated through the entire substring
      if matchLength == .zero {
        return true
      } else {
        firstIndex = potentialSubString.dropFirst().firstIndex(of: firstChar)
      }
    }
    
    return false
  }
}

func testFuzzyContains() {
  assert("Hello, world".fuzzyContains("Hello"))
  assert("Hello, world".fuzzyContains("WORLD"))
  assert("Huf Hello, world".fuzzyContains("Hello"))
  assert("Hello, world".fuzzyContains("GoodBye") != true)
}

// MARK: - Learning notes:
// ArraySlice presents a view on storage of a larger array i.e the indicies do not reset to zero


// MARK: - Instructors Response:
extension String {
   func fuzzyContainsAnswer(_ string: String) -> Bool {
      return range(of: string, options: .caseInsensitive) != nil
   }
}
