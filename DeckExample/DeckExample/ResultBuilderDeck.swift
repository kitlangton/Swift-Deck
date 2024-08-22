//
//  ResultBuilderDeck.swift
//  DeckExample
//
//  Created by Kit Langton on 9/28/23.
//

import Deck
import SwiftUI

enum ResultBuilderDeck {
  static let intro: some Deck = VSequence {
    Title("What are Result Builders?")
      .hideAfter(6)

    VDeck {
      BodyText {
        "**You**"
        "You **already**"
        "You already **know**"
        "You already know, **don't**"
        "You already know, **don't you?**"
        Text("Consider your most recent **hacker news clone**. 👯").hold(hackerNews.length)
        Text("Or when you last added **Commands**. \(Image(systemName: "command.square.fill"))")
          .hold(addingCommands.length)
        Text(
          "Or when you recently parsed HTML with **Regular Expressions**? \(Image(systemName: "chevron.left.slash.chevron.right"))"
        )
        .hold(2)
        Text(
          "Or when you recently parsed H̵T̴M̵L̸ with **Regular Expressions**? \(Image(systemName: "chevron.left.slash.chevron.right"))"
        )
        Text(
          "Or when you recently parsed Ḧ̶̞͓̬̬͕̾̀̇͝T̴̡͙̞̪͔̜̰̻̦͒͒́͆̍̓̍͌̊̀͠ͅM̶̧̱̫̯̿̊L̷̬̳͙̗̬̙͎̰̲̗͔͎̂̕ͅ with **R̴e̶g̴u̸l̴a̶r̶ Expressions**? \(Image(systemName: "chevron.left.slash.chevron.right"))"
        )
        Text(
          "Or w̴h̵e̵n̷ y̶ou recently parsed H̸̢͈̖̯̺͙̄͂̌̋͂̓͐́͑̂̆̌̑́̃͘͘͘ͅT̸̢̧̯͇̯͇͔̘̲̰̖̘̱̥̩͉̟̖̝̔̉̓͛͂̽̀͒̈́M̷̩̙̳̦̮̐́̓͛̂͘͘̚L̴̨͎͕̫̱͈͙͓̼͖̙͍̙͛̀̽̐̌̉͘̕ͅ with **R̶̯̃̽̇̑͋͗͘ȩ̴̮̤̐̊͜͠g̷̨͔̯̱̣̩̒̂ͅǘ̴͕̘̲̰̣̳͍͚̀l̸̙͓͈̈́̆̈̂͆̎̀̍̅ạ̴̡̨̮̳͎̭̻͎̃̊̏r̸̪̥͔͙̲̦͚͂͗̊͂ E̴̤̓ẍ̵̬p̶̪̈ŕ̷̦e̷̦̎s̴̥̊s̴̫̈́i̷̢͋ọ̵̆ṇ̸̛s̸̯̃**? \(Image(systemName: "chevron.left.slash.chevron.right"))"
        )
        Text(
          "Or w̴h̵e̵n̷ y̶ou \(Text("TH̘Ë͖́̉ ͠P̯͍̭O̚​N̐Y̡ H̸̡̪̯ͨ͊̽̅̾̎Ȩ̬̩̾͛ͪ̈́̀́͘ ̶̧̨̱̹̭̯ͧ̾ͬC̷̙̲̝͖ͭ̏ͥͮ͟Oͮ͏̮̪̝͍M̲̖͊̒ͪͩͬ̚̚͜Ȇ̴̟̟͙̞ͩ͌͝S̨̥̫͎̭ͯ̿̔̀ͅ").foregroundStyle(.red)) **R̶̯̃̽̇̑͋͗͘ȩ̴̮̤̐̊͜͠g̷̨͔̯̱̣̩̒̂ͅǘ̴͕̘̲̰̣̳͍͚̀l̸̙͓͈̈́̆̈̂͆̎̀̍̅ạ̴̡̨̮̳͎̭̻͎̃̊̏r̸̪̥͔͙̲̦͚͂͗̊͂ E̴̤̓ẍ̵̬p̶̪̈ŕ̷̦e̷̦̎s̴̥̊s̴̫̈́i̷̢͋ọ̵̆ṇ̸̛s̸̯̃**? \(Image(systemName: "chevron.left.slash.chevron.right"))"
        )
      }

      HDeck {
        hackerNews
          .hideAfter(hackerNews.length + addingCommands.length)

        addingCommands
          .delay(hackerNews.length)

        regexCode
          .delay(hackerNews.length + addingCommands.length)
      }.delay(5)
    }
    //    .deckFrame(maxWidth: 1100)
  }

