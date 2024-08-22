//
//  File.swift
//
//
//  Created by Kit Langton on 12/30/23.
//

import SwiftUI

struct Feature: Identifiable {
  var title: String
  var body: String

  var id: String {
    title + body
  }
}

struct FeaturesDeck: Deck {
  var features: [Feature]

  @Environment(\.stepIndex) var step

  var length: Int { features.count + 1 }

  var visibleFeatures: [Feature] {
    Array(features[..<step])
  }

  var body: some View {
    VStack(alignment: .leading, spacing: 24) {
      ForEach(visibleFeatures) { feature in
        VStack(alignment: .leading, spacing: 12) {
          Text(feature.title)
            .fontWeight(.bold)
          Text(feature.body)
            .foregroundStyle(.secondary)
        }
        .font(.title)
        .frame(width: 600, alignment: .leading)
        .padding(24)
        .background {
          RoundedRectangle(cornerRadius: 6)
            .stroke(.tertiary)
        }
        .transition(
          .opacity.combined(with: .blur)
            .combined(with: .offset(y: 80))
            .combined(with: .scale(scale: 1.4))
        )
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .animation(.bouncy, value: step)
  }
}

#Preview {
  DeckView {
    FeaturesDeck(
      features: [
        Feature(
          title: "Boilerplate Reduction",
          body: "This way we can reuse this encapsulated logic and keep our code more organized and clean."
        ),
        Feature(
          title: "Automatic State Management",
          body: "User Defaults are often used for storing simple app data, but accessing them can be cumbersome and repetitive."
        ),
        Feature(
          title: "Composability",
          body: "Decks can be composed into other decks"
        ),
        Feature(
          title: "Animations",
          body: "Animations are built-in"
        ),
        Feature(
          title: "Layout",
          body: "Layout is built-in"
        ),
      ]
    )
  }
  .environment(PresentationState(step: 1))
}
