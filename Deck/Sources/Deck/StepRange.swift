//
//  StepRange.swift
//
//
//  Created by Kit Langton on 9/28/23.
//

import SwiftUI

struct StepRange {
  var contains: (Int) -> Bool

  static func from(_ start: Int, to end: Int) -> StepRange {
    StepRange { $0 >= start && $0 <= end }
  }

  static func from(_ start: Int) -> StepRange {
    StepRange { $0 >= start }
  }

  static func to(_ end: Int) -> StepRange {
    StepRange { $0 <= end }
  }

  func callAsFunction(_ value: Int) -> Bool {
    contains(value)
  }
}

struct WithStepIndex<V: View>: ViewModifier {
  @Environment(\.stepIndex) var stepIndex

  var modify: (AnyView, Int) -> V

  func body(content: Content) -> some View {
    modify(AnyView(content), stepIndex)
  }
}

extension View {
  func withStepIndex<V: View>(modify: @escaping (AnyView, Int) -> V) -> some View {
    modifier(WithStepIndex(modify: modify))
  }
}

