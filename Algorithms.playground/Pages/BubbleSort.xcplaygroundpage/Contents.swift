//: # Bubble Sort

import Foundation

extension Array where Element:Comparable {

	func sortedArrayWithBubbleSort() -> [Element] {
		var copy = self
		if copy.count <= 1 {
			return copy
		}

		for i in 0..<(self.count - 1) {
			for j in 0..<(self.count - 1 - i) {
				let left = copy[j]
				let right = copy[j + 1]
				if (left > right) {
					copy[j] = right
					copy[j + 1] = left
				}
			}
		}
		return copy
	}
}

func bubbleSort<T:Comparable>(elements :T...) -> [T] {
	return elements.sortedArrayWithBubbleSort()
}

var intArray :[Int] = [5 ,6 ,7, 7, 8, -1]
intArray.sortedArrayWithBubbleSort()

var stringArray :[String] = ["z" ,"o" ,"n", "b", "l", "e"]
stringArray.sortedArrayWithBubbleSort()

//: [Next](@next)
