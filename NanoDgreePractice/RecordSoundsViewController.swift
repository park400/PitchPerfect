//
//  RecordSoundsViewController.swift
//  NanoDgreePractice
//
//  Created by Minwoo Park on 5/10/17.
//  Copyright © 2017 MWdev. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    var audioRecorder: AVAudioRecorder!
    
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
        
    }

    @IBAction func recordAudio(_ sender: Any) {
        changeButtonAndLabel(recordingStatus: "Recording in Progress", enablingRecordButton: false, enablingStopButton: true)
//        recordingLabel.text = "Recording in Progress"
//        stopButton.isEnabled = true
//        recordButton.isEnabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
       
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        
    }
    @IBAction func stopAudio(_ sender: Any) {
        changeButtonAndLabel(recordingStatus: "Tap to Record", enablingRecordButton: false, enablingStopButton: true)
//        recordingLabel.text = "Tap to Record"
//        recordButton.isEnabled = true
//        stopButton.isEnabled = false
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }

    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        
        if flag{
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        
        }else{ 
            print("Record Fail")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
    
    func changeButtonAndLabel(recordingStatus: String, enablingRecordButton: Bool, enablingStopButton: Bool){
        
        recordingLabel.text = recordingStatus
        recordButton.isEnabled = enablingRecordButton
        stopButton.isEnabled = enablingStopButton
        
    }
}

 
