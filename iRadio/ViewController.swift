//
//  ViewController.swift
//  iRadio
//
//  Created by ben-hur batista oliveira on 13/11/15.
//  Copyright © 2015 ben-hur batista oliveira. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

class ViewController: UIViewController {
    var player : AVPlayer = AVPlayer()
    var playing = true
    var buttonTitle = ""
    
    let PAUSE = "Pause"
    let PLAY = "Play"
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let videoURL = NSURL(string: "http://radio.livesh.com.br:8144")
        player = AVPlayer(URL: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        player.play()
        playing = true;
        buttonTitle = PAUSE
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func PlayAction() {
        if (playing){
            player.pause()
            buttonTitle = PLAY
        }else{
            player.play()
            buttonTitle = PAUSE
        }
        button.setTitle(buttonTitle, forState: UIControlState.Normal)
        playing = !playing
        
    }


}