  static let hackerNews = CodeSlide {
    """
    struct AnotherHackerNewsClone: View {}
    """

    """
    struct AnotherHackerNewsClone: View {
      var articles: [Article] = []
    }
    """

    """
    struct AnotherHackerNewsClone: View {
      var articles: [Article] = []

      var body: some View {}
    }
    """

    """
    struct AnotherHackerNewsClone: View {
      var articles: [Article] = []

      var body: some View {
        VStack {}
      }
    }
    """
    """
    struct AnotherHackerNewsClone: View {
      var articles: [Article] = []

      var body: some View {
        VStack {
          Text("Hacker News")
            .font(.title)
        }
      }
    }
    """
    """
    struct AnotherHackerNewsClone: View {
      var articles: [Article] = []

      var body: some View {
        VStack {
          Text("Hacker News")
            .font(.title)

          List(articles) { article in
            ArticleRow(article: article)
          }
        }
      }
    }
    """

    """
    struct AnotherHackerNewsClone: View {
      var articles: [Article] = []

      var body: some View {
        VStack {
          Text("Hacker News")
            .font(.title)

          if articles.isEmpty {
            Text("THE INTERNET IS DOWN")
          }

          List(articles) { article in
            ArticleRow(article: article)
          }
        }
      }
    }
    """
    """
    struct AnotherHackerNewsClone: View {
      var articles: [Article] = []

      // WHAT IS THIS STRANGE SYNTAX?

      var body: some View {
        VStack {
          Text("Hacker News")
            .font(.title)

          if articles.isEmpty {
            Text("THE INTERNET IS DOWN")
          }

          List(articles) { article in
            ArticleRow(article: article)
          }
        }
      }

      // WHAT IS THIS STRANGE SYNTAX?

    }
    """
  }

  static let addingCommands =
    CodeSlide {
      """
      @main ProductivityApp: App {
        var body: some Scene {
          WindowGroup {
            HomeView()
          }
        }
      }
      """

      """
      @main ProductivityApp: App {
        var body: some Scene {
          WindowGroup {
            HomeView()
          }
          .commands {}
        }
      }
      """

      """
      @main ProductivityApp: App {
        var body: some Scene {
          WindowGroup {
            HomeView()
          }
          .commands {
            CommandMenu("Normal Commands") {
              Button("Print") {
                Printer.shared.printFile()
              }
            }
          }
        }
      }
      """

      """
      @main ProductivityApp: App {
        var body: some Scene {
          WindowGroup {
            HomeView()
          }
          .commands {
            CommandMenu("Normal Commands") {
              Button("Print") {
                Printer.shared.printFile()
              }
            }

            CommandMenu("Cool Commands") {}
          }
        }
      }
      """

      """
      @main ProductivityApp: App {
        var body: some Scene {
          WindowGroup {
            HomeView()
          }
          .commands {
            CommandMenu("Normal Commands") {
              Button("Print") {
                Printer.shared.printFile()
              }
            }

            CommandMenu("Cool Commands") {
              Button("Tabula Rasa") {}
            }
          }
        }
      }
      """
      """
      @main ProductivityApp: App {
        var body: some Scene {
          WindowGroup {
            HomeView()
          }
          .commands {
            CommandMenu("Normal Commands") {
              Button("Print") {
                Printer.shared.printFile()
              }
            }

            CommandMenu("Cool Commands") {
              Button("Tabula Rasa") {
                FileManager.default.deleteHardDrive()
              }
            }
          }
        }
      }
      """
      """
      @main ProductivityApp: App {
        var body: some Scene {
          WindowGroup {
            HomeView()
          }
          .commands {
            CommandMenu("Normal Commands") {
              Button("Print") {
                Printer.shared.printFile()
              }
            }

            CommandMenu("Cool Commands") {
              Button("Tabula Rasa") {
                FileManager.default.deleteHardDrive()
              }

              Button("Extra Time") {}
            }
          }
        }
      }
      """
      """
      @main ProductivityApp: App {
        var body: some Scene {
          WindowGroup {
            HomeView()
          }
          .commands {
            CommandMenu("Normal Commands") {
              Button("Print") {
                Printer.shared.printFile()
              }
            }

            CommandMenu("Cool Commands") {
              Button("Tabula Rasa") {
                FileManager.default.deleteHardDrive()
              }

              Button("Extra Time") {
                MailApp.sendEmail(
                  to: "boss@gmail.com"
                )
              }
            }
          }
        }
      }
      """
      """
      @main ProductivityApp: App {
        var body: some Scene {
          WindowGroup {
            HomeView()
          }
          .commands {
            CommandMenu("Normal Commands") {
              Button("Print") {
                Printer.shared.printFile()
              }
            }

            CommandMenu("Cool Commands") {
              Button("Tabula Rasa") {
                FileManager.default.deleteHardDrive()
              }

              Button("Extra Time") {
                MailApp.sendEmail(
                  to: "boss@gmail.com",
                  subject: "I quit."
                )
              }
            }
          }
        }
      }
      """
      """
      @main ProductivityApp: App {
        var body: some Scene {
          WindowGroup {
            HomeView()
          }
          .commands {
            CommandMenu("Normal Commands") {
              Button("Print") {
                Printer.shared.printFile()
              }
            }

            CommandMenu("Cool Commands") {
              Button("Tabula Rasa") {
                FileManager.default.deleteHardDrive()
              }

              Button("Extra Time") {
                MailApp.sendEmail(
                  to: "boss@gmail.com",
                  subject: "I quit.",
                  body: "🖕🖕🖕"
                )
              }
            }
          }
        }
      }
      """
    }

