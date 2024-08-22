import Cocoa

func < <each Element: Comparable>(
  lhs: (repeat each Element),
  rhs: (repeat each Element)
)
  -> Bool
{
  var allTrue = true
  func assertTrue<A: Comparable>(_ x: A, y: A) {
    if !(x < y) {
      allTrue = false
    }
  }
  repeat assertTrue(each lhs, y: each rhs)
  return allTrue
}

print("a" < "b")
