import Foundation

func InsertionSort<T:Comparable>(a:Array<T>) -> Array<T> {
	var n :Array<T> = Array<T>()
	if a.count == 0 {
		return n
	}
	n.append(a[0])
	for item :T in a[1..a.count] {
		let count = n.count
		for i in 0...count {
			if i == 0 {
				if item < n[i] {
					n.insert(item, atIndex: 0)
					break
				}
			}
			else if i == count {
				n.append(item)
			}
			else {
				if item > n[i-1] && item <= n[i] {
					n.insert(item, atIndex: i)
					break
				}
			}
		}
	}
	return n
}

InsertionSort(Int[]())
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
