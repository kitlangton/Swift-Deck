import Deck
import SwiftUI

// Mention Variadic Parameters

protocol ToJson {
   func jsonify() -> String
}

extension Int: ToJson {
   func jsonify() -> String {
      "\(self)"
   }
}

extension String: ToJson {
   func jsonify() -> String {
      "\"\(self)\""
   }
}

func jsonify<A: ToJson>(value: A) {
   print(value.jsonify())
}

// let jsonString = jsonify(value: "Hello")

// func sum<A>(_ ints: A...) -> [A] {
//  ints[0]
// }
//
// func sum(_ ints: [Int) -> Int {
//  ints[0]
// }
//
// let x = sum(1, 2, 3)

struct ParameterPacksDeck: MyDeck {
   //  func add(x: Int, y: Int) -> Int {
//    x + y
   //  }

   var body: some Deck {
      Sequence {
         intro
         motivation
         intuition
         Title("Let Us Xcode!", centered: true)
      }
   }

   var intro: some Deck {
      VSequence {
         Title("Parameter Packs")
         HDeck {
            Text("a.k.a.").italic().foregroundStyle(.secondary)
            BodyText {
               "The Bane of Boilerplate"
               "The Duke of Deduplication"
               "The Queen of Concision"
            }
            .modifyDeck {
               $0.fontWeight(.bold).fontWidth(.expanded)
            }
         }
      }
   }

