//
//  TheComposableArchitectureApp.swift
//  TheComposableArchitecture
//
//  Created by healthwallet7 on 2022/11/14.
//

import SwiftUI
import ComposableArchitecture

@main
struct TheComposableArchitectureApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView(
        store: Store(
          initialState: Feature.State(),
          reducer: Feature()
        )
      )
    }
  }
}
