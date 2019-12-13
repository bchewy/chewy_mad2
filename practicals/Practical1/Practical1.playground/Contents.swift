import UIKit
import Foundation


//var str:String? = "Hello, I'm brian"
//print(str)
//print(str!)

var num:[Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
var numOdd:[Int] = []
var sumOdd = 0

/*  Excercise 1 */
for i in num {
    print(i)
}

/* Excerise 2 */
for i in num {
    if !(i%2==0){
        print(i)
        numOdd.append(i)
    }
}

/* Excerise 3 */
for i in numOdd{
    sumOdd = sumOdd + i
}
print("Sum of Odd Numbers \(sumOdd)")

/* Example 2 */
func sayIt(aNumber: Int) {
    print("You pass a " + String(aNumber))
}

sayIt(aNumber: 5)

/* Excerise 4 */
func result(mark: Int)-> String{
    if(mark>49){return "Pass"}
    else{return "Fail"}
}
print(result(mark: 49))
print(result(mark: 51))

/* Excerise 5 */
func findMax(n:[Int])->Int {
    return n.max()!
}

func generateNumbers()->[Int]{
    var numbers:[Int] = []
    for i in 1...10 {
        var x = arc4random_uniform(100)
        numbers.append(Int(x))
    }
    return numbers
}
/*Excersie 6*/
func findMin(n:[Int])->Int{
    return n.min()!
}

/*Excersie 7*/

func findAvg(n:[Int])->Int{
    let sumArray = n.reduce(0, +)
    let avgArrayValue = sumArray / n.count
    return avgArrayValue
}
print(generateNumbers())
print(findMax(n: generateNumbers()))
print(findMin(n: generateNumbers()))
print(findAvg(n: generateNumbers()))
