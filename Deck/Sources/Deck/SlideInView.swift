//
//  SwiftUIView.swift
//  
//
//  Created by Kit Langton on 9/28/23.
//

import SwiftUI

extension View {
  func getFrame(_ rect: @escaping (CGRect) -> Void) -> some View {
    background {
      GeometryReader { proxy in
        let frame = proxy.frame(in: .global)
        Color.clear.onChange(of: frame, initial: true) {
          rect(frame)
        }
      }
    }
  }

  func getWidth(_ width: @escaping (CGFloat) -> Void) -> some View {
    background {
      GeometryReader { proxy in
        let width0 = proxy.frame(in: .global).width
        Color.clear.onChange(of: width0, initial: true) {
          width(width0)
        }
      }
    }
  }

  func getHeight(_ height: @escaping (CGFloat) -> Void) -> some View {
    background {
      GeometryReader { proxy in
        let height0 = proxy.frame(in: .global).height
        Color.clear.onChange(of: height0, initial: true) {
          height(height0)
        }
      }
    }
  }
}

struct SlideInView: ViewModifier {
  var isActive: Bool = true

  @State var height: CGFloat = 0

  func body(content: Content) -> some View {
    content
      .opacity(isActive ? 1 : 0)
      .offset(y: isActive ? 0 : height)
      .scaleEffect(
        x: isActive ? 1 : 0.7,
        y: isActive ? 1 : 1.3
      )
      .blur(radius: isActive ? 0 : 8)
      .drawingGroup()
      .getHeight { height = $0 }
  }
}

extension View {
  func slideIn(_ isActive: Bool = true) -> some View {
    modifier(SlideInView(isActive: isActive))
  }

  func slideIn(_ range: StepRange) -> some View {
    withStepIndex { view, step in
      view.slideIn(range(step))
    }
  }
}

// split into words, slide in each with delay
struct SlideInText: View {
  init(
    _ text: String = "",

    separator: String = " ",
    isActive: Bool = true
  ) {
    components = Array(text.split(separator: separator).enumerated())
    self.separator = separator
    self.isActive = isActive
  }

  let components: [(offset: Int, element: String.SubSequence)]
  let separator: String

  var isActive: Bool = true
  @State var height: CGFloat = 0
  @State var visibleIndex = 0

  var body: some View {
    HStack(spacing: 0) {
      ForEach(components, id: \.offset) { offset, word in
        Text(word + (offset < components.count - 1 ? separator : ""))
          .slideIn(offset < visibleIndex)
      }
    }
    .drawingGroup()
    .animation(.text, value: visibleIndex)
    .task(id: isActive) {
      try? await onChange()
    }
  }

  func onChange() async throws {
    let duration = CGFloat(300)
    let count = components.count
    let millis = duration / CGFloat(count)
    try await Task.sleep(for: .milliseconds(millis))

    if isActive && visibleIndex < count {
      visibleIndex += 1
      try await onChange()
    } else if !isActive && visibleIndex > 0 {
      visibleIndex -= 1
      try await onChange()
    }
  }
}

struct SildeInTextPreview: View {
  @State var count = 0

  var body: some View {
    VStack {
//      Text("Hello, World!").slideIn(count % 2 == 0)
      SlideInText("How are you doing", isActive: count % 2 == 0)
        .font(.slideTitle)
    }
    .onAppear {
      Task {
        while true {
          try! await Task.sleep(for: .seconds(1.2))
          withAnimation {
            count += 1
          }
        }
      }
    }
  }
}

#Preview {
  SildeInTextPreview()
}
