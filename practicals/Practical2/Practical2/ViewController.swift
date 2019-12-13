//
//  ViewController.swift
//  Practical2
//
//  Created by Brian Chew on 22/10/19.
//  Copyright © 2019 Brian Chew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtField: UILabel!
    
    var friendList:[Friend] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let friend0:Friend = Friend(firstname: "Brian", lastname: "Chew", age: 18)
        let friend1:Friend = Friend(firstname: "Jack", lastname: "Chew", age: 21)
        let friend2:Friend = Friend(firstname: "Winston", lastname: "Chew", age: 42)
        let friend3:Friend = Friend(firstname: "Kimble", lastname: "Chew", age: 23)
        let friend4:Friend = Friend(firstname: "Lesley", lastname: "Chew", age: 40)

        friendList.append(friend0)
        friendList.append(friend1)
        friendList.append(friend2)
        friendList.append(friend3)
        friendList.append(friend4)

        DisplayFriends()
        DisplayFriendsUnder20()
        print("Friend's average age! \(findAverageAge())")
    
        
    }
    
    @IBAction func btnClick(_ sender: Any) {
        txtField.text = "Test Button CLicked!"
    }
    
    func DisplayFriends(){
        txtField.text = ""
        for i in friendList{
            print("\(i.firstname) \(i.lastname), \(i.age)")
            txtField.text = txtField.text! + "\(i.firstname) \(i.lastname), \(i.age)" + "\n"

        }
    }
    
    func DisplayFriendsUnder20(){
        print("Displaying the friends under 20!")
        for i in friendList{
            if(i.age<20){
                print("Student's name is is \(i.firstname) \(i.lastname) and they're \(i.age) ")
            }
        }
    }
    
    func findAverageAge()->Double{
        print("Displaying average age on the list!")
        var sum = 0
        for i in friendList{
            sum = sum + i.age
        }
        return Double(Double(sum)/Double(friendList.count))
    }

}

