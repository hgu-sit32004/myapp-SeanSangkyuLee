//
//  SoundManager.swift
//  Match App
//
//  Created by student02 on 2018. 6. 12..
//  Copyright © 2018년 student02. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    
    static var audioPlayer:AVAudioPlayer?
    
    enum SoundEffect {
        case flip
        case shuffle
        case match
        case nomatch
    }
    
    static func playSound(_ effect:SoundEffect) {
     
        var soundFilename = ""
        switch effect {
            case .flip:
                soundFilename = "cardflip"
            
            case .shuffle:
                soundFilename = "shuffle"
            
            case .match:
                soundFilename = "dingcorrect"
                
            case .nomatch:
                soundFilename = "dingwrong"
      
        }
        
        
        let bundlePath = Bundle.main.path(forResource: soundFilename, ofType: "wav")
        
        guard bundlePath != nil else{
            print("Couldn't find sound file \(soundFilename) in the bundle")
            return
        }
        
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        
        do{
            //Create audio Player object
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            audioPlayer?.play()
        }
        catch{
            print("Couldn't create the audio player object for sound file\(soundFilename)")
        }
    }
}
