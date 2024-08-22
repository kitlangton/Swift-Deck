import SwiftUI

struct RectPreferenceKey: PreferenceKey {
  typealias Value = [Anchor<CGRect>]

  static var defaultValue: [Anchor<CGRect>] = []

  static func reduce(value: inout [Anchor<CGRect>], nextValue: () -> [Anchor<CGRect>]) {
    value.append(contentsOf: nextValue())
  }
}

struct HighlightDeck: ViewModifier {
  @State var draggedRect: CGRect?

  var dragGesture: some Gesture {
    DragGesture()
      .onChanged { value in
        let rect = CGRect.from(value)
        withAnimation(.spring) {
          draggedRect = rect
        }
      }
      .onEnded { _ in
        draggedRect = nil
      }
  }

  func body(content: Content) -> some View {
    content
      .highPriorityGesture(dragGesture)
      .overlay(alignment: .topLeading) {
        if let draggedRect {
          ZStack {
            RoundedRectangle(cornerRadius: 12)
              .fill(.blue.opacity(0.1))

            RoundedRectangle(cornerRadius: 12)
              .stroke(Color.blue.opacity(0.9), lineWidth: 2)
          }
          .transition(.scale(scale: 0.8).combined(with: .blur).combined(with: .opacity))
          .frame(width: draggedRect.width, height: draggedRect.height)
          .offset(x: draggedRect.origin.x, y: draggedRect.origin.y)
        }
      }
      .ignoresSafeArea()
  }
}

extension CGRect {
  /// from drag value
  /// ensure you take into consideration negative transation
  static func from(_ drag: DragGesture.Value) -> CGRect {
    var startLocation = drag.startLocation
    if drag.translation.width < 0 {
      startLocation.x += drag.translation.width
    }
    if drag.translation.height < 0 {
      startLocation.y += drag.translation.height
    }
    return CGRect(
      origin: startLocation,
      size: CGSize(width: drag.translation.width, height: drag.translation.height)
    )
  }
}

#Preview {
  Button {} label: {
    Color.green
  }.buttonStyle(.plain)
    .modifier(
      HighlightDeck()
    )
}
