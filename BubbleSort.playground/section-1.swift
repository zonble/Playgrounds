import Foundation

func BubbleSort<T: Comparable>(a:[T]) -> [T] {
	var copy :[T] = [T](a)
	if copy.count <= 1 {
		return copy
	}

	for i in 0..<(a.count-1) {
		for index in 0..<(a.count-i-1) {
			let var1:T = copy[index]
			let var2:T = copy[index + 1]
			if (var1 > var2) {
				copy[index] = var2
				copy[index + 1] = var1
			}
		}
	}
	return copy
}

BubbleSort([Int]())
BubbleSort([1])
BubbleSort([1, 1, 1, 1, 1, 2])
BubbleSort([1, 2, 3, 4, 5, 6, 7, 8, 9])
BubbleSort([9, 8, 7, 6, 5, 4, 3, 2, 1])
BubbleSort([5, 3, 7, 8, 92131, 345, 67, 6, 44, 3, 2, 121, 2342])
BubbleSort("z o n b l e".componentsSeparatedByString(" "))
BubbleSort("a0 a1 a2 a3 a4 a8 a9 a7 a6 a5".componentsSeparatedByString(" "))
