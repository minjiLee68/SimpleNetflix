//
//  PlayerViewController.swift
//  SimpleNetflix
//
//  Created by 이민지 on 2022/02/07.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var playerView: PlayerView!
    @IBOutlet weak var controlView: UIView!
    @IBOutlet weak var playButton: UIButton!
    
    let player = AVPlayer()
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        playerView.player = player
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        play()
    }
    
    @IBAction func togglePlaybutton(_ sender: Any) {
        if player.isplaying {
            pause()
        } else {
            play()
        }
    }
    
    func play() {
        player.play()
        playButton.isSelected = true
    }
    
    func pause() {
        player.pause()
        playButton.isSelected = false
    }
    
    func reset() {
        pause()
        player.replaceCurrentItem(with: nil)
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        reset()
        dismiss(animated: false, completion: nil)
    }
}

extension AVPlayer {
    var isplaying: Bool {
        guard self.currentItem != nil else { return false }
        return self.rate != 0 
    }
}
