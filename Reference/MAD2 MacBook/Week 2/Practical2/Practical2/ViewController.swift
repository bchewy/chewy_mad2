//
//  ViewController.swift
//  Practical2
//
//  Created by MAD2 on 22/10/18.
//  Copyright © 2018 MAD2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblFriend: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let friend1 = Friend(firstname: "Nikko", lastname: "Lopez", age: 8)
        let friend2 = Friend(firstname: "Jiet", lastname: "Ng", age: 10)
        let friend3 = Friend(firstname: "Ryan", lastname: "Tan", age: 7)
        let friend4 = Friend(firstname: "Geoffrey", lastname: "Choke", age: 3)
        let friend5 = Friend(firstname: "Brian", lastname: "Chewey", age: 9)
        
        var friendList:[Friend] = []
        
        friendList.append(friend1)
        friendList.append(friend2)
        friendList.append(friend3)
        friendList.append(friend4)
        friendList.append(friend5)
        
        ShowFriends(friendList: friendList)
        displayFriendsUnder20(friendList: friendList)
        print(findAverageAge(friendList: friendList))
    }

func ShowFriends(friendList:[Friend]) {
    for f in friendList {
    print(f.firstName + " " + f.lastName + " " + String(f.age))
    lblFriend.text?.append(f.firstName + " " + f.lastName + " " + String(f.age) + "\n")
    }
    print("Number of friends: \(friendList.count)")
}
    func displayFriendsUnder20(friendList:[Friend]) {
        for f in friendList {
            if f.age < 20{
                print(f.firstName + " " + f.lastName + " " + String(f.age))
            }
        }
        print("Number of friends: \(friendList.count)")
    }
    func findAverageAge(friendList:[Friend])->Double{
        var avg:Double = 0
        for f in friendList {
            avg += Double(f.age)
        }
        avg = avg/Double(friendList.count)
        return avg
    }
}
