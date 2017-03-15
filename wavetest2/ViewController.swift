//
//  ViewController.swift
//  wavetest2
//
//  Created by Alexey Savchenko on 11.03.17.
//  Copyright © 2017 SuddenlyPancakes. All rights reserved.
//

import UIKit
import SCWaveformView


class ViewController: UIViewController, AVAudioPlayerDelegate {
  
  @IBOutlet weak var playButton: UIButton!
  @IBOutlet weak var waveForm: SCWaveformView!
  
  var player: AVAudioPlayer!
  
  @IBOutlet weak var plot: Plot!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    plot.populateWithBars(numberOfBars: 256)
    
    let assetURL = Bundle.main.url(forResource: "Ed Sheeran - Thinking Out Loud (Capital FM Session)", withExtension: "mp3")!
    
    waveForm.asset = AVAsset(url: assetURL)
    waveForm.normalColor = UIColor.cyan
    waveForm.progressColor = UIColor.orange
    waveForm.alpha = 0.8
    waveForm.precision = 0.5
    waveForm.lineWidthRatio = 0.7
    waveForm.backgroundColor = UIColor.clear
    
    do{
      
      player = try AVAudioPlayer(contentsOf: assetURL)
      player.delegate = self
      
    } catch {
      print("Error occured during player init \n")
      print(error)
    }
    let timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateWaveForm), userInfo: nil, repeats: true)
    
  }
  
  
  @IBAction func playButtonTap(_ sender: UIButton) {
    
    if player.isPlaying{
      
      playButton.setImage(UIImage(named: "play"), for: .normal)
      
      player.pause()
      
    } else {
      
      playButton.setImage(UIImage(named: "pause"), for: .normal)
      
      player.play()
      
    }
    
  }
  
  func updateWaveForm() {
    
    
    waveForm.progressTime = CMTimeMakeWithSeconds(player.currentTime, Int32(player.duration))
    
  }
  
  func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
    
    playButton.setImage(UIImage(named: "play"), for: .normal)

  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    self.touchesMoved(touches, with: event)
    
    if player.isPlaying {
      
      playButton.setImage(UIImage(named: "play"), for: .normal)
      
      player.pause()
      
    }
    
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    if let touch = event?.touches(for: self.waveForm)?.first{
      
      let position = touch.location(in: self.waveForm).x
      
      if Float64((position / self.waveForm.frame.width) * 100) < 100 && Float64((position / self.waveForm.frame.width) * 100) > 0 {
        
        waveForm.progressTime = CMTimeMakeWithSeconds(Float64(((position / self.waveForm.frame.width) * 100) * 0.9),
                                                      Int32(player.duration))
        
      }
      
    }
    
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    let seconds = CMTimeGetSeconds(waveForm.progressTime)
    
    player.currentTime = seconds
//    playButton.setImage(UIImage(named: "pause"), for: .normal)
//    
//    player.play()
    
  }
  
  
}

