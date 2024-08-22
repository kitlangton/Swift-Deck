//
//  ParameterPacksDeck.swift
//  DeckExample
//
//  Created by Kit Langton on 9/28/23.
//

import SwiftUI

protocol Upgradable {
  associatedtype Upgraded
  func upgrade() -> Upgraded
}

struct MechaInt {
  let value: Int
  
  func demolishCountryside() { }
}

extension Int: Upgradable {
  func upgrade() -> MechaInt {
    MechaInt(value: self)
  }
}


func upgrade<each T: Upgradable>(_ value: repeat each T) -> (repeat (each T).Upgraded) {
  return (repeat (each value).upgrade())
}


func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
  return (repeat each value)
}

func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
  (repeat (each value, each value))
}

func comp<each Element: Comparable>(
  lhs: (repeat each Element),
  rhs: (repeat each Element)
)
  -> Bool
{
  var allTrue = true

  func assertTrue<A: Comparable>(_ x: A, y: A) {
    let result = x < y
//    print("comparing \(x) < \(y) = \(result)")
    if !result {
      allTrue = false
    }
  }

  repeat assertTrue(each lhs, y: each rhs)

//  var cool = true
//  repeat (cool = each lhs < each rhs && cool)
//  print("COOL: \(cool)")

//  let cool = (repeat each lhs, repeat each rhs)
//  print("cool: \(cool)")

  return allTrue
}

func concat<each T, each U>(t: repeat each T, u: repeat each U) -> (repeat each T, repeat each U) {
  (repeat each t, repeat each u)
}

func concat2<each T, each U>(t: repeat each T, u: repeat each U) -> Any {
//  (repeat each t, repeat each u)
//  [repeat print(each t)]
  let cool = (repeat each u)
//  print("COOL \(cool)")
  return (repeat (each t, cool))
}

// func counts<each T: Collection>(_ t: repeat each T) {
//  let x = (repeat (each t).count)
// }

struct ParameterPacksView: View {
  var result: Bool {
//    print("WOW: \(concat2(t: 1, "a", u: true, 3, 5))")
    return comp(lhs: (1, "a"), rhs: (2, "b"))
  }

  var body: some View {
    Text(result ? "true" : "false")
  }
}

#Preview {
  ParameterPacksView()
    .onAppear {
      print(double(1, "Heo"))
    }
}

struct Box<A> {
  let value: A
}

func combineBoxes<each A>(_ box: repeat Box<each A>) -> Box < (repeat each A)> {
  Box(value: (repeat (each box).value))
}

let cool = combineBoxes(Box(value: 1), Box(value: "hello"))

protocol Printable {
  associatedtype Value
  var description: Value { get }
}

func combineBoxes2<each A: Printable>(_ box: Box < (repeat each A)>) -> (repeat (each A).Value) {
  (repeat (each box.value).description)
}

let nice = combineBoxes2(Box(value: (1, "hello")))

extension String: Printable {
  var description: String { self }
}

extension Int: Printable {
  var description: Double { Double(self) }
}

// func combineBoxes<each A>(_ box: repeat Box<each A>) -> Box<(repeat each A)> {

// func combineBoxes2<each A>(_ box: Box<repeat each A>) -> (repeat each A) {
//  return (repeat (each box).value)
// }
