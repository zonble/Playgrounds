import Foundation

func BubbleSort<T: Comparable>(a:Array<T>) -> Array<T> {
	if a.count <= 1 {
		return a
	}

	func swap(a:Array<T>, index1:Int, index2:Int) {
		let var1:T = a[index1]
		let var2:T = a[index2]
		a[index1] = var2
		a[index2] = var1
	}
	for i in 0..(a.count-1) {
		for index in 0..(a.count-i-1) {
			let var1:T = a[index]
			let var2:T = a[index + 1]
			if (var1 > var2) {
				swap(a, index, index + 1)
			}
		}
	}
	return a
}

BubbleSort(Int[]())
BubbleSort([1])
BubbleSort([1,2,3,4,5,6,7,8,9])
BubbleSort([9,8,7,6,5,4,3,2,1])
BubbleSort([5,3,7,8, 92131, 345,67, 6,44,3,2,121, 2342])




