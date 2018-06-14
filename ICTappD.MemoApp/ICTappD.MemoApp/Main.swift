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
    
    // 키워드 시작.
    var Keyword : String = ""
    
    func getKeyword(text : String) -> String
    {
        let text = text.lowercased()
        var textSplit = text.components(separatedBy: [" ", ",", "/","."])
        var textDic = [String : Int]()
        for i in 0 ..< textSplit.count{
            
            if textDic.keys.contains(textSplit[i])
            {
                textDic[textSplit[i]] = textDic[textSplit[i]]! + 1
            }
            else
            {
                textDic[textSplit[i]] = 1
            }
        }
        let arr = textDic.map {($1, $0)}
        var sortArray = arr.sorted {
            $0.0 > $1.0
        }
        var j = 0
        for i in 0..<sortArray.count{
            if ["is", "are", "am"].contains(sortArray[j].1){
                j = i+1
            }else{
                let Keyword = sortArray[j].1
                return Keyword
            }
        }
        return Keyword
    }
    
    
    
    //End of making key word
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    //MARK: -Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        MemoData = UserDefaults.standard.object(forKey: "MemoData") as? [String] ?? [String]()
        
        return MemoData.count
        //for each section how many rows?
        //Flexible numbers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView .dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainCell
        //Got from MainCell
        MemoData = UserDefaults.standard.object(forKey: "MemoData") as? [String] ?? [String]()
        //Get the MemoData
        
        Keyword = getKeyword(text: MemoData[indexPath.row])
        
        
        Cell.TitleLabel.text = Keyword
        
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
    //Table_End
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: -Action
    @IBAction func Add(_ sender: Any) {
        
        UserDefaults.standard.set(-1, forKey: "MemoNumber")
        
    }
    //Action_End
    
}

