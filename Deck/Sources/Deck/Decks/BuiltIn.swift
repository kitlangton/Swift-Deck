//
//  File.swift
//
//
//  Created by Kit Langton on 9/28/23.
//

import SwiftUI

public struct BodyText: Deck {
  public init(@StepTextBuilder text: () -> [HoldValue<Text>]) {
    self.text = StepValue.build(strings: text)
  }

  public var length: Int { text.length }
  public var body: some View {
    (appear ? text[step] : Text(""))
      .contentTransition(.numericText(countsDown: true))
      .onAppear {
        withAnimation {
          appear = true
        }
      }
  }

  var text: StepValue<Text>

  @Environment(\.stepIndex) var step

  @State var appear = false
}

public struct HDeck: Deck {
  public init(
    alignment: VerticalAlignment = .top,
    @DeckArrayBuilder decks: () -> [any Deck]
  ) {
    self.decks = decks()
    self.alignment = alignment
  }

  public var length: Int { decks.reduce(into: 0) { $0 = max($0, $1.length) } }

  public var body: some View {
    HStack(alignment: alignment, spacing: 24) {
      ForEach(Array(decks.enumerated()), id: \.offset) { _, deck in
        AnyView(deck).environment(\.stepIndex, step)
      }
    }
  }

  let alignment: VerticalAlignment

  var decks: [any Deck]

  @Environment(\.stepIndex) var step
}

public struct VDeck: Deck {
  public init(
    alignment: HorizontalAlignment = .leading,
    spacing: CGFloat = 40,
    @DeckArrayBuilder decks: () -> [any Deck]
  ) {
    self.decks = decks()
    self.alignment = alignment
    self.spacing = spacing
  }

  public var length: Int { decks.reduce(into: 0) { $0 = max($0, $1.length) } }

  public var body: some View {
    VStack(alignment: alignment, spacing: spacing) {
      ForEach(Array(decks.enumerated()), id: \.offset) { _, deck in
        AnyView(deck)
      }
    }
  }

  var alignment: HorizontalAlignment = .leading
  var decks: [any Deck]
  var spacing: CGFloat = 40

  @Environment(\.stepIndex) var step
}

public struct DeckViewWrapper<V: View>: Deck {
  public init(length: Int, @ViewBuilder view: () -> V) {
    self.length = length
    self.view = view()
  }

  public var length: Int

  public var body: V {
    view
  }

  var view: V
}

public struct Title: Deck {
  public init(
    _ title: String,
    separator: String = " ",
    centered: Bool = false
  ) {
    self.title = title
    self.separator = separator
    self.centered = centered
  }

  public var length: Int { 1 }

  public var body: some View {
    SlideInText(title, separator: separator)
      .font(
        .system(size: step == 0 ? 72 : 48).width(.expanded)
      )
      .bold(step == 0)
//      .font(.slideTitle)
//      .foregroundStyle(.white.opacity(0.9).gradient)
      .frame(
        maxWidth: centered ? .infinity : nil,
        maxHeight: centered ? .infinity : nil,
        alignment: centered ? .center : .topLeading
      )
  }

  var title: String
  var separator: String = " "
  var centered: Bool = false

  @Environment(\.stepIndex) private var step
}

public struct CodeSlide: Deck {
  public init(@StepStringBuilder code: () -> [HoldValue<String>]) {
    self.code = StepValue.build(strings: code)
  }

  public var length: Int { code.length }
  public var body: some View {
    CodeBlock(appeared ? "\(code[step])" : "")
//      .scaleEffect(appeared ? 1 : 0.7)
      .offset(y: appeared ? 0 : 200)
      .blur(radius: appeared ? 0 : 15)
//      .drawingGroup()
      .onAppear {
        withAnimation(.bouncy) {
          appeared = true
        }
      }
  }

  var code: StepValue<String>

  @Environment(\.stepIndex) var step

  @State var appeared = false
}

public struct ViewDeck<V: View>: Deck {
  public init(@ViewBuilder content: () -> V) {
    self.content = content()
  }

  public var length: Int { 1 }

  public var body: some View {
    content
  }

  var content: V
}

public protocol EnumDeck<Content>: Deck {
  associatedtype Content: Deck
  associatedtype Enum: CaseIterable

  var state: Enum { get }
  var body: Content { get }
}

public extension EnumDeck {
  var length: Int { Enum.allCases.count }
}

// struct TestDeck: EnumDeck {
//  enum TestState: CaseIterable {
//    case one
//    case two
//    case three
//  }
//
//  @Environment(\.stepIndex) var step
//
//  var state: TestState { TestState.allCases[safe: step] ?? .three }
//
//  var body: some Deck {
//    BodyText { "Hello \(state)" }
//  }
// }

public extension Array {
  subscript(safe index: Index) -> Element? {
    index >= 0 && index < count ? self[index] : nil
  }
}

public struct DeckViewModifier<D: Deck, M: View>: Deck {
  public var length: Int { content.length }
  public var body: some View {
    modifier(content)
  }

  let content: D
  let modifier: (D) -> M
}

public extension Deck {
  func modifyDeck<M: View>(_ modifier: @escaping (Self) -> M) -> DeckViewModifier<Self, M> {
    DeckViewModifier(content: self, modifier: modifier)
  }
}