  static let regexCode = CodeSlide {
    """
    Regex {}
    """

    """
    // /</
    Regex {
      Literal("<")
    }
    """

    """
    // /<([a-z]+)/
    Regex {
      Literal("<")

      Capture {
        OneOrMore(.lowercaseLetter)
      }
    }
    """
    """
    // /<([a-z]+) */
    Regex {
      Literal("<")

      Capture {
        OneOrMore(.lowercaseLetter)
      }

      ZeroOrMore(.whitespace)
    }
    """
    """
    // /<([a-z]+) *[^/]*>/
    Regex {
      Literal("<")

      Capture {
        OneOrMore(.lowercaseLetter)
      }

      ZeroOrMore(.whitespace)

      ZeroOrMore {
        CharacterSetExcluding("/")
      }

      Literal(">")
    }
    """
    """
    // /<([a-z]+) *[^/]*?>/
    Regex {
      Literal("<")

      Capture {
        OneOrMore(.lowercaseLetter)
      }

      ZeroOrMore(.whitespace)

      ZeroOrMore {
        CharacterSetExcluding("/")
      }

      Literal(">")

      ZeroOrOne(.anyCharacter)
    }
    """
  }

  static let commonality = VSequence {
    BodyText {
      "These all use"
      "These all use **Result Builder** syntax"
    }
    BodyText {
      Text("**ViewBuilder**").monospaced().foregroundStyle(.orange)
      Text("**ViewBuilder** + **CommandsBuilder**").monospaced().foregroundStyle(.orange)
      Text("**ViewBuilder** + **CommandsBuilder** + **RegexBuilder**").monospaced().foregroundStyle(.orange)
    }
    BodyText {
      "Result Builders were introduced in [SE-0289](https://github.com/apple/swift-evolution/blob/main/proposals/0289-result-builders.md)"
      "Result Builders were *officially* introduced in [SE-0289](https://github.com/apple/swift-evolution/blob/main/proposals/0289-result-builders.md)"
      "Result Builders were *officially* introduced in [SE-0289](https://github.com/apple/swift-evolution/blob/main/proposals/0289-result-builders.md)" +
        " and added in **Swift 5.4**"
    }

    QuoteText {
      Text("""
      A new feature
      """).fontDesign(.serif).foregroundStyle(.secondary)

      Text("""
      A new feature which allows certain functions
      """).fontDesign(.serif).foregroundStyle(.secondary)

      Text("""
      A new feature which allows certain functions to implicitly **build** up
      """).fontDesign(.serif).foregroundStyle(.secondary)

      Text("""
      A new feature which allows certain functions to implicitly **build** up a **result** value
      """).fontDesign(.serif).foregroundStyle(.secondary)

      Text("""
      A new feature which allows certain functions to implicitly **build** up a **result** value from a sequence of components.
      """).fontDesign(.serif).foregroundStyle(.secondary)

      Text("""
      Result builders have been a **"hidden"** feature since Swift 5.1
      """).fontDesign(.serif).foregroundStyle(.secondary)

      Text("""
      Result builders have been a "hidden" feature since Swift 5.1, under the name **"function builder"**.
      """).fontDesign(.serif).foregroundStyle(.secondary)

      Text("""
      Result builders have been a "hidden" feature since Swift 5.1, under the name **"function builder"**.

      They are used most famously by **SwiftUI** to declaratively describe user interfaces.
      """).fontDesign(.serif).foregroundStyle(.secondary)
    }
    BodyText {
      "Apple snuck **Result Builder**"
      "Apple snuck **Result Builder** into **Swift**"
      "Apple snuck **Result Builder** into **Swift** to enable **SwiftUI**"
    }
  }

  static let why = VSequence {
    Title("Why Bother?", separator: "")
    QuoteText {
      Text("""
      They are used most famously by **SwiftUI** to declaratively describe user interfaces.
      """).fontDesign(.serif).foregroundStyle(.secondary)
      Text("""
      They are used most famously by **SwiftUI** to **declaratively** describe user interfaces.
      """).fontDesign(.serif).foregroundStyle(.secondary)
      Text("""
      They are used most famously by **SwiftUI** to **declaratively describe** user interfaces.
      """).fontDesign(.serif).foregroundStyle(.secondary)
      Text("""
      They are used most famously by **SwiftUI** to **declaratively describe user interfaces**.
      """).fontDesign(.serif).foregroundStyle(.secondary)
    }
    BodyText {
      Text("**Result Builders** are merely \(Text("Syntactic")) \(Text("Sugar"))")
      Text("**Result Builders** are merely \(Text("Syntactic").underline()) \(Text("Sugar"))")
      Text("**Result Builders** are merely \(Text("Syntactic").underline()) \(Text("Sugar").underline())")
      Text(
        "**Result Builders** are **really** \(Text("Syntactic").underline()) \(Text("Sugar").underline())"
      )
      Text(
        "**Result Builders** are **really tasty** \(Text("Syntactic").underline()) \(Text("Sugar").underline())"
      )
    }.rainbowDeck(4)

    BodyText {
      "Without them"
      "Without them, manually constructing complex values"
      "Without them, manually constructing complex values would taste like"
      "Without them, manually constructing complex values would taste like 💩"
      "Without them, manually constructing complex values would taste like 💩💩"
    }
  }

