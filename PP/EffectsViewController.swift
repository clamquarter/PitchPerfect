//
//  EffectsViewController.swift
//  PP
//
//  Created by India Doria on 6/16/20.
//  Copyright © 2020 India Doria. All rights reserved.
//

import UIKit
import AVFoundation

class EffectsViewController: UIViewController {
    var recordedAudioURL: URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int { case fast = 0, slow, highPitch, lowPitch,  echo, reverb}
    
    //MARK - Outlets
    @IBOutlet var fastButton: UIButton!
    @IBOutlet var slowButton: UIButton!
    @IBOutlet var highPitchButton: UIButton!
    @IBOutlet var lowPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet var recordingDuration: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()

    }
    
    // MARK: - Navigation

 
    
    // MARK: Actions & Functions
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
            print("slow button pressed!")
        case .fast:
            playSound(rate: 1.5)
            print("fast button pressed!")
        case .highPitch:
            playSound(pitch: 1000)
            print("high pitch button pressed!")
        case .lowPitch:
            playSound(pitch: -1000)
            print("low pitch button pressed!")
        case .echo:
            playSound(echo: true)
            print("echo button pressed!")
        case .reverb:
            playSound(reverb: true)
            print("reverb button pressed!")
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        print("Stop Audio Button Pressed")
        stopAudio()
    }
    
}
