//
//  DoTwoStringsContainSameCharacters.swift
//  SwiftCodingChallenges
//
//  Created by Colin Evans on 2023-08-23.
//

import Foundation

// Write a function that accepts two String parameters, and returns true if they contain the same
// characters in any order taking into account letter case.

func containTheSameCharacters(input1 str1: String, input2 str2: String) -> Bool {
  guard str1.count == str2.count else {
    return false
  }

  // runtime nlogn
  let sortedOne = str1.sorted()
  let sortedTwo = str2.sorted()
  return sortedOne == sortedTwo
}


func testContainTheSameCharacters() {
  assert(containTheSameCharacters(input1: "abca", input2: "abca"))
  assert(containTheSameCharacters(input1: "abc", input2: "cba"))
  assert(containTheSameCharacters(input1: "a1 b2", input2: "b1 a2"))
  assert(!containTheSameCharacters(input1: "abc", input2: "abca"))
  assert(!containTheSameCharacters(input1: "abcc", input2: "abca"))
}

// MARK: - Instructor solution
func challenge3b(string1: String, string2: String) -> Bool {
   return string1.sorted() == string2.sorted()
}
