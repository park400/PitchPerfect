//
//  ViewController.swift
//  NanoDgreePractice
//
//  Created by Minwoo Park on 5/10/17.
//  Copyright © 2017 MWdev. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

 
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopButton.isEnabled=false
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewWillApper Called")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func recordAudio(_ sender: Any) {
        print("Record button clicked")
        recordingLabel.text = "Recording in Progress"
        stopButton.isEnabled = true
        recordButton.isEnabled = false
    }
    @IBAction func stopAudio(_ sender: Any) {
        print("Recording Stopped")
        recordingLabel.text = "Tap to Record"
        recordButton.isEnabled = true
        stopButton.isEnabled = false
    }

}

 
