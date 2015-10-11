// Playground - noun: a place where people can play

import Cocoa

func euclidean(a:Int, b:Int) -> Int {
	var c = abs((a - b))
	if a % c  == 0 && b % c == 0 {
		return c
	}
	return euclidean(b, b: c)
}

euclidean(100, b: 75)
