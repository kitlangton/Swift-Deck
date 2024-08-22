//
//  File.swift
//
//
//  Created by Kit Langton on 9/28/23.
//

import Foundation
import SwiftUI

public struct StepIndexEnvironmentKey: EnvironmentKey {
  public static var defaultValue: Int = 0
}

public extension EnvironmentValues {
  var stepIndex: Int {
    get { self[StepIndexEnvironmentKey.self] }
    set { self[StepIndexEnvironmentKey.self] = newValue }
  }
}
