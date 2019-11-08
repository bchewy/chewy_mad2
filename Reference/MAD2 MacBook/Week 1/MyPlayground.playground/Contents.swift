import UIKit
import Foundation // Random number generator

var str = "Hello, playground"
let i = 5
var j:Double = Double(i) / 5.0

j = 10

let a:Int = 5
print("The value is \(a)")

for b in 1..<20{
    print("\(b)")
}

for c in 1..<20{
    if ((c % 2) == 1){
        print("\(c)")
    }
}

var e = 0
for d in 1..<20{
    if ((d % 2) == 1){
        e += d
    }
}
print(e)
/*
// Declare instance function
func sayIt(aNumber: Int) {
    print("You pass a " + String(aNumber))
}
sayIt(aNumber: 5)
*/
func result (mark: Int) -> String{
    if (mark >= 50){
        return "Pass"
    }
    else{
        return "Fail"
    }
}
func findMax(n: [Int])->Int {
    var max:Int = 0
    for f in n {
        if (f > max) {
            max = f
        }
    }
    return max
}
var nums:[Int] = []
for _ in 1...10{
    let g = Int.random(in: 1..<100)
    nums.append(g)
}
print(nums)
print (findMax(n: nums))
let h = Int(arc4random_uniform(100))



func findMin(n: [Int])->Int {
    var min:Int = 100
    for i in n {
        if (i < min) {
            min = i
        }
    }
    return min
}
var minNums:[Int] = []
for _ in 1...10{
    let g = Int.random(in: 1..<100)
    minNums.append(g)
}
print(minNums)
print (findMin(n: minNums))



func findAvg(n: [Int])->Float {
    var avg:Float = 0.0
    for j in n {
        avg += Float(j)
    }
    avg = avg / Float(n.count)
    return avg
}
var avgNums:[Int] = []
for _ in 1...10{
    let g = Int.random(in: 1..<100)
    avgNums.append(g)
}
print(avgNums)
print (findAvg(n: avgNums))
