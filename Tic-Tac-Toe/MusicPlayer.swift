//
//  MusicPlayer.swift
//  Tic-Tac-Toe
//
//  Created by Никита Журавлев on 08.06.2024.
//

import Foundation
import AVFoundation



//Singleton
class MusicPlayer{
    
    static let shared = MusicPlayer()
    
    private var audioPlayer: AVAudioPlayer?
    private var isMusicPlaying = false
    
    private init(){
        guard let url = Bundle.main.url(forResource: "music", withExtension: "mp3") else {
            print("Couldn't find music file")
            return
        }
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1
        }catch{
            print("Couldn't create audio player: \(error)")
        }
    }
    
    func playMusic(){
        audioPlayer?.play()
        isMusicPlaying = true
    }
    
    func pauseMusic(){
        audioPlayer?.stop()
        isMusicPlaying = false
    }
    
    func toggleMusic(){
        if isMusicPlaying{
            pauseMusic()
        }else{
            playMusic()
        }
    }
    
    
    func isPlaying() -> Bool{
        return isMusicPlaying
    }
    
}
