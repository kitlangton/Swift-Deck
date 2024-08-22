import Foundation
import SwiftUI

struct StepValue<A> {
  init(values: [HoldValue<A>], offset: Int, defaultValue: A) {
    var dictionary: [Int: A] = [:]
    var start = 0
    for value in values {
      for i in 0 ..< value.length {
        dictionary[start + i] = value.value
      }
      start += value.length
    }

    self.dictionary = dictionary
    self.offset = offset
    self.defaultValue = defaultValue
  }

  var lastElement: A? {
    dictionary[dictionary.keys.max() ?? 0]
  }

  var length: Int { dictionary.count }

  subscript(index: Int) -> A {
    dictionary[index - offset] ?? lastElement ?? defaultValue
  }

  private var dictionary: [Int: A] = [:]
  private var offset: Int = 0
  private var defaultValue: A
}

extension StepValue where A == Text {
  static func build(
    offset: Int = 0,
    @StepTextBuilder strings: () -> [HoldValue<Text>]
  )
    -> StepValue
  {
    let lengthStrings = strings()
    return StepValue(values: lengthStrings, offset: offset, defaultValue: Text(""))
  }
}

extension StepValue where A == String {
  static func build(
    offset: Int = 0,
    @StepStringBuilder strings: () -> [HoldValue<String>]
  )
    -> StepValue
  {
    let lengthStrings = strings()
    return StepValue(
      values: lengthStrings,
      offset: offset,
      defaultValue: ""
    )
  }
}

public struct HoldValue<A> {
  var length: Int
  var value: A
}

@resultBuilder
public enum StepTextBuilder {
  public static func buildBlock(_ components: HoldValue<Text>...) -> [HoldValue<Text>] {
    components
  }

  public static func buildExpression(_ string: String) -> HoldValue<Text> {
    HoldValue(length: 1, value: Text(try! AttributedString(markdown: string)))
  }

  public static func buildExpression(_ string: HoldValue<Text>) -> HoldValue<Text> {
    string
  }

  public static func buildExpression(_ text: Text) -> HoldValue<Text> {
    HoldValue(length: 1, value: text)
  }
}

@resultBuilder
public enum StepStringBuilder {
  public static func buildBlock(_ components: HoldValue<String>...) -> [HoldValue<String>] {
    components
  }

  public static func buildExpression(_ string: String) -> HoldValue<String> {
    HoldValue(length: 1, value: string)
  }

  public static func buildExpression(_ string: HoldValue<String>) -> HoldValue<String> {
    string
  }
}

public extension String {
  func hold(_ steps: Int) -> HoldValue<Text> {
    HoldValue(length: steps, value: Text(try! AttributedString(markdown: self)))
  }

  func holdString(_ steps: Int) -> HoldValue<String> {
    HoldValue(length: steps, value: self)
  }
}

public extension Text {
  func hold(_ steps: Int) -> HoldValue<Text> {
    HoldValue(length: steps, value: self)
  }
}

let cool = StepValue.build(offset: 2) {
  "Hello"
  "World".hold(2)
  "!"
}