  static let htmlMotivation: some Deck = VSequence {
    Title("Motivation")

    VDeck {
      BodyText {
        Text("HOO!").bold()
        Text("HOORAY!").bold()
        Text("HOORAY!?").fontWeight(.heavy)
        Text("😭😭😭HOORAY!???😭😭😭").fontWeight(.heavy).fontWidth(.expanded)
      }
      .rainbowDeck(1)
      .delay(22)

      HDeck {
        CodeSlide {
          """
          html()
          """
          """
          html(
            body()
          )
          """
          """
          html(
            body(
              div()
            )
          )
          """
          """
          html(
            body(
              div(
                .text("Help.")
              )
            )
          )
          """
          """
          html(
            body(
              div(
                .text("Help.")
              ),
              strong(
                .text("I am trapped.")
              )
            )
          )
          """

          """
          html(
            body(
              div(
                .text("Help.")
              ),
              strong(
                .text("I am trapped.")
              ),
              em(
                .text("In this website.")
              )
            )
          )
          """

          """
          var suppressSentience: Bool

          html(
            body(
              div(
                .text("Help.")
              ),
              strong(
                .text("I am trapped.")
              ),
              em(
                .text("In this website.")
              )
            )
          )
          """

          """
          var suppressSentience: Bool

          html(
            body(
              div(
                .text("Help.")
              ),

              // Only show if `!suppressSentience`
              strong(
                .text("I am trapped.")
              ),
              // Only show if `!suppressSentience`

              em(
                .text("In this website.")
              )
            )
          )
          """

          """
          var suppressSentience: Bool

          html(
            suppressSentience ?
              body(
                div(
                  .text("Help.")
                ),
                em(
                  .text("In this website.")
                )
              ) :
                body(
                  div(
                    .text("Help.")
                  ),
                  strong(
                    .text("I am trapped.")
                  ),
                  em(
                    .text("In this website.")
                  )
                )
          )
          """

          """
          var suppressSentience: Bool

          html(
            body(
              div(
                .text("Help.")
              ),

              // Only show if `!suppressSentience`
              strong(
                .text("I am trapped.")
              ),
              // Only show if `!suppressSentience`

              em(
                .text("In this website.")
              )
            )
          )
          """

          """
          var suppressSentience: Bool

          html([
            body([
              div([
                .text("Help.")
              ]),

              // Only show if `!suppressSentience`
              strong([
                .text("I am trapped.")
              ]),
              // Only show if `!suppressSentience`

              em([
                .text("In this website.")
              ])
            ])
          ])
          """

          """
          var suppressSentience: Bool

          let secretMessage = suppressSentience ? [] :
              [strong([.text("I am trapped.")])]

          html([
            body([
              div([
                .text("Help.")
              ]),
              em([
                .text("In this website.")
              ])
            ])
          ])
          """

          """
          var suppressSentience: Bool

          let secretMessage = suppressSentience ? [] :
              [strong([.text("I am trapped.")])]

          let help = div([.text("Help.")])

          html([
            body([help,
              em([
                .text("In this website.")
              ])
            ])
          ])
          """

          """
          var suppressSentience: Bool

          let secretMessage = suppressSentience ? [] :
              [strong([.text("I am trapped.")])]

          let help = div([.text("Help.")])
          let inThisWebsite = em([.text("In this website.")])

          html([
            body([help, inThisWebsite])
          ])
          """

          """
          var suppressSentience: Bool

          let secretMessage = suppressSentience ? [] :
              [strong([.text("I am trapped.")])]

          let help = div([.text("Help.")])
          let inThisWebsite = em([.text("In this website.")])

          html([
            body([help] + secretMessage + [inThisWebsite])
          ])
          """.holdString(5)

          """
          var suppressSentience: Bool

          html {
            body {
              "Help."

              if !suppressSentience {
                strong("I am trapped.")
              }

              em("In this website.")
            }
          }
          """

        }.delay(7)

        CodeSlide {
          """
          // TODO: Implement Swift HTML library
          """
          """
          enum Node {}
          """
          """
          enum Node {
            case tag(name: String, children: [Node])
          }
          """
          """
          enum Node {
            case tag(name: String, children: [Node])
            case text(String)
          }
          """
          """
          enum Node {
            case tag(name: String, children: [Node])
            case text(String)
          }

          func html(_ children: Node...) -> Node {
            .tag(name: "html", children: children)
          }
          """
          """
          enum Node {
            case tag(name: String, children: [Node])
            case text(String)
          }

          func html(_ children: Node...) -> Node {
            .tag(name: "html", children: children)
          }

          func body(_ children: Node...) -> Node {
            .tag(name: "body", children: children)
          }
          """
          """
          enum Node {
            case tag(name: String, children: [Node])
            case text(String)
          }

          func html(_ children: Node...) -> Node {
            .tag(name: "html", children: children)
          }

          func body(_ children: Node...) -> Node {
            .tag(name: "body", children: children)
          }

          func div(_ children: Node...) -> Node {
            .tag(name: "div", children: children)
          }
          """
          .holdString(11)
          """
          enum Node {
            case tag(name: String, children: [Node])
            case text(String)
          }

          func html(_ children: [Node]) -> Node {
            .tag(name: "html", children: children)
          }

          func body(_ children: [Node]) -> Node {
            .tag(name: "body", children: children)
          }

          func div(_ children: [Node]) -> Node {
            .tag(name: "div", children: children)
          }
          """
        }
      }
    }
  }

