//
//  CountTheCharacters.swift
//  SwiftCodingChallenges
//
//  Created by Colin Evans on 2023-08-24.
//

import Foundation

// Write a function that accepts a string, and returns how many times a specific character appears,
// taking case into account.

func countTheCharacters(char: Character, in str: String) -> Int {
  str.filter { $0 == char}.count
}

// Apparently this is not quite as good with speed performamce ?
/*
 however this is not quite as performant – it’s likely to run about 10% slower than the first solution depending on your configuration.
 */
func countTheCharactersReduce(input: String, count: Character) -> Int {
  input.reduce(0) { result, character in
    if character == count {
      return result + 1
    } else {
      return result
    }
  }
}


func testCountTheCharacters() {
  assert(countTheCharacters(char: "a", in: "The rain in Spain") == 2)
  assert(countTheCharacters(char: "i", in: "Mississippi") == 4)
  assert(countTheCharacters(char: "i", in: "Hacking with Swift") == 3)
}


// MARK: - Instructor Solutions
func challenge5c(input: String, count: String) -> Int {
   let array = input.map { String($0) }
   let counted = NSCountedSet(array: array)
   return counted.count(for: count)
}

func challenge5d(input: String, count: String) -> Int {
   let modified = input.replacingOccurrences(of: count, with: "")
   return input.count - modified.count
}
