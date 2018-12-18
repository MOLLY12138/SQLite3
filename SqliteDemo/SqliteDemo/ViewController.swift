//
//  ViewController.swift
//  SqliteDemo
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 2016110326. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {

    
    @IBOutlet weak var personName: UITextField!
    @IBOutlet weak var personPhone: UITextField!
    let  db = SQLiteDB.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //把data.db放到Document/文件夹下面
        let result = db.open(dbPath: "", copyFile: true)
        print("result:\(result)")
       let r = db.execute(sql: "create table if not exits person(name varchar(20),phone varchar(20)) ")
        print(NSHomeDirectory())
        print(Bundle.main.bundlePath)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func add(_ sender: Any) {
        let r = db.execute(sql: "insert into person(name phone) values ('\(personName.text!)','\(personPhone.text!)')")
        print("result:\(r)")

        
    }
    
    @IBAction func update(_ sender: Any) {
        let r = db.execute(sql: "update person set phone = '\(personPhone.text!)' where name = '\(personName.text!)'")
        print("result:\(r)")
    }
    
    @IBAction func del(_ sender: Any) {
        
        let r = db.execute(sql: "delete from person where name = '\(personName.text!)' ")
        print("result:\(r)")
        
    }
    
    @IBAction func query(_ sender: Any) {
        let persons = db.query(sql: "select * from person where name = '\(personName.text!)'")
        if let person = persons.first, let phone = person["phone"] as? String{
            personPhone.text = phone
        }
        
    }
    
    
}

