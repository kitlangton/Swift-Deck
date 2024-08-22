//
//  File.swift
//  
//
//  Created by Kit Langton on 9/28/23.
//

import SwiftUI

struct BlurModifier: ViewModifier {
  var radius: CGFloat

  func body(content: Content) -> some View {
    content
      .blur(radius: radius)
  }
}

extension AnyTransition {
  public static var blur: AnyTransition {
    .modifier(
      active: BlurModifier(radius: 10),
      identity: BlurModifier(radius: 0)
    )
  }
  
  public static func blur(radius: CGFloat) -> AnyTransition {
    .modifier(
      active: BlurModifier(radius: radius),
      identity: BlurModifier(radius: 0)
    )
  }
}
