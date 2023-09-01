//
//  CondenseWhitespace.swift
//  SwiftCodingChallenges
//
//  Created by Colin Evans on 2023-09-01.
//

import Foundation

// Write a function that returns a string with any consecutive spaces replaced with a single space.
func condenseWhitespace(for str: String) -> String {
  str.reduce("") { partialResult, character in
    if character != " " {
      return partialResult + character.toString()
    }

    guard let last = partialResult.last else {
      return character.toString()
    }
    
    return last == " "
      ? partialResult
      : partialResult + character.toString()
  }
}

func testCondenseWhitespace() {
  assert(condenseWhitespace(for: "Hello,        world") == "Hello, world")
  assert(condenseWhitespace(for: "Hello, world") == "Hello, world")
  assert(condenseWhitespace(for: "  Hello, world") == " Hello, world")
  assert(condenseWhitespace(for: "Hello, world    ") == "Hello, world ")
}

// MARK: - Instructors Solution - using Regex this result is much slower than the manual solution
func challenge7b(input: String) -> String {
   return input.replacingOccurrences(of: " +", with: " ",
options: .regularExpression, range: nil)
}
