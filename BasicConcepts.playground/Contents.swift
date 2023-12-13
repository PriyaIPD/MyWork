import UIKit

var greeting = "Hello, playground"
print(greeting)

struct PersonActivities {
    var name : String
    var activity : String
}

var person : [PersonActivities] = [ PersonActivities(name: "Ron", activity: "Run"),
                                   PersonActivities(name: "BigBird", activity: "Fun"),
                                   PersonActivities(name: "Priya", activity: "Code"),
                                   PersonActivities(name: "Abhi", activity: "Jump")]


for info in person{
    print("\(info.name) likes to \(info.activity)")
}
