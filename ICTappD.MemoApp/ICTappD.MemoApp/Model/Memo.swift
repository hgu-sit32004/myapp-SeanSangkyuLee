//
//  Memo.swift
//  MemoApp
//
//  Created by student01 on 2018. 6. 12..
//  Copyright © 2018년 goeun. All rights reserved.
//

import Foundation

class Memo {
    
    //단문의 경우 그대로 설정- character의 수를 센 다음 일정 이하면 ketword를 그대로 설정
    func getKeyword(text : String) -> String{
        var textSplit = text.components(separatedBy: [" ", ",", "/","\n"])
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
        
        let Keyword = sortArray[0].1
        return Keyword
    }
    
    //func getScore(importance: Bool, visitCount: Int) -> Int{
        //중요도 50 방문기록 50
    //}
    
    
    let memoData:String
    let Keyword:String
    
    init(memoData: String){
        self.memoData = memoData
        self.Keyword = ""
    }
}
