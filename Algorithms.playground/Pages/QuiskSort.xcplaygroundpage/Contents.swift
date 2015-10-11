//: [Previous](@previous)
//: # Quick Sort

import Foundation

extension Array where Element:Comparable {

	func sortedArrayWithQuickSort() -> [Element] {
		if self.count < 1 {
			return self
		}
		let first = self.first!
		var smaller = [Element]()
		var bigger = [Element]()
		var same = [Element]()
		same.append(first)
		for item in self[1..<self.count] {
			if item > first {
				bigger.append(item)
			} else if item < first {
				smaller.append(item)
			} else {
				same.append(item)
			}
		}
		bigger = bigger.sortedArrayWithQuickSort()
		smaller = smaller.sortedArrayWithQuickSort()
		return smaller + same + bigger
	}

}

func quickSort<T:Comparable>(elements :T...) -> [T] {
	return elements.sortedArrayWithQuickSort()
}

var intArray :[Int] = [5 ,6 ,7, 7, 8, -1]
intArray.sortedArrayWithQuickSort()

var stringArray :[String] = ["z" ,"o" ,"n", "b", "l", "e"]
stringArray.sortedArrayWithQuickSort()


//: [Next](@next)
