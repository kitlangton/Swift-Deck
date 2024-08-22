//
//  SwiftUIView.swift
//
//
//  Created by Kit Langton on 12/30/23.
//

import SwiftUI

public struct VSequence: Deck {
  public init(
    alignment: HorizontalAlignment = .leading,
    @DeckArrayBuilder decks: () -> [any Deck]
  ) {
    self.decks = decks()
    self.alignment = alignment
  }

  public var length: Int { decks.reduce(into: 0) { $0 += $1.length } }

  public var body: some View {
    let activeDecks = self.activeDecks
    VStack(alignment: alignment, spacing: 40) {
      ForEach(activeDecks, id: \.offset) { deck, _, start in
        AnyView(deck).environment(\.stepIndex, start)
          .transition(.blur.combined(with: .opacity).combined(with: .scale(scale: 0.8)))
//          .transition(.blur.combined(with: .opacity))

//        if offset < activeDecks.count - 1 {
//          Divider()
//        }
      }
    }
  }

  var alignment: HorizontalAlignment = .leading
  var decks: [any Deck]

  @Environment(\.stepIndex) var step

  var activeDecks: [(deck: any Deck, offset: Int, start: Int)] {
    var start = step
    var active: [(deck: any Deck, offset: Int, start: Int)] = []

    for (offset, deck) in decks.enumerated() {
      if start >= 0 {
        active.append((deck, offset, start))
        start -= deck.length
      } else {
        break
      }
    }

    return active
  }
}

public struct HSequence: Deck {
  public init(
    alignment: VerticalAlignment = .top,
    @DeckArrayBuilder decks: () -> [any Deck]
  ) {
    self.decks = decks()
    self.alignment = alignment
  }

  public var length: Int { decks.reduce(into: 0) { $0 += $1.length } }

  public var body: some View {
    let activeDecks = self.activeDecks
    HStack(alignment: alignment, spacing: 40) {
      ForEach(activeDecks, id: \.offset) { deck, _, start in
        AnyView(deck).environment(\.stepIndex, start)
          .transition(.blur.combined(with: .opacity).combined(with: .scale(scale: 0.8)))
      }
    }
  }

  var alignment: VerticalAlignment = .top
  var decks: [any Deck]

  @Environment(\.stepIndex) var step

  var activeDecks: [(deck: any Deck, offset: Int, start: Int)] {
    var start = step
    var active: [(deck: any Deck, offset: Int, start: Int)] = []

    for (offset, deck) in decks.enumerated() {
      if start >= 0 {
        active.append((deck, offset, start))
        start -= deck.length
      } else {
        break
      }
    }

    return active
  }
}

#Preview {
  DeckView {
    HSequence {
      Text("Hello")
      Text("World")
      Text("How")
      Text("Are")
    }
  }
  .padding(48)
  .background(.black)
  .environment(PresentationState(step: 0))
}
