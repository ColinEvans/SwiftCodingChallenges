//
//  FuzzyContains.swift
//  SwiftCodingChallenges
//
//  Created by Colin Evans on 2023-08-23.
//

import Foundation

// Write your own version of the contains() method on String that ignores letter case, and
// without using the existing contains() method.

extension String {
  // Exception: Empty `substring` returns `true`
  func fuzzyContains(_ substring: String) -> Bool {
    let lowerSubString = substring.lowercased()
    guard let firstChar = substring.first,
          var firstIndex = self.firstIndex(of: firstChar) else {
      return true
    }
    
  }
  
  private func fuzzyContainsRecursion(
    substring: String,
    subArray: String
  ) {
    
  }
}

func testFuzzyContains() {
  assert("Hello, world".fuzzyContains("Hello"))
  assert("Hello, world".fuzzyContains("WORLD"))
  assert("Huf Hello, world".fuzzyContains("Hello"))
  assert("Hello, world".fuzzyContains("GoodBye") != true)
}
