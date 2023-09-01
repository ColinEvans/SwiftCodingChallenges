//
//  RemoveDuplicateLettersFromAString.swift
//  SwiftCodingChallenges
//
//  Created by Colin Evans on 2023-08-28.
//

import Foundation

// Write a function that accepts a string as its input, and returns the same string just with
// duplicate letters removed.

// Assumption - If the string doesn't contain the character, return the original string
func removeDuplicate(from str: String, char: Character) -> String {
  guard let firstIndex = str.firstIndex(of: char) else {
    return str
  }
  let firstHalfRange = str[str.startIndex...firstIndex]
  let stringRange = str.index(after: firstIndex)...str.index(before: str.endIndex)
  let result = firstHalfRange + str[stringRange].filter { $0 != char }
  return String(result)
}

func testRemoveDuplicate() {
  assert(removeDuplicate(from: "Hello, world", char: "l") == "Helo, word")
  assert(removeDuplicate(from: "wombat", char: "o") == "wombat")
  assert(removeDuplicate(from: "success", char: "s") == "succe")
  assert(removeDuplicate(from: "Mississippi", char: "i") == "Misssspp")
}


// Did the incorrect question lol, that was removing duplicates given a char
// try again: Write a function that accepts a string as its input, and returns the same string just
// with duplicate letters removed.

// O(n^2)
func removeDuplicates(for str: String) -> String {
  str.reduce("") { partialResult, character in
    let nextString = partialResult.contains(character) ? "" : character.toString()
    return partialResult + nextString
  }
}

func testRemoveDuplicates() {
  assert(removeDuplicates(for: "Hello, world") == "Helo, wrd")
  assert(removeDuplicates(for: "wombat") == "wombat")
  assert(removeDuplicates(for: "success") == "suce")
  assert(removeDuplicates(for: "Mississippi") == "Misp")
}

extension Character {
  func toString() -> String {
    String(self)
  }
}


// MARK: - Instructor Solution NSOrderedSet
func challenge6a(string: String) -> String {
   let array = string.map { String($0) }
   let set = NSOrderedSet(array: array)
   let letters = Array(set) as! Array<String>
   return letters.joined()
}

func challenge6c(string: String) -> String {
   var used = [Character: Bool]()
   let result = string.filter {
     used.updateValue(true, forKey: $0) == nil
   }
  return result
}
