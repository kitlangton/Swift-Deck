//
//  SwiftUIView.swift
//
//
//  Created by Kit Langton on 9/29/23.
//

import SwiftUI

public protocol MyDeck: Deck, View {
  associatedtype Content: Deck
  var body: Content { get }
}

public extension MyDeck {
  var length: Int { body.length }
}
