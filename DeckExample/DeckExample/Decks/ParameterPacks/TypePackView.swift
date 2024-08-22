//
//  TypePackView.swift
//  DeckExample
//
//  Created by Kit Langton on 10/5/23.
//

import Deck
import IdentifiedCollections
import SwiftUI

protocol RequestProtocol {
   associatedtype Input
   associatedtype Output
   func evaluate(_ input: Input) throws -> Output
}

struct Evaluator<each Request: RequestProtocol> {
   init(_ item: repeat each Request) {
      self.item = (repeat each item)
   }

   var item: (repeat each Request)

   func query(_ input: repeat (each Request).Input) -> (repeat (each Request).Output)? {
      do {
         return try (repeat (each item).evaluate(each input))
      } catch {
         return nil
      }
   }
}

struct FunctionRequest<Input, Output>: RequestProtocol {
   var function: (Input) throws -> Output

   func evaluate(_ input: Input) throws -> Output {
      try function(input)
   }
}

let intToString = FunctionRequest(function: { (input: Int) -> String in
   String(input)
})
let boolToString = FunctionRequest(function: { (input: Bool) -> String in
   String(input)
})
let boolToDouble = FunctionRequest(function: { (input: Bool) -> Double in
   input ? 1 : 0
})

let evaluator: Evaluator<FunctionRequest<Int, String>, FunctionRequest<Bool, String>, FunctionRequest<Bool, Double>> =
   Evaluator(
      intToString,
      boolToString,
      boolToDouble
   )

let results: (String, String, Double)? = evaluator.query(123, true, true)

struct TypePackView: Deck {
   var types: [[String]]

   @Environment(\.stepIndex) var step

   var length: Int { types.count }

   var stepTypes: [String] {
      types[safe: step] ?? types.last ?? []
   }

   var body: some View {
      HStack {
         Text("each T").bold()
         Text(" := ")
            .foregroundStyle(.secondary)
         Text("{")
         HStack {
            ForEach(Array(stepTypes.enumerated()), id: \.offset) { offset, tpe in
               Text(tpe)
                  .bold()
                  .padding(12)
                  .background(.thickMaterial)
                  .cornerRadius(6)
                  .transition(.scale.combined(with: .opacity).combined(with: .blur))
               if offset < stepTypes.count - 1 {
                  Text(",").foregroundStyle(.secondary)
                   .transition(.scale.combined(with: .opacity).combined(with: .blur))
               }
            }
         }
         Text("}")
      }
      .monospaced()
      .frame(maxWidth: .infinity, maxHeight: .infinity)
   }
}

#Preview {
   DeckView {
      TypePackView(
         types: [
            [],
            ["Int"],
            ["Int", "String"],
            ["Int", "String", "Boolean"],
         ]
      )
   }
   .environment(PresentationState(step: 0))
}

func jsonify<T: Encodable>(_ values: T...) -> [String] {
   let encoder = JSONEncoder()
   return values.map { value in
      String(data: try! encoder.encode(value), encoding: .utf8)!
   }
}

// let strings = jsonify("nice", 5)
