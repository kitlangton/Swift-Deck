//
//  SwiftUIView.swift
//
//
//  Created by Kit Langton on 9/28/23.
//

import HighlightSwift
import SwiftUI

struct CodeBlock: View {
  init(_ text: String) {
    self.text = text
  }

  var text: String = ""
  @State var attributed: Text?

  var body: some View {
    (attributed ?? Text(""))
      .contentTransition(.numericText(countsDown: true))
      .frame(maxWidth: .infinity, alignment: .leading)
      .monospaced()
      .task(id: text) {
        guard text != "" else {
          return
        }
        let result = try! await Highlight.text(text, language: "swift")

        withAnimation(attributed == nil ? .spring : .spring) {
          attributed = result.attributed.text
          //          attributed = Text(result)
        }
      }
  }
}

extension NSAttributedString {
  func withAlpha(_ alpha: CGFloat) -> NSAttributedString {
    let mutableAttributedString = NSMutableAttributedString(attributedString: self)

    enumerateAttribute(.foregroundColor, in: NSRange(location: 0, length: length), options: []) { value, range, _ in
      if let color = value as? NSColor {
        mutableAttributedString.addAttribute(
          .foregroundColor,
          value: color.withAlphaComponent(alpha),
          range: range
        )
      }
    }
    return NSAttributedString(attributedString: mutableAttributedString)
  }

  var text: Text {
    let string = self.string as NSString
    let components = string.components(separatedBy: "\n")
    var result = Text("")
    var highlight = false

    for component in components {
      if component.contains("highlight") {
        highlight = true
        continue
      }

      let range = string.range(of: component)
      var line = attributedSubstring(from: range)
      if !highlight {
        line = line.withAlpha(0.5)
      }
      let attributed = AttributedString(line)

      if result != Text("") {
        result = result + Text("\n")
      }
      result = result + Text(attributed)

      highlight = false
    }

    return result
  }
}

extension AttributedString {
  var text: Text {
    return NSAttributedString(self).text
  }
}

#Preview {
  DeckView {
    CodeSlide {
      """
      struct Example: View {
        // highlight
        @Spongebob
        var greeting: String =
          "I'm afraid there's no cure..."
        var body: some View {
          Text(greeting)
        }
      }
      """

      """
      struct Example: View {
        @Spongebob
        // highlight
        var greeting: String =
        // highlight
          "I'm afraid there's no cure..."
        var body: some View {
          Text(greeting)
        }
      }
      """
    }
  }
  .font(.largeTitle)
  .padding(48)
  .background(.black)
  .environment(PresentationState(step: 0))
}
