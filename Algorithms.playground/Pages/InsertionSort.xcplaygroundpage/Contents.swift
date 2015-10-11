//: [Previous](@previous)
//: Insertion Sort

import Foundation

extension Array where Element:Comparable {

	func sortedArrayUsingInsertionSort() -> [Element] {
		var sortedArray = [Element]()

		if self.count == 0 {
			return sortedArray
		}

		func findInsertionIndexForItem(item :Element, within array :[Element], from : Int, to :Int) -> Int {
			if array.count == 0 { return 0 }
			if item < array[from] { return from }
			if item > array[to] { return to + 1 }
			if from - to == 1 {
				return array[from] == item  ? from : to
			}
			let mid = from + (from - to) / 2
			if array[mid] == item {
				return mid
			} else if array[mid] > item {
				return findInsertionIndexForItem(item, within: array, from: from, to: mid)
			} else {
				return findInsertionIndexForItem(item, within: array, from: mid, to: to)
			}
		}

		sortedArray.append(self.first!)
		for item in self[1..<self.count] {
			let index = findInsertionIndexForItem(item, within: sortedArray, from: 0, to: sortedArray.count - 1)
			sortedArray.insert(item, atIndex: index)
		}
		return sortedArray
	}

}

func InsertionSort<T:Comparable>(elements :T...) -> [T] {
	return elements.sortedArrayUsingInsertionSort()
}

InsertionSort(1)
InsertionSort(1, 2)
InsertionSort(2, 1)
InsertionSort(1, 2, 3)
InsertionSort(3, 2, 1)
InsertionSort(2, 1, 3)
InsertionSort(1, 2, 3, 4)
InsertionSort(4, 3, 2, 1)

//: [Next](@next)
