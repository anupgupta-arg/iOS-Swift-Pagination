//
//  PlayVideoVC.swift
//  mediaPlayer
//
//  Created by Anup Gupta on 25/05/18.
//  Copyright © 2018 GeekGuns. All rights reserved.
//

import UIKit
import WebKit

import AVKit
import AVFoundation

import MobileCoreServices
class PlayVideoVC: UIViewController,UIWebViewDelegate, WKUIDelegate,AVPlayerViewControllerDelegate {

    @IBOutlet var webView: WKWebView!
    @IBOutlet var videoPlayerView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func videoPlay()
    {
//        https://youtu.be/112gAgi0giQ
        
        //https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4
        
        let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }
    override var shouldAutorotate: Bool {
        return true
    }
    @IBAction func playVideoButtonAction(_ sender: Any) {
        videoPlay()
    }
    
}
