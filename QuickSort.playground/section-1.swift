import Foundation

func QuickSort<T: Comparable>(a:Array<T>) -> Array<T> {
	if a.count == 0 {
		return a
	}
	var smaller = Array<T>()
	var larger = Array<T>()
	var equal = Array<T>()
	let firstInt:T = a[0]

	for otherInt:T in a {
		if otherInt < firstInt {
			smaller.append(otherInt)
		} else if otherInt > firstInt {
			larger.append(otherInt)
		} else {
			equal.append(otherInt)
		}

	}
	var result = Array<T>()
	result.extend(QuickSort(smaller))
	result.extend(equal)
	result.extend(QuickSort(larger))
	return result
}

QuickSort([19, 1, 2, 3, 4, 99, 1, 2, 3, 4, 6, 55])
QuickSort([4, 5, 9, 10])
QuickSort(["z", "o", "n", "b", "l", "e"])


