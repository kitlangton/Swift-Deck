//
//  PropertyWrapperDeck.swift
//  DeckExample
//
//  Created by Kit Langton on 12/30/23.
//

import Deck
import SwiftUI

struct PropertyWrapperDeck: MyDeck {
  var body: some Deck {
    Container {
      Separated(axis: .vertical) {
        Title("Property Wrappers")
          .deckPadding(48)
          .deckTransform { deck, index in
            deck.frame(
              maxWidth: .infinity,
              maxHeight: index == 0 ? .infinity : nil,
              alignment: index == 0 ? .center : .topLeading
            )
          }
          .deckTransform { deck, index in
            deck.background(
              .ultraThinMaterial
                .opacity(index == 0 ? 0.5 : 0)
            )
          }
        Separated(axis: .horizontal) {
          CodeSlide {
            """
            struct Example: View {}
            """
            """
            struct Example: View {
              var greeting: String =
                "I'm afraid there's no cure..."
            }
            """
            """
            struct Example: View {

              var greeting: String =
                "I'm afraid there's no cure..."

              var body: some View {
                Text(greeting)
              }

            }
            """.holdString(2)
            """
            struct Example: View {

              @Spongebob
              var greeting: String =
                "I'm afraid there's no cure..."

              var body: some View {
                Text(greeting)
              }

            }
            """
          }
          //        .deckTransform { $0.font(.largeTitle) }
          .deckPadding(48)
          .deckFrame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
//          .deckTransform { $0.background(.ultraThinMaterial.opacity(0.5)) }

          BodyText {
            Text("I'm afraid there's no cure...")
              .fontDesign(.serif)
              .hold(2)
            // SpOngEbOb cAsE
            Text("I'm AfRaId ThErE's No CuRe...")
          }
          .deckTransform { $0.font(.system(size: 64)).fontDesign(.serif)
          }
          .deckPadding(48)
          .deckFrame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
          .delay(3)
        }
        .delay(1)
      }
    }
  }
}

#Preview {
  DeckView {
    PropertyWrapperDeck()
  }
  .font(.largeTitle)
  .padding(48)
  .background(.black)
  .environment(PresentationState(step: 0))
  .scaleEffect(0.5, anchor: .topLeading)
}
