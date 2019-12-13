import UIKit

// How to format date time
var dateToday = Date.init()
let dateFormatterPrint = DateFormatter()
dateFormatterPrint.dateFormat = "MM/dd/yyyy"
print(dateFormatterPrint.string(from: dateToday))
