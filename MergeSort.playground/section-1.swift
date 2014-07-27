import Foundation

func mergeSort<T:Comparable>(list:[T]) -> [T] {
	if list.count < 2 {
		return list
	}

	func merge(arrayA:[T], arrayB:[T]) -> [T] {
		var mergedArray = [T]()
		var (indexA, indexB) = (0, 0)
		while indexA < arrayA.count && indexB < arrayB.count {
			if arrayA[indexA] < arrayB[indexB] {
				mergedArray.append(arrayA[indexA])
				indexA++
			} else {
				mergedArray.append(arrayB[indexB])
				indexB++
			}
		}
		if indexA >= arrayB.count {
			mergedArray += Array(arrayB[indexB..<arrayB.count])
		} else {
			mergedArray += Array(arrayA[indexA..<arrayA.count])
		}
		return mergedArray
	}

	let mid = list.count / 2
	var U = mergeSort(Array(list[0..<mid]))
	var V = mergeSort(Array(list[mid..<list.count]))
	return merge(U, V)
}

mergeSort([5,4,3,2,1])
mergeSort([1,4,65,678678,2331231,43,6,7,768])
