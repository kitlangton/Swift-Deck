import Deck
import SwiftUI

@main
struct DeckExampleApp: App {
  @State var state = PresentationState()

  let animation = Animation.spring

  var body: some Scene {
    WindowGroup {
      DeckView {
        ExampleDeckSeparated()
//        PropertyWrapperDeck()
//        ParameterPacksDeck()
//        ResultBuilderDeck.deck
      }
      .font(.largeTitle)
      .drawingGroup()
    }
    .environment(state)
    .commands {
      CommandMenu("Presentation") {
        Button { increment() } label: { Text("Forward") }
          .keyboardShortcut(.downArrow, modifiers: [])

        Button { increment(5) } label: { Text("Jump Forward") }
          .keyboardShortcut(.downArrow, modifiers: .shift)

        Button { decrement() } label: { Text("Back") }
          .keyboardShortcut(.upArrow, modifiers: [])

        Button { decrement(5) } label: { Text("Jump Back") }
          .keyboardShortcut(.upArrow, modifiers: .shift)
      }
    }
  }

  func increment(_ amount: Int = 1) {
    withAnimation(animation) {
      state.step = state.step + amount
    }
  }

  func decrement(_ amount: Int = 1) {
    withAnimation(animation) {
      state.step = max(0, state.step - amount)
    }
  }
}
