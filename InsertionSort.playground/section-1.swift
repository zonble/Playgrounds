import Foundation

func findInsertionIndex<T:Comparable>(list:[T], n :T, low :Int, high :Int) -> Int {
	if list.count == 0 { return 0 }
	if n < list[low] { return low }
	if n > list[high] { return high + 1 }
	if high - low == 1 {
		if list[low] == n {
			return low
		}
		return high
	}
	var mid = low + (high - low) / 2
	if list[mid] == n {
		return mid
	}
	else if list[mid] > n {
		return findInsertionIndex(list, n, low, mid)
	} else {
		return findInsertionIndex(list, n, mid, high)
	}
}

func InsertionSort<T:Comparable>(a:[T]) -> Array<T> {
	var n :[T] = [T]()
	if a.count == 0 {
		return n
	}
	n.append(a[0])
	for item :T in a[1..<a.count] {
		let index = findInsertionIndex(n, item, 0, n.count - 1)
		n.insert(item, atIndex: index)
	}
	return n
}

InsertionSort([Int]())
InsertionSort([1])
InsertionSort([1, 2])
InsertionSort([2, 1])
InsertionSort([1, 2, 3])
InsertionSort([3, 2, 1])
InsertionSort([2, 1, 3])
InsertionSort([1, 2, 3, 4])
InsertionSort([4, 3, 2, 1])
InsertionSort([1, 4, 5, 2])
InsertionSort([1, 1, 1, 1, 2])
InsertionSort([2, 2, 2, 2, 1])
InsertionSort("z o n b l e".componentsSeparatedByString(" "))
InsertionSort("a0 a1 a2 a3 a4 a8 a9 a7 a6 a5".componentsSeparatedByString(" "))
