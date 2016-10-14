//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



let departureDateString = "00:01"
let arrivalDateString = "00:00"

let formatter = DateFormatter()

formatter.dateFormat = "HH:mm"

let departureDate = formatter.date(from: departureDateString)
let arrivalDate   = formatter.date(from: arrivalDateString)


var timeInterval = arrivalDate?.timeIntervalSince(departureDate!)
if let timeInterval = timeInterval {
  
let finalInterval = timeInterval > 0 ? timeInterval : 24 * 3600 + timeInterval
  let suffix = timeInterval > 0 ? "" : "(+1)"

let time = "\(Int(finalInterval/3600))h \(Int((finalInterval/60).truncatingRemainder(dividingBy:60) ))m\(suffix)"
}

