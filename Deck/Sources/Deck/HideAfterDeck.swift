//
//  HideAfcterDeck.swift
//
//
//  Created by Kit Langton on 9/28/23.
//

import SwiftUI

public struct HideAfterDeck<Content: Deck>: Deck {
  public init(extraDuration: Int, content: Content) {
    self.extraDuration = extraDuration
    self.content = content
  }

  public var length: Int { content.length + extraDuration }

  @ViewBuilder
  public var body: some View {
    if step < length + extraDuration {
      content
        .transition(.opacity.combined(with: .blur).combined(with: .scale(scale: 0.8)))
    }
  }

  var extraDuration: Int
  var content: Content

  @Environment(\.stepIndex) var step
}

public extension Deck {
  func hideAfter(_ extraDuration: Int = 0) -> some Deck {
    HideAfterDeck(extraDuration: extraDuration, content: self)
  }
}
