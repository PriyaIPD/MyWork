import UIKit

let strOfCharToSort = "azcdczbdxaaczdbbaazdz"
let setOfChars = Set(strOfCharToSort)
let setOfCharsArray = Array(setOfChars).sorted()
let listOfSortedCharSubstrings = setOfCharsArray.map { (charachter) in
    return strOfCharToSort.filter { $0 == charachter }
}
  print(listOfSortedCharSubstrings)
