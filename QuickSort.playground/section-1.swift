import Foundation

func QuickSort<T: Comparable>(a:Array<T>) -> Array<T> {
	if a.count == 0 {
		return Array<T>()
	}
	var smaller = Array<T>()
	var larger = Array<T>()
	var equal = Array<T>()
	let firstItem = a[0]

	for anotherItem in a {
		if anotherItem < firstItem {
			smaller.append(anotherItem)
		} else if anotherItem > firstItem {
			larger.append(anotherItem)
		} else {
			equal.append(anotherItem)
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