   var motivation: some Deck {
      VSequence {
         Title("A Motivating Example")
         "Eliminate common boilerplate that crops up when defining generic functions"
         CodeSlide {
            """
            func tuplify<A, B>(_ a: A, _ b: B) -> (A, B) {
              (a, b)
            }
            """
            """
            func tuplify<A, B>(_ a: A, _ b: B) -> (A, B) {
              (a, b)
            }

            func tuplify<A, B, C>(_ a: A, _ b: B, _ c: C) -> (A, B, C) {
              (a, b, c)
            }
            """
            """
            func tuplify<A, B>(_ a: A, _ b: B) -> (A, B) {
              (a, b)
            }

            func tuplify<A, B, C>(_ a: A, _ b: B, _ c: C) -> (A, B, C) {
              (a, b, c)
            }

            func tuplify<A, B, C, D>(_ a: A, _ b: B, _ c: C, _ d: D) -> (A, B, C, D) {
              (a, b, c, d)
            }
            """
            """
            func tuplify<A, B>(_ a: A, _ b: B) -> (A, B) {
              (a, b)
            }

            func tuplify<A, B, C>(_ a: A, _ b: B, _ c: C) -> (A, B, C) {
              (a, b, c)
            }

            func tuplify<A, B, C, D>(_ a: A, _ b: B, _ c: C, _ d: D) -> (A, B, C, D) {
              (a, b, c, d)
            }

            let t2: (Int, String) = tuplify(1, "A")
            """
            """
            func tuplify<A, B>(_ a: A, _ b: B) -> (A, B) {
              (a, b)
            }

            func tuplify<A, B, C>(_ a: A, _ b: B, _ c: C) -> (A, B, C) {
              (a, b, c)
            }

            func tuplify<A, B, C, D>(_ a: A, _ b: B, _ c: C, _ d: D) -> (A, B, C, D) {
              (a, b, c, d)
            }

            let t2: (Int, String) = tuplify(1, "A")
            let t3: (Int, String, Bool) = tuplify(1, "A", true)
            """
            """
            func tuplify<A, B>(_ a: A, _ b: B) -> (A, B) {
              (a, b)
            }

            func tuplify<A, B, C>(_ a: A, _ b: B, _ c: C) -> (A, B, C) {
              (a, b, c)
            }

            func tuplify<A, B, C, D>(_ a: A, _ b: B, _ c: C, _ d: D) -> (A, B, C, D) {
              (a, b, c, d)
            }

            let t2: (Int, String) = tuplify(1, "A")
            let t3: (Int, String, Bool) = tuplify(1, "A", true)
            let t4: (Int, String, Bool, Double) = tuplify(1, "A", true, 1.0)
            """
            """
            func tuplify<A, B>(_ a: A, _ b: B) -> (A, B) {
              (a, b)
            }

            func tuplify<A, B, C>(_ a: A, _ b: B, _ c: C) -> (A, B, C) {
              (a, b, c)
            }

            func tuplify<A, B, C, D>(_ a: A, _ b: B, _ c: C, _ d: D) -> (A, B, C, D) {
              (a, b, c, d)
            }

            let t2: (Int, String) = tuplify(1, "A")
            let t3: (Int, String, Bool) = tuplify(1, "A", true)
            let t4: (Int, String, Bool, Double) = tuplify(1, "A", true, 1.0)
            let t5: (Int, String, Bool, Double, Float) = tuplify(1, "A", true, 1.0, 2.0)
            """
            """
            func tuplify<A, B>(_ a: A, _ b: B) -> (A, B) {
              (a, b)
            }

            func tuplify<A, B, C>(_ a: A, _ b: B, _ c: C) -> (A, B, C) {
              (a, b, c)
            }

            func tuplify<A, B, C, D>(_ a: A, _ b: B, _ c: C, _ d: D) -> (A, B, C, D) {
              (a, b, c, d)
            }

            let t2: (Int, String) = tuplify(1, "A")
            let t3: (Int, String, Bool) = tuplify(1, "A", true)
            let t4: (Int, String, Bool, Double) = tuplify(1, "A", true, 1.0)

            // 😱 Extra arguments in call
            let t5: (Int, String, Bool, Double, Float) = tuplify(1, "A", true, 1.0, 2.0)
            """
            """
            func tuplify<A, B>(_ a: A, _ b: B) -> (A, B) {
              (a, b)
            }
            func tuplify<A, B, C>(_ a: A, _ b: B, _ c: C) -> (A, B, C) {
              (a, b, c)
            }
            func tuplify<A, B, C, D>(_ a: A, _ b: B, _ c: C, _ d: D) -> (A, B, C, D) {
              (a, b, c, d)
            }
            func tuplify<A, B, C, D, E>(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E) -> (A, B, C, D, E) {
              (a, b, c, d, e)
            }
            func tuplify<A, B, C, D, E, F>(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F) -> (A, B, C, D, E, F) {
              (a, b, c, d, e, f)
            }
            // 🫲😭🫱
            """
            """
            func tuplify<A, B>(_ a: A, _ b: B) -> (A, B) {
              (a, b)
            }
            func tuplify<A, B, C>(_ a: A, _ b: B, _ c: C) -> (A, B, C) {
              (a, b, c)
            }
            func tuplify<A, B, C, D>(_ a: A, _ b: B, _ c: C, _ d: D) -> (A, B, C, D) {
              (a, b, c, d)
            }
            func tuplify<A, B, C, D, E>(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E) -> (A, B, C, D, E) {
              (a, b, c, d, e)
            }
            func tuplify<A, B, C, D, E, F>(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F) -> (A, B, C, D, E, F) {
              (a, b, c, d, e, f)
            }
            // 🫲😭🫱

            // INSTEAD:

            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
              (repeat each value)
            }
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
              (repeat each value)
            }
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
              (repeat each value)
            }

            let t2: (Int, String) = tuplify(1, "A")
            let t3: (Int, String, Bool) = tuplify(1, "A", true)
            let t4: (Int, String, Bool, Double) = tuplify(1, "A", true, 1.0)
            let t5: (Int, String, Bool, Double, Float) = tuplify(1, "A", true, 1.0, 2.0)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
              (repeat each value)
            }

            let t2: (Int, String) = tuplify(1, "A") // 😭👍
            let t3: (Int, String, Bool) = tuplify(1, "A", true) // 😭👍
            let t4: (Int, String, Bool, Double) = tuplify(1, "A", true, 1.0) // 😭👍
            let t5: (Int, String, Bool, Double, Float) = tuplify(1, "A", true, 1.0, 2.0) // 😭👍
            """
         }
      }
   }

