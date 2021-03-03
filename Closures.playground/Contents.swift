import UIKit

func calculator (n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
	return operation(n1, n2)
}

func add (no1: Int, no2: Int) -> Int {
	return no1 + no2
}

func multiply (no1: Int, no2: Int) -> Int {
	return no1 * no2
}

calculator(n1: 2, n2: 3, operation: multiply)
// ^this can be simplified to this below:
calculator(n1: 2, n2: 3, operation: {(no1: Int, no2: Int) -> Int in return no1 * no2})
// Which can be further simplified as because data types of no1 and no2 are infered:
calculator(n1: 2, n2: 3, operation: {(no1, no2) -> Int in return no1 * no2})
// Compiler can also infer data type of the output as well (Int) so we can remove it as well:
calculator(n1: 2, n2: 3, operation: {(no1, no2) in return no1 * no2})
// In swift you can use anonymous parameter names. $0 means 1st parameter, $1 means 2nd parameter.
// The stuff in the curly braces is called a closure, hence, the namesake.
var product = calculator(n1: 2, n2: 3, operation: {$0 * $1})
// Proof that still = 6
print(product)
// Can be simplified further. In Swift, if the last parameter is a closure, you don't need the parameter name, "operation:"
product = calculator(n1: 2, n2: 3) {$0 * $1}
print(product)

/*
 * Increment every element in the array by 1 not using closures. Hard way.
 */
let array = [6,2,3,9,4,1]

func addOne (n1: Int) -> Int {
	return n1 + 1
}

array.map(addOne)


/*
 *	Increment every element in the array by 1 using closures. Easy way.
 */

// 1. turn addOne method into an anonymous function (i.e. a closure).
var closure = {(n1:Int) -> Int in return n1 + 1}

// Which can be reduced to by using type inference:
closure = {(n1) in return n1 + 1}

// Which can be reduced to by using an explicit return because we only have one expression inside of our closure.
closure = {(n1) in n1 + 1}

// Which can be reduced to by using shorthard notation ($0) for parameter 1: i.e. replace "(n1) in n1" with $0.
closure = {$0 + 1}

// Since the last item in the list of parameters, i.e., it's trailing, we can get rid of the parentheses on array.map and not use closure variable at all.
print(array.map{$0 + 1})

// How to "Stringify" an array of Ints using a closure.
let newArray = array.map{"\($0)"}
print(newArray)
