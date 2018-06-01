//
//  Record.swift
//  ICTappD.MemoApp
//
//  Created by student02 on 2018. 5. 30..
//  Copyright © 2018년 student02. All rights reserved.
//

import UIKit

class Record: UIViewController {
    // Record is the name, UIviewController is the type
    
//MARK: -VARIABLE
    @IBOutlet weak var RecordTextView: UITextView!
    var MemoData = [String]()
//VARIABLE_End
    
    //let does not change
    //var does change
    //Group which is consist of String
    //outlet means just show
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
        //First, get the MemoNumber, this is the number since there are numbers on the list.
        
        if MemoNumber == -1 {
            
            MemoData = UserDefaults.standard.object(forKey: "MemoData") as! [String]
            RecordTextView.text = "..."
            
            
        } else {
            MemoData = UserDefaults.standard.object(forKey: "MemoData") as! [String]
            //Why? Because there is always data in here
            
            RecordTextView.text = MemoData[MemoNumber]
            //show the things that in the Main's designated number
            
        }
        
     
    }
    //This is for adding the data
    
    
    
    
/*
        if MemoData.count == 0{
            RecordTextView.text = "..."
            //if there is no data, just erase
            
        } else {
            let MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
            //So MemoNumber is always been saved
            
            RecordTextView.text = MemoData[MemoNumber]
        }
        
        
        

        // Do any additional setup after loading the view.
        //when view is loaded what should we do?
        //So, It can be string or not therefore, you have to put ? on the back of as
        //save it as a name "0" and call it
        //When calling the memodata, string, if there is no string just make it.
        
    
    }
*/
    
    
//MARK : -ACTION
    @IBAction func Save(_ sender: Any) {
        
       let MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
        
        if MemoNumber == -1 {
            
            MemoData.insert(RecordTextView.text, at: 0)
            
            UserDefaults.standard.set(MemoData, forKey: "MemoData")
            
        } else {
            
            MemoData.remove(at: MemoNumber)
            MemoData.insert(RecordTextView.text, at: MemoNumber)
            
            UserDefaults.standard.set(MemoData, forKey: "MemoData")
            
            
        }
      
    }
    //action means do something
    //This is adding Memos, insert it and put it
    //at means put the new memo on the top of the list
    //Since we are saving the MemoData itself, we put MemoData, and name is MemoData
    //We have to check whether it came from the add or from the list
    
    //so erase it, change it and put it in the same place
    
    
//ACTION END
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