   var intuition: some Deck {
      VSequence {
         Title("Intutition by Example").hideAfter(2)
         CodeSlide {
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
              (repeat each value)
            }
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //         ======

              (repeat each value)
            }
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //         ======
            //         Type Parameter Pack

              (repeat each value)
            }
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //         ======
            //         Type Parameter Pack

              (repeat each value)
            }

            tuplify(1)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //         ======
            //         Type Parameter Pack

              (repeat each value)
            }

            // each T := { Int }
            tuplify(1)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //         ======
            //         Type Parameter Pack

              (repeat each value)
            }

            // each T := { Int, String }
            tuplify(1, "A")
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //         ======
            //         Type Parameter Pack

              (repeat each value)
            }

            // each T := { Int, String, Bool }
            tuplify(1, "A", true)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //         ======

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int, String, Bool }
            tuplify(1, "A", true)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                          =============

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int, String, Bool }
            tuplify(1, "A", true)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                          =============
            //                          Pack Expansion

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int, String, Bool }
            tuplify(1, "A", true)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                          ======
            //                          "repeat" Keyword
            //
            //                          =============
            //                          Pack Expansion

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int, String, Bool }
            tuplify(1, "A", true)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                                 ======
            //                                 Repetition Pattern
            //
            //                          ======
            //                          "repeat" Keyword
            //
            //                          =============
            //                          Pack Expansion

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int, String, Bool }
            tuplify(1, "A", true)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                                 ======
            //                                 Repetition Pattern
            //                                 must "capture" at least one parameter pack
            //
            //                          ======
            //                          "repeat" Keyword
            //
            //                          =============
            //                          Pack Expansion

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int, String, Bool }
            tuplify(1, "A", true)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                                 ======
            //                                 Repetition Pattern
            //
            //                          =============
            //                          Pack Expansion

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int, String, Bool }
            tuplify(1, "A", true)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                                 ======
            //                                 Repetition Pattern
            //
            //                          =============
            //                          Pack Expansion

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int }
            tuplify(1)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                                 ======
            //                                 Repetition Pattern
            //
            //                          =============
            //                          Pack Expansion

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            tuplify(1)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                                 ======
            //                                 Repetition Pattern
            //
            //                          =============
            //                          Pack Expansion

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int })
            tuplify(1)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                                 ======
            //                                 Repetition Pattern
            //
            //                          =============
            //                          Pack Expansion

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int })
            // value = { 1 } <- Value Parameter Pack
            tuplify(1)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                                 ======
            //                                 Repetition Pattern
            //
            //                          =============
            //                          Pack Expansion

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int })
            // value = { 1 }
            tuplify(1, "A")
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                                 ======
            //                                 Repetition Pattern
            //
            //                          =============
            //                          Pack Expansion

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int, String }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int })
            // value = { 1 }
            tuplify(1, "A")
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                                 ======
            //                                 Repetition Pattern
            //
            //                          =============
            //                          Pack Expansion

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int, String }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int, String })
            // value = { 1, "A" }
            tuplify(1, "A")
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                                 ======

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int, String }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int, String })
            // value = { 1, "A" }
            tuplify(1, "A")
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                                            ===============

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int, String }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int, String })
            // value = { 1, "A" }
            tuplify(1, "A")
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                                            ===============
            //                               Pack Expansion in Tuple Type

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int, String }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int, String })
            // value = { 1, "A" }
            tuplify(1, "A")
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                                            ===============
            //                               Pack Expansion in Tuple Type

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int })
            // value = { 1 }
            tuplify(1)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                                            ===============
            //                               Pack Expansion in Tuple Type

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int })
            // value = { 1 }
            //
            // Pack Expansion in Tuple Type
            // -> (repeat each T)
            tuplify(1)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                                            ===============
            //                               Pack Expansion in Tuple Type

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int })
            // value = { 1 }
            //
            // Pack Expansion in Tuple Type
            // -> (repeat each T)
            // -> Int
            tuplify(1)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                                            ===============
            //                               Pack Expansion in Tuple Type

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int })
            // value = { 1 }
            //
            // Pack Expansion in Tuple Type
            // -> (repeat each T)
            // -> Int
            tuplify(1, "A")
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                                            ===============
            //                               Pack Expansion in Tuple Type

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int, String }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int })
            // value = { 1 }
            //
            // Pack Expansion in Tuple Type
            // -> (repeat each T)
            // -> Int
            tuplify(1, "A")
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                                            ===============
            //                               Pack Expansion in Tuple Type

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int, String }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int, String })
            // value = { 1, "A" }
            //
            // Pack Expansion in Tuple Type
            // -> (repeat each T)
            // -> Int
            tuplify(1, "A")
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                                            ===============
            //                               Pack Expansion in Tuple Type

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int, String }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int, String })
            // value = { 1, "A" }
            //
            // Pack Expansion in Tuple Type
            // -> (repeat each T)
            // -> (Int, String)
            tuplify(1, "A")
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
            //                                            ===============
            //                               Pack Expansion in Tuple Type

              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int, String, Bool }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int, String, Bool })
            // value = { 1, "A", true }
            //
            // Pack Expansion in Tuple Type
            // -> (repeat each T)
            // -> (Int, String, Bool)
            tuplify(1, "A", true)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int })
            // value = { 1 }
            //
            // Pack Expansion in Tuple Type
            // -> (repeat each T)
            // -> Int
            tuplify(1)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {

               (repeat each value)
            // ===================

            }

            // Type Parameter Pack
            // each T := { Int }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int })
            // value = { 1 }
            //
            // Pack Expansion in Tuple Type
            // -> (repeat each T)
            // -> Int
            tuplify(1)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {

               (repeat each value)
            // ===================
            // Value Pack Expansion

            }

            // Type Parameter Pack
            // each T := { Int }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int })
            // value = { 1 }
            //
            // Pack Expansion in Tuple Type
            // -> (repeat each T)
            // -> Int
            tuplify(1)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int })
            // value = { 1 }
            //
            // Pack Expansion in Tuple Type
            // -> (repeat each T)
            // -> Int
            //
            // Value Pack Expansion in Tuple Type
            // (repeat each value)
            tuplify(1)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int })
            // value = { 1 }
            //
            // Pack Expansion in Tuple Type
            // -> (repeat each T)
            // -> Int
            //
            // Value Pack Expansion in Tuple Type
            // (repeat each value)
            // 1
            tuplify(1)
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int })
            // value = { 1 }
            //
            // Pack Expansion in Tuple Type
            // -> (repeat each T)
            // -> Int
            //
            // Value Pack Expansion in Tuple Type
            // (repeat each value)
            // 1
            tuplify(1, "A")
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int, String }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int })
            // value = { 1 }
            //
            // Pack Expansion in Tuple Type
            // -> (repeat each T)
            // -> Int
            //
            // Value Pack Expansion in Tuple Type
            // (repeat each value)
            // 1
            tuplify(1, "A")
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int, String }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int, String })
            // value = { 1, "A" }
            //
            // Pack Expansion in Tuple Type
            // -> (repeat each T)
            // -> Int
            //
            // Value Pack Expansion in Tuple Type
            // (repeat each value)
            // 1
            tuplify(1, "A")
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int, String }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int, String })
            // value = { 1, "A" }
            //
            // Pack Expansion in Tuple Type
            // -> (repeat each T)
            // -> (Int, String)
            //
            // Value Pack Expansion in Tuple Type
            // (repeat each value)
            // 1
            tuplify(1, "A")
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
              (repeat each value)
            }

            // Type Parameter Pack
            // each T := { Int, String }
            //
            // Pack Expansion in Function Parameter
            // (_ value: repeat each T)
            // (_ value: { Int, String })
            // value = { 1, "A" }
            //
            // Pack Expansion in Tuple Type
            // -> (repeat each T)
            // -> (Int, String)
            //
            // Value Pack Expansion in Tuple Type
            // (repeat each value)
            // (1, "A")
            tuplify(1, "A")
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
              (repeat each value)
            }
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
              (repeat each value)
            }

            func double<each T>(_ value: repeat each T) -> (repeat each T) {
              (repeat each value)
            }
            """
            """
            // tuplify(1, "A") -> (1, "A")
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
              (repeat each value)
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat each T) -> (repeat each T) {
              (repeat each value)
            }
            """
            """
            func tuplify<each T>(_ value: repeat each T) -> (repeat each T) {
              (repeat each value)
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat each T) -> (repeat each T) {
              (repeat each value)
            }
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value))
            }
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }

            // each T := { Int, String }
            // Pack Expansion
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }

            // each T := { Int, String }
            // Pack Expansion
            // repeat each T
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }

            // each T := { Int, String }
            // Pack Expansion
            // repeat each T
              { Int, String }
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }

            // each T := { Int, String }
            // Pack Expansion
            // repeat each T
              { Int, String }.map { each T => Repetition Pattern }
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }

            // each T := { Int, String }
            // Pack Expansion
            // repeat each T
              { Int, String }.map { each T => each T }
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }

            // each T := { Int, String }
            // Pack Expansion
            // repeat each T
              { Int, String }.map { each T => each T }
            //  ===
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }

            // each T := { Int, String }
            // Pack Expansion
            // repeat each T
              { Int, String }.map { each T => each T }
            //  ===
                                  {    Int => Int    }
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }

            // each T := { Int, String }
            // Pack Expansion
            // repeat each T
              { Int, String }.map { each T => each T }
            //  ===
                                  {    Int => Int    }
            = { Int }
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }

            // each T := { Int, String }
            // Pack Expansion
            // repeat each T
              { Int, String }.map { each T => each T }
            //       ======
                                  {    Int => Int    }
            = { Int }
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }

            // each T := { Int, String }
            // Pack Expansion
            // repeat each T
              { Int, String }.map { each T => each T }
            //       ======
                                  { String => String }
            = { Int }
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }

            // each T := { Int, String }
            // Pack Expansion
            // repeat each T
              { Int, String }.map { each T => each T }
            //       ======
                                  { String => String }
            = { Int, String }
            """

            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }

            // each T := { Int, String }
            // Pack Expansion
            // repeat each T
              { Int, String }.map { each T => each T }
            = { Int, String }
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }

            // each T := { Int, String }
            // Pack Expansion
            // repeat each T
              { Int, String }.map { each T => each T }
            = { Int, String }

            // repeat (each T, each T)
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }

            // each T := { Int, String }
            // Pack Expansion
            // repeat each T
              { Int, String }.map { each T => each T }
            = { Int, String }

            // repeat (each T, each T)
              { Int, String }
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }

            // each T := { Int, String }
            // Pack Expansion
            // repeat each T
              { Int, String }.map { each T => each T }
            = { Int, String }

            // repeat (each T, each T)
              { Int, String }.map { each T => Repetition Pattern }
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }

            // each T := { Int, String }
            // Pack Expansion
            // repeat each T
              { Int, String }.map { each T => each T }
            = { Int, String }

            // repeat (each T, each T)
              { Int, String }.map { each T => (each T, each T) }
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }

            // each T := { Int, String }
            // Pack Expansion
            // repeat each T
              { Int, String }.map { each T => each T }
            = { Int, String }

            // repeat (each T, each T)
              { Int, String }.map { each T => (each T, each T) }
            //  ===
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }

            // each T := { Int, String }
            // Pack Expansion
            // repeat each T
              { Int, String }.map { each T => each T }
            = { Int, String }

            // repeat (each T, each T)
              { Int, String }.map { each T => (each T, each T) }
            //  ===
                                  {    Int => (Int, Int)       }
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }

            // each T := { Int, String }
            // Pack Expansion
            // repeat each T
              { Int, String }.map { each T => each T }
            = { Int, String }

            // repeat (each T, each T)
              { Int, String }.map { each T => (each T, each T) }
            //  ===
                                  {    Int => (Int, Int)       }
            = { (Int, Int) }
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }

            // each T := { Int, String }
            // Pack Expansion
            // repeat each T
              { Int, String }.map { each T => each T }
            = { Int, String }

            // repeat (each T, each T)
              { Int, String }.map { each T => (each T, each T) }
            //       ======
                                  {    Int => (Int, Int)       }
            = { (Int, Int) }
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }

            // each T := { Int, String }
            // Pack Expansion
            // repeat each T
              { Int, String }.map { each T => each T }
            = { Int, String }

            // repeat (each T, each T)
              { Int, String }.map { each T => (each T, each T) }
            //       ======
                                  { String => (String, String) }
            = { (Int, Int) }
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }

            // each T := { Int, String }
            // Pack Expansion
            // repeat each T
              { Int, String }.map { each T => each T }
            = { Int, String }

            // repeat (each T, each T)
              { Int, String }.map { each T => (each T, each T) }
            //       ======
                                  { String => (String, String) }
            = { (Int, Int), (String, String) }
            """
            """
            func tuplify<each T>(_ value: repeat (each T)) -> (repeat (each T)) {
              (repeat (each value))
            }

            // double(1, "A") -> ((1, 1), ("A", "A"))
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }

            // each T := { Int, String }
            // Pack Expansion
            // repeat each T
              { Int, String }.map { each T => each T }
            = { Int, String }

            // repeat (each T, each T)
              { Int, String }.map { each T => (each T, each T) }
            = { (Int, Int), (String, String) }
            """

            """
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
              (repeat (each value, each value))
            }
            """

            """
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
            //                                               =========================
              (repeat (each value, each value))
            }
            """

            """
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
            //                                               =========================
              (repeat (each value, each value))
            }

            (repeat (each T, each T))
            =========================
            """

            """
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
            //                                               =========================
              (repeat (each value, each value))
            }

            each T := { Int, String }

            (repeat (each T, each T))
            =========================
            """

            """
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
            //                                               =========================
              (repeat (each value, each value))
            }

            each T := { Int, String }

            (repeat (each T, each T))
            =========================

             repeat (each T, each T)
             =======================
            """
            """
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
            //                                               =========================
              (repeat (each value, each value))
            }

            each T := { Int, String }

            (repeat (each T, each T))
            =========================

             repeat (each T, each T)
             =======================

              {Int, String}.map { each T => Pattern }
            """
            """
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
            //                                               =========================
              (repeat (each value, each value))
            }

            each T := { Int, String }

            (repeat (each T, each T))
            =========================

             repeat (each T, each T)
             =======================

              {Int, String}.map { each T => (each T, each T) }
            """
            """
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
            //                                               =========================
              (repeat (each value, each value))
            }

            each T := { Int, String }

            (repeat (each T, each T))
            =========================

             repeat (each T, each T)
             =======================

              {Int, String}.map { each T => (each T, each T) }
            = { (Int, Int) }
            """
            """
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
            //                                               =========================
              (repeat (each value, each value))
            }

            each T := { Int, String }

            (repeat (each T, each T))
            =========================

             repeat (each T, each T)
             =======================

              {Int, String}.map { each T => (each T, each T) }
            = { (Int, Int), (String, String) }
            """
            """
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
            //                                               =========================
              (repeat (each value, each value))
            }

            each T := { Int, String }

            (repeat (each T, each T))
            =========================

              ({ (Int, Int), (String, String) })
            """
            """
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
            //                                               =========================
              (repeat (each value, each value))
            }

            each T := { Int, String }

            (repeat (each T, each T))
            =========================

              ({ (Int, Int), (String, String) })

              ({A, B, C})
            """
            """
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
            //                                               =========================
              (repeat (each value, each value))
            }

            each T := { Int, String }

            (repeat (each T, each T))
            =========================

              ({ (Int, Int), (String, String) })

              ({A, B, C})
            = (A, B, C)
            """
            """
            func double<each T>(_ value: repeat (each T)) -> (repeat (each T, each T)) {
            //                                               =========================
              (repeat (each value, each value))
            }

            each T := { Int, String }

            (repeat (each T, each T))
            =========================

              ({ (Int, Int), (String, String) })
            = ((Int, Int), (String, String))

              ({A, B, C})
            = (A, B, C)
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            struct MechaInt {
              let value: Int
              func demolishCountryside() { }
            }
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            struct MechaInt {
              let value: Int
              func demolishCountryside() { }
            }

            extension Int: Upgradable {
              func upgrade() -> MechaInt {
                MechaInt(value: self)
              }
            }
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            struct MechaInt {
              let value: Int
              func demolishCountryside() { }
            }

            extension Int: Upgradable {
              func upgrade() -> MechaInt {
                MechaInt(value: self)
              }
            }

            struct Coolean {
              let value: Boolean
              func equals(that: Boolean) {
                print("I don't care")
              }
            }
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            struct MechaInt {
              let value: Int
              func demolishCountryside() { }
            }

            extension Int: Upgradable {
              func upgrade() -> MechaInt {
                MechaInt(value: self)
              }
            }

            struct Coolean {
              let value: Boolean
              func equals(that: Boolean) {
                print("I don't care")
              }
            }

            extension Boolean: Upgradable {
              func upgrade() -> Coolean {
                Coolean(value: self)
              }
            }
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            upgradeAll(12, "hello", true)
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            upgradeAll(12, "hello", true) -> (MechaInt, RoboString, Coolean)
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            upgradeAll(12, "hello", true) -> (MechaInt, RoboString, Coolean)

            func upgradeAll<T>(_ value: T) -> T
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            upgradeAll(12, "hello", true) -> (MechaInt, RoboString, Coolean)

            func upgradeAll<each T>(_ value: repeat each T) -> T
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            upgradeAll(12, "hello", true) -> (MechaInt, RoboString, Coolean)

            func upgradeAll<each T>(_ value: repeat each T) -> (repeat each T)
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            upgradeAll(12, "hello", true) -> (MechaInt, RoboString, Coolean)

            func upgradeAll<each T: Upgradable>(_ value: repeat each T) -> (repeat each T)
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            upgradeAll(12, "hello", true) -> (MechaInt, RoboString, Coolean)

            func upgradeAll<each T: Upgradable>(_ value: repeat each T) -> (repeat (each T).Upgraded)
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            upgradeAll(12, "hello", true) -> (MechaInt, RoboString, Coolean)

            func upgradeAll<each T: Upgradable>(_ value: repeat each T) -> (repeat (each T).Upgraded)
              { Int, String, Bool }
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            upgradeAll(12, "hello", true) -> (MechaInt, RoboString, Coolean)

            func upgradeAll<each T: Upgradable>(_ value: repeat each T) -> (repeat (each T).Upgraded)
              { Int, String, Bool }.map { each T => Repetition Pattern }
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            upgradeAll(12, "hello", true) -> (MechaInt, RoboString, Coolean)

            func upgradeAll<each T: Upgradable>(_ value: repeat each T) -> (repeat (each T).Upgraded)
              { Int, String, Bool }.map { each T => (each T).Upgraded }
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            upgradeAll(12, "hello", true) -> (MechaInt, RoboString, Coolean)

            func upgradeAll<each T: Upgradable>(_ value: repeat each T) -> (repeat (each T).Upgraded)
              { Int, String, Bool }.map { each T => (each T).Upgraded }
            = { Int.Upgraded, String.Upgraded, Bool.Upgraded }
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            upgradeAll(12, "hello", true) -> (MechaInt, RoboString, Coolean)

            func upgradeAll<each T: Upgradable>(_ value: repeat each T) -> (repeat (each T).Upgraded)
              { Int, String, Bool }.map { each T => (each T).Upgraded }
            = { Int.Upgraded, String.Upgraded, Bool.Upgraded }
            = { MechaInt, RoboString, Coolean }
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            upgradeAll(12, "hello", true) -> (MechaInt, RoboString, Coolean)

            func upgradeAll<each T: Upgradable>(_ value: repeat each T) -> (repeat (each T).Upgraded)
              { Int, String, Bool }.map { each T => (each T).Upgraded }
            = { Int.Upgraded, String.Upgraded, Bool.Upgraded }
            = { MechaInt, RoboString, Coolean }
            = (MechaInt, RoboString, Coolean)
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            upgradeAll(12, "hello", true) -> (MechaInt, RoboString, Coolean)

            func upgradeAll<each T: Upgradable>(_ value: repeat each T) -> (repeat (each T).Upgraded) {
              ???
            }
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            upgradeAll(12, "hello", true) -> (MechaInt, RoboString, Coolean)

            func upgradeAll<each T: Upgradable>(_ value: repeat each T) -> (repeat (each T).Upgraded) {
              (repeat each value)
            }
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            upgradeAll(12, "hello", true) -> (MechaInt, RoboString, Coolean)

            func upgradeAll<each T: Upgradable>(_ value: repeat each T) -> (repeat (each T).Upgraded) {
              (repeat (each value).upgrade())
            }
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            upgradeAll(12, "hello", true) -> (MechaInt, RoboString, Coolean)

            func upgradeAll<each T: Upgradable>(_ value: repeat each T) -> (repeat (each T).Upgraded) {
              (repeat (each value).upgrade())
            }
              { 12, "hello", true }
            """

            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            upgradeAll(12, "hello", true) -> (MechaInt, RoboString, Coolean)

            func upgradeAll<each T: Upgradable>(_ value: repeat each T) -> (repeat (each T).Upgraded) {
              (repeat (each value).upgrade())
            }
              { 12, "hello", true }
            = { 12, "hello", true }.map { each value => Repetition Pattern }
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            upgradeAll(12, "hello", true) -> (MechaInt, RoboString, Coolean)

            func upgradeAll<each T: Upgradable>(_ value: repeat each T) -> (repeat (each T).Upgraded) {
              (repeat (each value).upgrade())
            }
              { 12, "hello", true }
            = { 12, "hello", true }.map { each value => Repetition Pattern }
            = { 12, "hello", true }.map { each value => (each value).upgrade() }
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            upgradeAll(12, "hello", true) -> (MechaInt, RoboString, Coolean)

            func upgradeAll<each T: Upgradable>(_ value: repeat each T) -> (repeat (each T).Upgraded) {
              (repeat (each value).upgrade())
            }
              { 12, "hello", true }
            = { 12, "hello", true }.map { each value => Repetition Pattern }
            = { 12, "hello", true }.map { each value => (each value).upgrade() }
            = { 12.upgrade(), "hello".upgrade(), true.upgrade() }
            """
            """
            protocol Upgradable {
              associatedtype Upgraded
              func upgrade() -> Upgraded
            }

            upgradeAll(12, "hello", true) -> (MechaInt, RoboString, Coolean)

            func upgradeAll<each T: Upgradable>(_ value: repeat each T) -> (repeat (each T).Upgraded) {
              (repeat (each value).upgrade())
            }
              { 12, "hello", true }
            = { 12, "hello", true }.map { each value => Repetition Pattern }
            = { 12, "hello", true }.map { each value => (each value).upgrade() }
            = { 12.upgrade(), "hello".upgrade(), true.upgrade() }
            = (12.upgrade(), "hello".upgrade(), true.upgrade())
            """
         }
      }
   }
}

func tuple<each T>(_ t: repeat each T) -> (repeat each T) {
   //  let cool = repeat [ each t]
   return (repeat each t)
}

func forward<each U>(u: repeat each U) {
   _ = tuplify(repeat each u) //  T := {repeat each U}
   _ = tuplify(repeat each u, 10) // T := {repeat each U, Int}
   _ = tuplify(repeat each u, repeat each u) // T := {repeat each U, repeat each U}
   _ = tuplify(repeat [each u]) // T := {repeat Array<each U>}
}
