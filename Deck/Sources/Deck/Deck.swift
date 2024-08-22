import SwiftUI

public protocol Deck: View {
  var length: Int { get }
}

public struct Sequence: Deck {
  public init(decks: [any Deck]) {
    self.decks = decks
  }

  public init(@DeckArrayBuilder decks: () -> [any Deck]) {
    self.decks = decks()
  }

  public var length: Int { decks.reduce(into: 0) { $0 += $1.length } }

  public var body: some View {
    if let (deck, offset, start) = activeDeck {
      AnyView(deck).id(offset).environment(\.stepIndex, start)
        .transition(transition)
    } else {
      EmptyView()
    }
  }

  var decks: [any Deck]
  @Environment(\.stepIndex) var step

  let transition: AnyTransition = .scale(scale: 0.8)
    .combined(with: .blur(radius: 15))
    .combined(with: .opacity)
    .animation(.smooth(duration: 0.3))

  var activeDeck: (any Deck, Int, Int)? {
    var start = step
    for (offset, deck) in decks.enumerated() {
      if start < deck.length {
        return (deck, offset, start)
      } else {
        start -= deck.length
      }
    }
    return nil
  }

  var activeDecks: [(any Deck, Int, Int)] {
    if let activeDeck = activeDeck {
      return [activeDeck]
    } else {
      return []
    }
  }
}

public struct DelayDeck<D: Deck>: Deck {
  public init(delay: Int, deck: D) {
    self.delay = delay
    self.deck = deck
  }

  public var length: Int { deck.length + delay }

  public var body: some View {
    if step < delay {
      EmptyView()
    } else {
      deck.environment(\.stepIndex, step - delay)
        .transition(.scale.combined(with: .opacity).combined(with: .blur))
    }
  }

  let delay: Int
  let deck: D

  @Environment(\.stepIndex) var step
}

public struct CutDeck<D: Deck>: Deck {
  public init(amount: Int, deck: D) {
    self.amount = amount
    self.deck = deck
  }

  public var length: Int { deck.length - amount }

  public var body: some View {
    deck.environment(\.stepIndex, step)
  }

  let amount: Int
  let deck: D
  @Environment(\.stepIndex) var step
}

public struct DeckPadding<D: Deck>: Deck {
  public init(_ insets: EdgeInsets, deck: D) {
    self.insets = insets
    self.deck = deck
  }

  public var length: Int { deck.length }

  public var body: some View {
    deck.padding(insets)
  }

  let insets: EdgeInsets
  let deck: D
}

struct DeckModifier<VM: ViewModifier, D: Deck>: Deck {
  public init(modifier: VM, deck: D) {
    self.modifier = modifier
    self.deck = deck
  }

  public var length: Int { deck.length }

  public var body: some View {
    deck.modifier(modifier)
  }

  let modifier: VM
  let deck: D
}

struct DeckViewTransform<D: Deck, V: View>: Deck {
  public init(transform: @escaping (D) -> V, deck: D) {
    self.transform = transform
    self.deck = deck
  }

  public var length: Int { deck.length }

  public var body: some View {
    transform(deck)
  }

  let transform: (D) -> V
  let deck: D
}

struct DeckViewTransformIndex<D: Deck, V: View>: Deck {
  public init(transform: @escaping (D, Int) -> V, deck: D) {
    self.transform = transform
    self.deck = deck
  }

  public var length: Int { deck.length }
  public var body: some View {
    transform(deck, step)
  }

  @Environment(\.stepIndex) var step

  let transform: (D, Int) -> V
  let deck: D
}

public extension Deck {
  func delay(_ delay: Int) -> some Deck {
    DelayDeck(delay: delay, deck: self)
  }

  func cut(_ amount: Int) -> some Deck {
    CutDeck(amount: amount, deck: self)
  }

  func deckPadding(_ amount: CGFloat) -> some Deck {
    DeckPadding(EdgeInsets(top: amount, leading: amount, bottom: amount, trailing: amount), deck: self)
  }

  func deckModifier<VM: ViewModifier>(_ modifier: VM) -> some Deck {
    DeckModifier(modifier: modifier, deck: self)
  }

  func deckTransform<V: View>(_ transform: @escaping (Self) -> V) -> some Deck {
    DeckViewTransform(transform: transform, deck: self)
  }
  
  func deckTransform<V: View>(_ transform: @escaping (Self, Int) -> V) -> some Deck {
    DeckViewTransformIndex(transform: transform, deck: self)
  }

  func deckFrame(maxWidth: CGFloat? = nil, maxHeight: CGFloat? = nil, alignment: Alignment = .center) -> some Deck {
    DeckFrame(maxWidth: maxWidth, maxHeight: maxHeight, alignment: alignment, deck: self)
  }

  func centered() -> some Deck {
    DeckFrame(
      maxWidth: .infinity,
      maxHeight: .infinity,
      alignment: .center,
      deck: self
    )
  }

  func centerHorizontally() -> some Deck {
    DeckFrame(
      maxWidth: .infinity,
      maxHeight: nil,
      alignment: .center,
      deck: self
    )
  }
}

struct DeckFrame<D: Deck>: Deck {
  var maxWidth: CGFloat?
  var maxHeight: CGFloat?
  var alignment: Alignment = .center

  let deck: D

  var length: Int { deck.length }

  var body: some View {
    deck
      .frame(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        alignment: alignment
      )
  }
}

public struct QuoteText: Deck {
  public init(@StepTextBuilder text: () -> [HoldValue<Text>]) {
    self.text = StepValue.build(strings: text)
  }

  public var length: Int { text.length }
  public var body: some View {
    (appear ? text[step] : Text(""))
      .contentTransition(.numericText(countsDown: true))
      .font(.slideBody)
      .padding(.leading, 40)
      .padding(.vertical)
      .overlay(alignment: .leading) {
        RoundedRectangle(cornerRadius: 12)
          .fill(.tertiary)
          .frame(width: 8)
      }
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
