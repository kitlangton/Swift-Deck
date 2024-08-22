//
//  SwiftUIView.swift
//  
//
//  Created by Kit Langton on 9/28/23.
//

import SwiftUI

public struct EmptyDeck: Deck {
  public init() {
  }
  
  public var length: Int { 1 }

  public var body: some View {
    EmptyView()
  }
}
