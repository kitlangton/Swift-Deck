import SwiftUI
import Observation


@Observable
public final class PresentationState {
  public init(step: Int = 0) {
    self.step = step
  }
  
  public var step: Int = 0
}

public struct DeckView<Content: Deck>: View {
  public init(@DeckBuilder content: () -> Content) {
    self.content = content()
  }

  var content: Content

  @Environment(PresentationState.self) var state
  @Namespace var namespace

  let animation = Animation.spring

  public var body: some View {
    content
      .environment(\.stepIndex, state.step)
//      .environment(\.namespace, namespace)
      .frame(width: 1920, height: 1200, alignment: .topLeading)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(.black)
      .onTapGesture {
        increment()
      }
      .background {
        Button { increment() } label: { EmptyView() }
          .keyboardShortcut(.downArrow, modifiers: [])
          .hidden()

        Button { increment(5) } label: { EmptyView() }
          .keyboardShortcut(.downArrow, modifiers: .shift)
          .hidden()

        Button { decrement() } label: { EmptyView() }
          .keyboardShortcut(.upArrow, modifiers: [])
          .hidden()

        Button { decrement(5) } label: { EmptyView() }
          .keyboardShortcut(.upArrow, modifiers: .shift)
          .hidden()
      }
      .modifier(HighlightDeck())
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
