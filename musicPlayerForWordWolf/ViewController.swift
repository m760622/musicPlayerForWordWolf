//
//  ViewController.swift
//  musicPlayerForWordWolf
//
//  Created by 山口賢登 on 2018/04/03.
//  Copyright © 2018年 山口賢登. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer: AVAudioPlayer!

    @IBOutlet weak var musicButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setMusic()
    }
    
    func setMusic() {
        let audioPath = Bundle.main.path(forResource: "午後のカフェ", ofType:"mp3")!
        let audioUrl = URL(fileURLWithPath: audioPath)
        var audioError:NSError?
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
        } catch let error as NSError {
            audioError = error
            audioPlayer = nil
        }
        if let error = audioError {
            print("Error \(error.localizedDescription)")
        }
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func tapMusicButton(_ sender: Any) {
        if audioPlayer.isPlaying {
            audioPlayer.stop()
            musicButton.setTitle("Stop", for: UIControlState())
        } else {
            audioPlayer.play()
            musicButton.setTitle("Play", for: UIControlState())
        }
    }
    
}

