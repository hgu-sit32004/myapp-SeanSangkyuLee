//
//  CardModel.swift
//  Match App
//
//  Created by student02 on 2018. 6. 12..
//  Copyright © 2018년 student02. All rights reserved.
//

import Foundation

class CardModel{
    
    func getCards() -> [Card] {
        
        var generatedNumbersArray = [Int]()
        
        //Declare an array to store the generated cards
        var generatedCardsArray = [Card]()
        
        
        
        //Randomly generate pairs of cards
        while generatedNumbersArray.count < 8 {
            
            //Get a random number
            let randomNumber = arc4random_uniform(13) + 1
            
            
            
            if generatedNumbersArray.contains(Int(randomNumber)) == false {
                
                
                //Log the number
                print(randomNumber)
                
                generatedNumbersArray.append(Int(randomNumber))
                
                //Create the first card object
                let cardOne = Card()
                cardOne.imageName = "card\(randomNumber)"
                
                generatedCardsArray.append(cardOne)
                
                //Create the second card object
                let cardTwo = Card()
                cardTwo.imageName = "card\(randomNumber)"
                
                generatedCardsArray.append(cardTwo)
            }
            
            
            
            //OPTIONAL: Make it so we only have unique pairs of cards
        }
        
        //TODO: Randomize the array
        for i in 0...generatedCardsArray.count-1 {
            
        let randomNumber = Int(arc4random_uniform(UInt32(generatedCardsArray.count)))
        
        let temporaryStorage = generatedCardsArray[i]
        generatedCardsArray[i] = generatedCardsArray[randomNumber]
        generatedCardsArray[randomNumber] = temporaryStorage
        }
            
        //REturn the array
        return generatedCardsArray
    
    }
    
}