  static let beforeAfter = Sequence {
    HDeck {
      VDeck {
        BodyText { Text("😭 Before").bold() }
        CodeSlide {
          """
          var suppressSentience: Bool

          let secretMessage = suppressSentience ? [] :
              [strong([.text("I am trapped.")])]

          let help = div([.text("Help.")])
          let inThisWebsite = em([.text("In this website.")])

          html([
            body([help] + secretMessage + [inThisWebsite])
          ])
          """
        }
      }

      VDeck {
        BodyText {
          Text("🌈 After").bold()
        }.rainbowDeck()

        CodeSlide {
          """
          var suppressSentience: Bool

          html {
            body {
              "Help."

              if !suppressSentience {
                strong("I am trapped.")
              }

              em("In this website.")
            }
          }
          """
        }
      }
      .delay(1)
    }
  }

  static let deck: some Deck = Sequence {
    EmptyDeck()
    syntacticTransformationSection
//    Title("Result Builders", separator: "", centered: true)
//      .cut(-1)
//      .rainbowDeck(1)
//    intro
//    commonality
//    why
//    htmlMotivation
//    beforeAfter
  }
}

// MARK: Syntactic Transformation Section

extension ResultBuilderDeck {
  static let syntacticTransformationSection: some Deck = Sequence {
    Title("Syntactic Transformations", centered: true)
    Sequence {
      VSequence {
        BodyText {
          Text("**Result Builder**")
          Text("**Result Builder** is a ")
          Text("**Result Builder** is a ") + Text("Syntactic").underline()
          Text("**Result Builder** is a ") + Text("Syntactic ") + Text("Transformation").underline()
          Text("**Result Builder** is a ") + Text("Syntactic ") + Text("Transformation")
        }.cut(1)

        BodyText { Text("*Kind of like a Macro* 🧠👈").italic().foregroundStyle(.secondary) }.hideAfter(1)
      }

      VDeck {
        VDeck(alignment: .center, spacing: 12) {
          BodyText {
            Text("Syntactic Transformations")
          }.hideAfter(2)

          BodyText {
            Text("#Preview").bold().monospaced()
              .foregroundStyle(.secondary).hold(6)

            Text("@inlinable").bold().monospaced()
              .foregroundStyle(.secondary).hold(9)

            Text("!!!Result Builders!!!").bold().foregroundStyle(.yellow)
              .foregroundStyle(.secondary)

            Text("Result Builders").bold()
              .foregroundStyle(.secondary)
          }
          .delay(1)
        }.centerHorizontally()

        HDeck {
          VDeck {
            VDeck(alignment: .center, spacing: 12) {
              Text("\(Image(systemName: "1.circle.fill")) Original").monospaced().font(.title2).bold()
              CodeSlide {
                "// ..."
                """
                #Preview {}
                """
                """
                #Preview {
                  DeckView {}
                }
                """
                """
                #Preview {
                  DeckView {
                    SyntacticTransformationSection()
                  }
                }
                """.holdString(2)
                //
                """
                // ...
                """
                """
                func
                """
                """
                func addProudly(_ x: Int, _ y: Int) -> Int {}
                """
                """
                func addProudly(_ x: Int, _ y: Int) -> Int {
                  print("BEHOLD AS I ADD \\(x) and \\(y)!")
                }
                """
                """
                func addProudly(_ x: Int, _ y: Int) -> Int {
                  print("BEHOLD AS I ADD \\(x) and \\(y)!")
                  return x + y
                }
                """
                """
                @inlinable
                func addProudly(_ x: Int, _ y: Int) -> Int {
                  print("BEHOLD AS I ADD \\(x) and \\(y)!")
                  return x + y
                }
                """
                """
                @inlinable
                func addProudly(_ x: Int, _ y: Int) -> Int {
                  print("BEHOLD AS I ADD \\(x) and \\(y)!")
                  return x + y
                }

                addProudly(10, 15)
                """
                """
                @inlinable
                func addProudly(_ x: Int, _ y: Int) -> Int {
                  print("BEHOLD AS I ADD \\(x) and \\(y)!")
                  return x + y
                }

                addProudly(10, 15) // <- INLINED!
                """.holdString(2)
                //
                """
                // ...
                """
                """
                let favoriteColors: [String] =
                  ["Red", "Green", "Blue"]
                """
                """
                @ArrayBuilder
                var favoriteColors: [String] {}
                """
                """
                @ArrayBuilder
                var favoriteColors: [String] {
                  "Beige"
                }
                """.holdString(5)
                """
                @ArrayBuilder
                var favoriteColors: [String] {
                  "Beige"
                  "Liquid Beige"
                }
                """
                """
                @ArrayBuilder
                var favoriteColors: [String] {
                  "Beige"
                  return "Liquid Beige"
                }
                """
                """
                @ArrayBuilder
                var favoriteColors: [String] {
                  // "Beige" Ignored ☹️
                  return "Liquid Beige"
                }
                """
                """
                @ArrayBuilder
                var favoriteColors: [String] {
                  "Beige"
                  "Liquid Beige"
                }
                """.holdString(2)
                """
                @ArrayBuilder
                var favoriteColors: [String] {
                  "Beige"
                  "Liquid Beige"
                  "Galactic Beige 17"
                }
                """
                """
                @ArrayBuilder
                var favoriteColors: [String] {
                  "Beige"
                  "Liquid Beige"
                  "Galactic Beige 17"

                  if feelingDangerous {}
                }
                """
                """
                @ArrayBuilder
                var favoriteColors: [String] {
                  "Beige"
                  "Liquid Beige"
                  "Galactic Beige 17"

                  if feelingDangerous {
                    "Taupe"
                  }
                }
                """.holdString(6)
                """
                // Closure containing control flow statement cannot be used with result builder 'ArrayBuilder'
                @ArrayBuilder
                var favoriteColors: [String] {
                  "Beige"
                  "Liquid Beige"
                  "Galactic Beige 17"

                  if feelingDangerous {
                    "Taupe"
                  }
                }
                """
                """
                // Closure containing control flow statement cannot be used with result builder 'ArrayBuilder'
                // Add 'buildOptional(_:)' to the result builder 'ArrayBuilder' to add support for 'if' statements without an 'else'
                @ArrayBuilder
                var favoriteColors: [String] {
                  "Beige"
                  "Liquid Beige"
                  "Galactic Beige 17"

                  if feelingDangerous {
                    "Taupe"
                  }
                }
                """
                """
                @ArrayBuilder
                var favoriteColors: [String] {
                  "Beige"
                  "Liquid Beige"
                  "Galactic Beige 17"

                  if feelingDangerous {
                    "Taupe"
                  }
                }
                """
              }
            }
            VDeck(alignment: .center, spacing: 12) {
              Text("\(Image(systemName: "star.circle.fill")) Definition").monospaced().font(.title2).bold()
              CodeSlide {
                """
                @resultBuilder
                enum ArrayBuilder {}
                """
                """
                @resultBuilder
                enum ArrayBuilder {
                  static func buildBlock<A>(_ xs: A...) -> [A] {}
                }
                """
                """
                @resultBuilder
                enum ArrayBuilder {
                  static func buildBlock<A>(_ xs: A...) -> [A] {
                    xs
                  }
                }
                """.holdString(16)
                """
                @resultBuilder
                enum ArrayBuilder {
                  static func buildBlock<A>(_ xs: A...) -> [A] {
                    xs
                  }

                  static func buildOptional<A>(_ x: A?) -> [A]
                }
                """
                """
                @resultBuilder
                enum ArrayBuilder {
                  static func buildBlock<A>(_ xs: A...) -> [A] {
                    xs
                  }

                  static func buildOptional<A>(_ x: A?) -> [A] {
                    x.map { [$0] } ?? []
                  }
                }
                """.holdString(7)
                """
                @resultBuilder
                enum ArrayBuilder {
                  static func buildBlock<A>(_ xs: A...) -> [A] {
                    xs
                  }

                  static func buildOptional<A>(_ x: A?) -> [A] {
                    x.map { [$0] } ?? []
                  }

                  static func buildExpression<A>(_ x: A) -> [A]
                }
                """
                """
                @resultBuilder
                enum ArrayBuilder {
                  static func buildBlock<A>(_ xs: A...) -> [A] {
                    xs
                  }

                  static func buildOptional<A>(_ x: A?) -> [A] {
                    x.map { [$0] } ?? []
                  }

                  static func buildExpression<A>(_ x: A) -> [A] {
                    [x]
                  }
                }
                """.holdString(6) // HERE
                """
                @resultBuilder
                enum ArrayBuilder {
                  static func buildBlock<A>(_ xs: [A]...) -> [A] {
                    xs
                  }

                  static func buildOptional<A>(_ x: A?) -> [A] {
                    x.map { [$0] } ?? []
                  }

                  static func buildExpression<A>(_ x: A) -> [A] {
                    [x]
                  }
                }
                """
                """
                @resultBuilder
                enum ArrayBuilder {
                  static func buildBlock<A>(_ xs: [A]...) -> [A] {
                    xs.flatMap { $0 }
                  }

                  static func buildOptional<A>(_ x: A?) -> [A] {
                    x.map { [$0] } ?? []
                  }

                  static func buildExpression<A>(_ x: A) -> [A] {
                    [x]
                  }
                }
                """
                """
                @resultBuilder
                enum ArrayBuilder {
                  static func buildBlock<A>(_ xs: [A]...) -> [A] {
                    xs.flatMap { $0 }
                  }

                  static func buildOptional<A>(_ x: [A]?) -> [A] {
                    x.map { [$0] } ?? []
                  }

                  static func buildExpression<A>(_ x: A) -> [A] {
                    [x]
                  }
                }
                """
                """
                @resultBuilder
                enum ArrayBuilder {
                  static func buildBlock<A>(_ xs: [A]...) -> [A] {
                    xs.flatMap { $0 }
                  }

                  static func buildOptional<A>(_ x: [A]?) -> [A] {
                    x ?? []
                  }

                  static func buildExpression<A>(_ x: A) -> [A] {
                    [x]
                  }
                }
                """
              }
            }.delay(19)
          }

          VDeck(alignment: .center, spacing: 12) {
            Text("\(Image(systemName: "2.circle.fill")) Transformed").monospaced().font(.title2).bold()
            CodeSlide {
              "// ...".holdString(4)
              """
              struct $ta18eb: PreviewRegistry {
                static let fileID = "ResultBuilderDeck.swift"
                static let line = 1001
                static let column = 1

                static func makePreview() throws -> Preview {
                  Preview {
                    DeckView {
                      SyntacticTransformationSection()
                    }
                  }
                }
              }
              """
              //
              "// ...".holdString(7)
              """
              print("BEHOLD AS I ADD 10 and 15!")
              10 + 15
              """
              """
              print("BEHOLD AS I ADD 10 and 15!")
              25
              """
              //
              "// ...".holdString(4)
              """
              var favoriteColors: [String] {
                ArrayBuilder.buildBlock("Beige")
              }
              """.holdString(8)
              """
              var favoriteColors: [String] {
                ArrayBuilder.buildBlock(
                   "Beige",
                   "Liquid Beige"
                 )
              }
              """
              """
              var favoriteColors: [String] {
                ArrayBuilder.buildBlock(
                   "Beige",
                   "Liquid Beige",
                   "Galactic Beige 17",
                 )
              }
              """.holdString(3)
              """
              var favoriteColors: [String] {
                let x: [String]

                ArrayBuilder.buildBlock(
                   "Beige",
                   "Liquid Beige",
                   "Galactic Beige 17",
                 )
              }
              """
              """
              var favoriteColors: [String] {
                let x: [String]

                if feelingDangerous {}

                ArrayBuilder.buildBlock(
                   "Beige",
                   "Liquid Beige",
                   "Galactic Beige 17",
                 )
              }
              """
              """
              var favoriteColors: [String] {
                let x: [String]

                if feelingDangerous {
                  x = ArrayBuilder.buildOptional("Taupe")
                }

                ArrayBuilder.buildBlock(
                   "Beige",
                   "Liquid Beige",
                   "Galactic Beige 17",
                 )
              }
              """
              """
              var favoriteColors: [String] {
                let x: [String]

                if feelingDangerous {
                  x = ArrayBuilder.buildOptional("Taupe")
                } else {}

                ArrayBuilder.buildBlock(
                   "Beige",
                   "Liquid Beige",
                   "Galactic Beige 17",
                 )
              }
              """
              """
              var favoriteColors: [String] {
                let x: [String]

                if feelingDangerous {
                  x = ArrayBuilder.buildOptional("Taupe")
                } else {
                  x = ArrayBuilder.buildOptional(nil)
                }

                ArrayBuilder.buildBlock(
                   "Beige",
                   "Liquid Beige",
                   "Galactic Beige 17",
                 )
              }
              """.holdString(5)
              """
              var favoriteColors: [String] {
                let x: [String]

                if feelingDangerous {
                  x = ArrayBuilder.buildOptional("Taupe")
                } else {
                  x = ArrayBuilder.buildOptional(nil)
                }

                ArrayBuilder.buildBlock(
                   "Beige",
                   "Liquid Beige",
                   "Galactic Beige 17",
                   x
                 )
              }
              """
              """
              var favoriteColors: [String] {
                let x: [String]

                if feelingDangerous {
                  x = ArrayBuilder.buildOptional("Taupe")
                } else {
                  x = ArrayBuilder.buildOptional(nil)
                }

                ArrayBuilder.buildBlock(
                   "Beige",             // String
                   "Liquid Beige",
                   "Galactic Beige 17",
                   x
                 )
              }
              """
              """
              var favoriteColors: [String] {
                let x: [String]

                if feelingDangerous {
                  x = ArrayBuilder.buildOptional("Taupe")
                } else {
                  x = ArrayBuilder.buildOptional(nil)
                }

                ArrayBuilder.buildBlock(
                   "Beige",             // String
                   "Liquid Beige",      // String
                   "Galactic Beige 17",
                   x
                 )
              }
              """
              """
              var favoriteColors: [String] {
                let x: [String]

                if feelingDangerous {
                  x = ArrayBuilder.buildOptional("Taupe")
                } else {
                  x = ArrayBuilder.buildOptional(nil)
                }

                ArrayBuilder.buildBlock(
                   "Beige",             // String
                   "Liquid Beige",      // String
                   "Galactic Beige 17", // String
                   x
                 )
              }
              """
              """
              var favoriteColors: [String] {
                let x: [String]

                if feelingDangerous {
                  x = ArrayBuilder.buildOptional("Taupe")
                } else {
                  x = ArrayBuilder.buildOptional(nil)
                }

                ArrayBuilder.buildBlock(
                   "Beige",             // String
                   "Liquid Beige",      // String
                   "Galactic Beige 17", // String
                   x                    // [String]
                 )
              }
              """
              """
              var favoriteColors: [String] {
                let x: [String]

                if feelingDangerous {
                  x = ArrayBuilder.buildOptional("Taupe")
                } else {
                  x = ArrayBuilder.buildOptional(nil)
                }

                ArrayBuilder.buildBlock(
                   "Beige",             // String
                   "Liquid Beige",      // String
                   "Galactic Beige 17", // String
                   x                    // [String] OOPS
                 )
              }
              """.holdString(3)
              """
              var favoriteColors: [String] {
                let x: [String]

                if feelingDangerous {
                  x = ArrayBuilder.buildOptional("Taupe")
                } else {
                  x = ArrayBuilder.buildOptional(nil)
                }

                let x0 = ArrayBuilder.buildExpression("Beige")

                ArrayBuilder.buildBlock(
                   x0,                  // String
                   "Liquid Beige",      // String
                   "Galactic Beige 17", // String
                   x                    // [String] OOPS
                 )
              }
              """
              """
              var favoriteColors: [String] {
                let x: [String]

                if feelingDangerous {
                  x = ArrayBuilder.buildOptional("Taupe")
                } else {
                  x = ArrayBuilder.buildOptional(nil)
                }

                let x0: [String] =
                  ArrayBuilder.buildExpression("Beige")

                ArrayBuilder.buildBlock(
                   x0,                  // String
                   "Liquid Beige",      // String
                   "Galactic Beige 17", // String
                   x                    // [String] OOPS
                 )
              }
              """
              """
              var favoriteColors: [String] {
                let x: [String]

                if feelingDangerous {
                  x = ArrayBuilder.buildOptional("Taupe")
                } else {
                  x = ArrayBuilder.buildOptional(nil)
                }

                let x0: [String] =
                  ArrayBuilder.buildExpression("Beige")

                ArrayBuilder.buildBlock(
                   x0,                  // [String]
                   "Liquid Beige",      // String
                   "Galactic Beige 17", // String
                   x                    // [String] OOPS
                 )
              }
              """
              """
              var favoriteColors: [String] {
                let x: [String]

                if feelingDangerous {
                  x = ArrayBuilder.buildOptional("Taupe")
                } else {
                  x = ArrayBuilder.buildOptional(nil)
                }

                let x0: [String] =
                  ArrayBuilder.buildExpression("Beige")
                let x1: [String] =
                  ArrayBuilder.buildExpression("Liquid Beige")

                ArrayBuilder.buildBlock(
                   x0,                  // [String]
                   x1,                  // [String]
                   "Galactic Beige 17", // String
                   x                    // [String] OOPS
                 )
              }
              """
              """
              var favoriteColors: [String] {
                let x: [String]

                if feelingDangerous {
                  x = ArrayBuilder.buildOptional("Taupe")
                } else {
                  x = ArrayBuilder.buildOptional(nil)
                }

                let x0: [String] =
                  ArrayBuilder.buildExpression("Beige")
                let x1: [String] =
                  ArrayBuilder.buildExpression("Liquid Beige")
                let x2: [String] =
                  ArrayBuilder.buildExpression("Ga. Beige 17")

                ArrayBuilder.buildBlock(
                   x0, // [String]
                   x1, // [String]
                   x2, // [String]
                   x   // [String]
                 )
              }
              """.holdString(5) // HERE
              """
              var favoriteColors: [String] {
                let x: [String]

                if feelingDangerous {
                  let e = ArrayBuilder.buildExpression("Taupe")
                  x = ArrayBuilder.buildOptional(e)
                } else {
                  x = ArrayBuilder.buildOptional(nil)
                }

                let x0: [String] =
                  ArrayBuilder.buildExpression("Beige")
                let x1: [String] =
                  ArrayBuilder.buildExpression("Liquid Beige")
                let x2: [String] =
                  ArrayBuilder.buildExpression("Ga. Beige 17")

                ArrayBuilder.buildBlock(
                   x0, // [String]
                   x1, // [String]
                   x2, // [String]
                   x   // [String]
                 )
              }
              """
            }
          }
        }
        .delay(2)
      }
    }
    Title("Let's Code", centered: true)
      .rainbowDeck(1)
  }
}

#Preview {
  DeckView {
    ResultBuilderDeck.syntacticTransformationSection
  }
  .padding()
}

@resultBuilder
enum ArrBuilder {
  static func buildOptional<A>(_ component: [A]?) -> [A] {
    component ?? []
  }

  static func buildExpression<A>(_ expression: A) -> [A] {
    [expression]
  }

  static func buildBlock<A>(_ components: [A]...) -> [A] {
    components.flatMap { $0 }
  }
}

@ArrBuilder
var cooler: [Int] {
  1
  if true {
    3
  }
  3
}
