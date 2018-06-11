//
//  ViewController.swift
//  Match App
//
//  Created by student02 on 2018. 6. 12..
//  Copyright © 2018년 student02. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {

    
    @IBOutlet weak var timerLabel: UILabel!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var model = CardModel()
    var cardArray = [Card]()
    
    var firstFlippedCardIndex:IndexPath?
    
    var timer:Timer?
    var milliseconds:Float = 30 * 1000 //10 seconds

    var soundManager = SoundManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Call the getCards method of the card model
        cardArray = model.getCards()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerElapsed), userInfo: nil, repeats: true)
        
        RunLoop.main.add(timer!, forMode: .commonModes)
        
        }
    
    override func viewDidAppear(_ animated: Bool) {
        
        SoundManager.playSound(.shuffle)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Timer Methods
    
    @objc func timerElapsed() {
        
        milliseconds -= 1
        
        //Convert to seconds
        let seconds = String(format: "%.2f", milliseconds/1000)
        
        //Set label
        timerLabel.text = "Time Remaining: \(seconds)"
        
        //when the timer has reached 0
        if milliseconds <= 0 {
            timer?.invalidate()
            timerLabel.textColor = UIColor.red
            
            
            checkGameEnded();
        }
    }
    
    

    //MARK: - UICollectionView Protocol Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cardArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Check if there's any time left
        if milliseconds <= 0 {
            
        }
        
        
        //Get an CardCollectionViewCell object
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        
        //Get the card that
        let card = cardArray[indexPath.row]
        
        //Set that card for the cell
        cell.setCard(card)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //Get the cell that the user selected
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        
        //Get the card that the user selected
        let card = cardArray[indexPath.row]
        
        if card.isFlipped == false && card.isMatched == false {
            
            //Flip the card
            cell.flip()
            
            SoundManager.playSound(.flip)
            
            //set the status of the card
            card.isFlipped = true
            
            //Determine if it's the first card or second card that;s flipped over
            if firstFlippedCardIndex == nil {
                
                
                firstFlippedCardIndex = indexPath
            
            } else {
                
                
                //TODO:Perform the matching logic
                checkForMatches(indexPath)
            }
        }
    }//End ViewController class
    
    // MARK: - Game Logic Mathods
    
    func checkForMatches(_ secondFlippedCardIndex:IndexPath){
        
        let cardOneCell = collectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
        
        let cardTwoCell = collectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
        
        //Get the cards for the two cards that were revealed
        let cardOne = cardArray[firstFlippedCardIndex!.row]
        let cardTwo = cardArray[secondFlippedCardIndex.row]
        
        if cardOne.imageName == cardTwo.imageName{
            
            SoundManager.playSound(.match)
            
            cardOne.isMatched = true
            cardTwo.isMatched = true
            
            cardOneCell?.remove()
            cardTwoCell?.remove()
            
            checkGameEnded()
            
        } else {
            
            SoundManager.playSound(.nomatch)
            
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
            
            cardOneCell?.flipBack()
            cardTwoCell?.flipBack()
            
        }
        
        //Tell the collectionview to reload the cell of the first card if it is nil
        if cardOneCell == nil {
            collectionView.reloadItems(at: [firstFlippedCardIndex!])
        }
        
        
        firstFlippedCardIndex = nil
    }
        func checkGameEnded(){
            var isWon = true
            
            for card in cardArray{
                
               if card.isMatched == false {
                isWon = false
                break
            }
        }
            
            //Messaging variables
            var title = ""
            var message = ""
            
            if isWon == true {
                if milliseconds > 0 {
                    timer?.invalidate()
                }
                
                title = "Congratulation!"
                message = "You've won"
                
            } else {
                if milliseconds > 0 {
                    return
                }
                
                title = "Game Over"
                message = "Yo've lost"
                
            }
            
            showAlert(title, message)
            
        }
        
        func showAlert(_ title:String, _ message:String){
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(alertAction)
            
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    
// End ViewController class
