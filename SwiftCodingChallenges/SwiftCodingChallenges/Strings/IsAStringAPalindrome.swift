//
//  IsAStringAPalindrome.swift
//  SwiftCodingChallenges
//
//  Created by Colin Evans on 2023-08-23.
//

import Foundation

// Write a function that accepts a String as its only parameter, and returns true if the string reads
// the same when reversed, ignoring case.

func isPalindrome(input string: String) -> Bool {
  let lowerCaseString = string.lowercased()
  
  var endPointer = lowerCaseString.index(before: string.endIndex)
  var startPointer = lowerCaseString.startIndex
  
  while(startPointer < endPointer) {
    if lowerCaseString[startPointer] != lowerCaseString[endPointer] {
      return false
    }
    
    startPointer = lowerCaseString.index(after: startPointer)
    endPointer = lowerCaseString.index(before: endPointer)
  }
  
  return true
}


func testIsPalindrome() {
  assert(isPalindrome(input: "racecar"), "Challenge2 failed")
  assert(!isPalindrome(input: "Hello, world"), "Challenge2 failed")
  assert(isPalindrome(input: "Rats live on no evil star"), "Challenge2 failed")
}


// MARK: - Instructor Solution
func challenge2a(input: String) -> Bool {
  let lowercased = input.lowercased()
  return String(lowercased.reversed()) == input
}
