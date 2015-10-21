import Cocoa

class UTF8Parser {

	static func setBit(value :CChar, _ bit :CChar) -> CChar {
		return value | (1 << bit)
	}

	static func clearBit(value :CChar, _ bit :CChar) -> CChar {
		return value & ~(1 << bit)
	}

	static func findCodeLength(value :CChar) -> Int {
		var length = 0
		for i in 1...7 {
			if value & (1 << (8 - i)) == 0 {
				break
			}
			length++
		}
		return length
	}

	static func parse(input :String) -> String {
		guard let inputData = input.dataUsingEncoding(NSUTF8StringEncoding) else {
			return ""
		}
		var output = ""
		let inputDataLength = inputData.length
		let cCharArray = Array(UnsafeBufferPointer<CChar>(start: UnsafePointer(inputData.bytes), count: inputDataLength))
		var i = 0
		while i < inputDataLength {
			let char :CChar = cCharArray[i]
			if char & (1 << 7) == 0 {
				output += String(format: "%c (U+%04X) ", char, char)
				i++
			} else {
				let codeLength = findCodeLength(char)
				var stringSlice = Array(cCharArray[i..<i+codeLength])
				var shift :Int = 0
				var theCodeToProduce :Int = 0
				for charInSlice in stringSlice.reverse()[0..<(stringSlice.count-1)] {
					let currentCode = clearBit(charInSlice, 7)
					theCodeToProduce |= Int(currentCode) << shift
					shift += 6
				}
				var currentCode = stringSlice[0]
				for bitToClear :CChar in 8-codeLength..<8 {
					currentCode = clearBit(currentCode, bitToClear)
				}
				theCodeToProduce |= Int(currentCode) << shift
				let dataChump = NSData(bytes: stringSlice, length: stringSlice.count)
				let theString = NSString(data: dataChump, encoding: NSUTF8StringEncoding)
				let theOutput = String(format: "%@ (U+%04X) ", theString!, theCodeToProduce)
				output += theOutput
				i += codeLength
			}
		}
		return output
	}

}

UTF8Parser.parse("Hi")
UTF8Parser.parse("中文")
UTF8Parser.parse("這個拿來當新人作業如何")

