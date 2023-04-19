//
//  ViewController.swift
//  WSBeforeAfterSliderSwift
//
//  Created by WebsoftProfession on 18/04/23.
//

import UIKit
import WSBeforeAfterSliderSwift

class ViewController: UIViewController {

    @IBOutlet var sliderControl: WSBeforeAfterView!
    @IBOutlet weak var btnPlay: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sliderControl.beforeImage = UIImage.init(named: "face_before.jpg")
        sliderControl.afterImage = UIImage.init(named: "face_after.jpg")
        sliderControl.sliderColor = .green
        sliderControl.playSpeed = 2.0
        
        // use below method to reload the view
        // sliderControl.prepare()
    }

    @IBAction func playPauseAction(_ sender: Any) {
        if sliderControl.isPlaying {
            btnPlay.setTitle("Play", for: .normal)
            sliderControl.pause()
        }
        else {
            btnPlay.setTitle("Pause", for: .normal)
            sliderControl.play()
        }
    }
}

