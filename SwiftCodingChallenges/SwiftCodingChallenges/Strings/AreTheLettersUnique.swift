//
//  AreTheLettersUnique.swift
//  SwiftCodingChallenges
//
//  Created by Colin Evans on 2023-08-23.
//

import Foundation

//Write a function that accepts a String as its only parameter, and returns true if the string has
//only unique letters, taking letter case into account.

func areTheLettersUnique(input string: String) -> Bool {
  let uniqueCharacters: Set<Character> = Set(string)
  
  return uniqueCharacters.count == string.count
}

func testAreTheLettersUnique() {
  assert(areTheLettersUnique(input: "No duplicates") == true, "Challenge 1 failed")
  assert(areTheLettersUnique(input: "abcdefghijklmnopqrstuvwxyz") == true, "Challenge 1 failed")
  assert(areTheLettersUnique(input: "AaBbCc") == true, "Challenge 1 failed")
  assert(areTheLettersUnique(input: "Hello, world") == false, "Challenge 1 failed")
}
