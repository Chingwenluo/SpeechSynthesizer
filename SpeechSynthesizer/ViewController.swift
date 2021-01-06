//
//  ViewController.swift
//  SpeechSynthesizer
//
//  Created by eric on 2020/8/16.
//  Copyright © 2020 eric. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    @IBOutlet weak var talkTextField: UITextField!
    @IBOutlet weak var voiceSlider: UISlider!
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var pitchSlider: UISlider!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var pitchLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var languageSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func speedSlider(_ sender: Any) {
        speedLabel.text = String(format: "%.2f", speedSlider.value)
    }
    
    @IBAction func pitchSlider(_ sender: Any) {
        pitchLabel.text = String(format: "%.2f", pitchSlider.value)
    }
    
    @IBAction func volumeSlider(_ sender: Any) {
         volumeLabel.text = String(format: "%.2f", voiceSlider.value)
    }
     
       let synthesizer = AVSpeechSynthesizer()
    @IBAction func saysomethingBtn(_ sender: Any) {
       
        if languageSegmentedControl.selectedSegmentIndex == 0{
        let Utterance =  AVSpeechUtterance(string: talkTextField.text!)
        Utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
            Utterance.rate = speedSlider.value
            Utterance.pitchMultiplier = pitchSlider.value
            Utterance.volume = voiceSlider.value
        synthesizer.speak(Utterance)
            
        } else if languageSegmentedControl.selectedSegmentIndex == 1{
            let Utterance =  AVSpeechUtterance(string: talkTextField.text!)
            Utterance.voice = AVSpeechSynthesisVoice(language: "zh-hk")
             Utterance.rate = speedSlider.value
             Utterance.pitchMultiplier = pitchSlider.value
             Utterance.volume = voiceSlider.value
            synthesizer.speak(Utterance)
        }
        
    }

    
    @IBAction func pauseBtn(_ sender: Any) {
        synthesizer.pauseSpeaking(at: .immediate)
    }
    
    @IBAction func continueBtn(_ sender: Any) {
        synthesizer.continueSpeaking()
    }
    
}

