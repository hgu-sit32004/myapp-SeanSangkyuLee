//
//  ViewController.swift
//  ICTappD.MemoApp
//
//  Created by student02 on 2018. 5. 29..
//  Copyright © 2018년 student02. All rights reserved.
//

import UIKit

class Main: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var MemoData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        MemoData = UserDefaults.standard.object(forKey: "MemoData") as? [String] ?? [String]()
        
        return MemoData.count
        //for each section how many rows?
        //Flexible numbers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView .dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //Design of each Cells
        //let cell, reusable cells and Identifier makes to name it
        return Cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let MemoNumber = indexPath.row
        UserDefaults.standard.set(MemoNumber, forKey: "MemoNumber")
        //This code is for saving
        //Therefore if we click it, check the index number
        //Save the memonumber and get the record number -> Record face
        
        //show the number to change the showing status depending on the row
        //For each rows, we call it row
        
        self.performSegue(withIdentifier: "ToRecord", sender: self)
    
        //When select the row what are you gonna do?
        //show the record scene
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Add(_ sender: Any) {
        
        UserDefaults.standard.set(-1, forKey: "MemoNumber")
        
    }
    
    
}

