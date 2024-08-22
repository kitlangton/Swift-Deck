//
//  File.swift
//
//
//  Created by Kit Langton on 9/28/23.
//

import SwiftUI

@resultBuilder
public enum DeckArrayBuilder {
  public static func buildBlock(_ components: [any Deck]...) -> [any Deck] {
    components.flatMap { $0 }
  }

  public static func buildExpression(_ string: String) -> [any Deck] {
    [BodyText {
      string
    }]
  }

  public static func buildExpression(_ text: Text) -> [any Deck] {
    [BodyText {
      text
    }]
  }

  public static func buildExpression<D: Deck>(_ deck: D) -> [any Deck] {
    [deck]
  }
  
  public static func buildOptional(_ component: [any Deck]?) -> [any Deck] {
    component ?? []
  }
}

@resultBuilder
public enum DeckBuilder {
  public static func buildBlock<D: Deck>(_ deck: D) -> D {
    deck
  }

  public static func buildBlock(_ components: any Deck...) -> Sequence {
    Sequence(decks: components)
  }
}
