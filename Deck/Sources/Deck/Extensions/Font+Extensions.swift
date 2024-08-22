//
//  File.swift
//
//
//  Created by Kit Langton on 9/28/23.
//

import SwiftUI

extension Font {
  /// Big, expanded font for title
  static var slideTitle: Font {
    Font.system(size: 72).weight(.bold).width(.expanded)
  }

  static var slideBody: Font {
    Font.system(size: 48) // .width(.expanded)
  }
}

extension Animation {
//  static var text = Animation.spring(response: 0.6, dampingFraction: 0.9)
  static var text = Animation.bouncy
//  static var text = Animation.smooth
}
