//
//  SwiftUIView.swift
//
//
//  Created by Kit Langton on 9/28/23.
//

import SwiftUI

let colors = [
  Color.red,
  Color.orange,
  Color.yellow,
  Color.green,
  Color.blue,
  Color.purple,
]

struct RainbowText: ViewModifier {
  
  var isActive: Bool = true
  
  @State var colorIndex = 0
  
  var color: Color {
    isActive ? colors[colorIndex % colors.count] : .primary
  }
  
  func body(content: Content) -> some View {
    content
      .foregroundStyle(color)
      .task(id: isActive) {
        while !Task.isCancelled {
          try? await Task.sleep(for: .milliseconds(300))
          withAnimation(.spring(duration: 0.5)) {
            colorIndex += 1
          }
        }
      }
  }
}

extension View {
  func rainbowText(isActive: Bool = true) -> some View {
    modifier(RainbowText(isActive: isActive))
  }
}

#Preview {
  Text("HELLO THERE")
    .rainbowText()
}


struct RainbowDeck<Content: Deck>: Deck {
  var content: Content
  var activeAfter: Int

  @Environment(\.stepIndex) var step

  var length: Int { content.length + activeAfter }
  var body: some View {
    content.rainbowText(isActive: step >= activeAfter)
  }
}

public extension Deck {
  func rainbowDeck(_ after: Int = 0) -> some Deck {
    RainbowDeck(content: self, activeAfter: after)
  }
}
