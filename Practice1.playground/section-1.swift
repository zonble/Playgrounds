import Foundation

func findTheBiggestItemInArray<T:Comparable>(list :[T]) -> T? {
	if list.count == 0 {
		return nil
	}
	var theMax = list[0]
	for item in list[1..<list.count] {
		if theMax < item {
			theMax = item
		}
	}
	return theMax
}

func findTheBiggestItemInArray2<T:Comparable>(list :[T]) -> T? {
	if list.count == 0 {
		return nil
	}
	if list.count == 1 {
		return list[0]
	}
	if list.count == 2 {
		var i1 = list[0]
		var i2 = list[1]
		if i1 > i2 {
			return i1
		}
		return i2
	}

	var mid = list.count / 2
	var i1 = findTheBiggestItemInArray2(Array(list[0..<mid]))
	var i2 = findTheBiggestItemInArray2(Array(list[mid..<list.count]))
	var tmp = [T]()
	if let i1 = i1 { tmp += i1 }
	if let i2 = i2 { tmp += i2 }
	return findTheBiggestItemInArray2(tmp)
}
//
//var a:[Int] = Array(Range(start: 1, end: 10))
findTheBiggestItemInArray([1,2,3,4,5,6,7,8,9,10])
findTheBiggestItemInArray2([1,2,3,4,5,6,7,8,9,10])


func findInsertionIndex<T:Comparable>(list:[T], forItem item:T, from low :Int, to high :Int) -> Int {
	if list.count == 0 { return 0 }
	if item < list[low] { return low }
	if item > list[high] { return high + 1 }
	if high - low == 1 {
		return high
	}
	var mid = low + (high - low) / 2
	if list[mid] == item {
		return mid
	}
	else if list[mid] > item {
		return findInsertionIndex(list, forItem: item, from: low, to: mid)
	} else {
		return findInsertionIndex(list, forItem: item, from: mid, to: high)
	}
}


func findNSmallestItemsInArray<T:Comparable>(list :[T], n :Int) -> [T] {
	var min = [T]()

	for item in list {
		if min.count == n && item >= min[min.count - 1] {
			continue
		}
		let index = findInsertionIndex(min, forItem: item, from: 0, to: min.count - 1)
		min.insert(item, atIndex: index)
		if min.count > n {
			min.removeLast()
		}
	}
	return min
}

findNSmallestItemsInArray([3,5,7,1,23,4,6,7], 3)

