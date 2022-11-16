//
//  ContentView.swift
//  TheComposableArchitecture
//
//  Created by healthwallet7 on 2022/11/14.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
  let store: StoreOf<Feature>
  
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      VStack {
        HStack {
          Button("−") { viewStore.send(.decrementButtonTapped) }
            .padding()
          Text("\(viewStore.count)")
            .padding()
          Button("+") { viewStore.send(.incrementButtonTapped) }
            .padding()
        }

        Button("Number fact") { viewStore.send(.numberFactButtonTapped) }
          .padding()
      }
      .alert(
        item: viewStore.binding(
          get: { $0.numberFactAlert.map(FactAlert.init(title:)) },
          send: .factAlertDismissed
        ),
        content: { Alert(title: Text($0.title)) }
      )
    }
  }
}

struct FactAlert: Identifiable {
  var title: String
  var id: String { self.title }
}
