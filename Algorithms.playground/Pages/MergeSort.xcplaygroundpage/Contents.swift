//: [Previous](@previous)
//: # Merge Sort

import Foundation

extension Array where Element:Comparable {

	func sortedArrayUsingMergeSort() -> [Element] {
		func merge(head:[Element], _ tail:[Element]) -> [Element] {
			var mergedArray = [Element]()
			var (headIndex, tailIndex) = (0, 0)
			while headIndex < head.count && tailIndex < tail.count {
				if head[headIndex] < tail[tailIndex] {
					mergedArray.append(head[headIndex]); headIndex++
				} else {
					mergedArray.append(tail[tailIndex]); tailIndex++
				}
			}
			if headIndex >= tail.count {
				mergedArray += Array(tail[tailIndex..<tail.count])
			} else {
				mergedArray += Array(head[headIndex..<head.count])
			}
			return mergedArray
		}

		if self.count < 2 {
			return self
		}
		let mid = self.count / 2
		let head = Array(self[0..<mid]).sortedArrayUsingMergeSort()
		let tail = Array(self[mid..<self.count]).sortedArrayUsingMergeSort()
		return merge(head, tail)
	}

}

func mergeSort<T:Comparable>(elements :T...) -> [T] {
	return elements.sortedArrayUsingMergeSort()
}

var intArray :[Int] = [5 ,6 ,7, 7, 8, -1]
intArray.sortedArrayUsingMergeSort()

var stringArray :[String] = ["z" ,"o" ,"n", "b", "l", "e"]
stringArray.sortedArrayUsingMergeSort()



//: [Next](@next)
