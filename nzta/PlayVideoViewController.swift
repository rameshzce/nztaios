//
//  PlayVideoViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 28/05/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit
import AVKit
import MediaPlayer
import AVFoundation

class PlayVideoViewController: UIViewController {
    
    var avPlayer = AVPlayer()
    var avPlayerLayer: AVPlayerLayer!
    var invisibleButton = UIButton()
    var timeObserver: AnyObject!
    var timeRemainingLabel: UILabel = UILabel()
    
    var seekSlider = UISlider()
    var playerRateBeforeSeek: Float = 0.0
    var loadingIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    let playbackLikelyToKeepUpContext: UnsafeMutableRawPointer? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        // An AVPlayerLayer is a CALayer instance to which the AVPlayer can
        // direct its visual output. Without it, the user will see nothing.
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        view.layer.insertSublayer(avPlayerLayer, at: 0)
        
        view.addSubview(invisibleButton)
        invisibleButton.addTarget(self, action: #selector(PlayVideoViewController.invisibleButtonTapped), for: UIControlEvents.touchUpInside)
        
        let url = URL(string: "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8");
        let playerItem = AVPlayerItem(url: url!)
        avPlayer.replaceCurrentItem(with: playerItem)
        
        let timeInterval: CMTime = CMTimeMakeWithSeconds(1.0, 10)
        timeObserver = avPlayer.addPeriodicTimeObserver(forInterval: timeInterval, queue: DispatchQueue.main) {
            (elapsedTime: CMTime) -> Void in
            NSLog("elapsedTime now %f", CMTimeGetSeconds(elapsedTime));
        } as AnyObject!
        
        timeObserver = avPlayer.addPeriodicTimeObserver(forInterval: timeInterval,
                                                                   queue: DispatchQueue.main) { (elapsedTime: CMTime) -> Void in
                                                                    
                                                                    // NSLog("elapsedTime now %f", CMTimeGetSeconds(elapsedTime));
                                                                    self.observeTime(elapsedTime)
        } as AnyObject!
        
        timeRemainingLabel.textColor = UIColor.white
        view.addSubview(timeRemainingLabel)
        
        view.addSubview(seekSlider)
        seekSlider.addTarget(self, action: #selector(PlayVideoViewController.sliderBeganTracking),
                             for: UIControlEvents.touchDown)
        seekSlider.addTarget(self, action: #selector(PlayVideoViewController.sliderEndedTracking),
                             for: [UIControlEvents.touchUpInside, UIControlEvents.touchUpOutside])
        seekSlider.addTarget(self, action: #selector(PlayVideoViewController.sliderValueChanged),
                             for: UIControlEvents.valueChanged)
        
        seekSlider.addTarget(self, action: #selector(PlayVideoViewController.sliderValueChanged),
                             for: UIControlEvents.valueChanged)
        
        loadingIndicatorView.hidesWhenStopped = true
        view.addSubview(loadingIndicatorView)
        avPlayer.addObserver(self, forKeyPath: "currentItem.playbackLikelyToKeepUp",
                             options: NSKeyValueObservingOptions.new, context: playbackLikelyToKeepUpContext)

        // Do any additional setup after loading the view.
        
        /*let path: String = NSBundle.mainBundle().pathForResource("video1", ofType: "mp4")!
        let movieUrl: NSURL = NSURL.fileURLWithPath(path)
        let movie: AVPlayerViewController = AVPlayerViewController()
        movie.view.frame = self.view.bounds
        
        let player: AVPlayer = AVPlayer(URL: movieUrl)
        movie.player = player
        
        self.view.addSubview(movie.view)
        player.play()*/
    }
    
     override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (context == playbackLikelyToKeepUpContext) {
            if (avPlayer.currentItem!.isPlaybackLikelyToKeepUp) {
                loadingIndicatorView.stopAnimating()
            } else {
                loadingIndicatorView.startAnimating()
            }
        }
    }
    
    fileprivate func observeTime(_ elapsedTime: CMTime) {
        //let duration = CMTimeGetSeconds(avPlayer.currentItem!.duration);
        /*if (isFinite(duration)) {
            let elapsedTime = CMTimeGetSeconds(elapsedTime)
            updateTimeLabel(elapsedTime, duration: duration)
        }*/
    }
    
    fileprivate func updateTimeLabel(_ elapsedTime: Float64, duration: Float64) {
        let timeRemaining: Float64 = CMTimeGetSeconds(avPlayer.currentItem!.duration) - elapsedTime
        timeRemainingLabel.text = String(format: "%02d:%02d", ((lround(timeRemaining) / 60) % 60), lround(timeRemaining) % 60)
    }
    
    deinit {
        avPlayer.removeTimeObserver(timeObserver)
        avPlayer.removeObserver(self, forKeyPath: "currentItem.playbackLikelyToKeepUp")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadingIndicatorView.startAnimating()
        avPlayer.play() // Start the playback
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // Layout subviews manually
        avPlayerLayer.frame = view.bounds;
        invisibleButton.frame = view.bounds;
        
        invisibleButton.frame = view.bounds;
        let controlsHeight: CGFloat = 30
        let controlsY: CGFloat = view.bounds.size.height - controlsHeight;
        timeRemainingLabel.frame = CGRect(x: 5, y: controlsY, width: 60, height: controlsHeight)
        
        timeRemainingLabel.frame = CGRect(x: 5, y: controlsY, width: 60, height: controlsHeight)
        seekSlider.frame = CGRect(x: timeRemainingLabel.frame.origin.x + timeRemainingLabel.bounds.size.width,
                                  y: controlsY, width: view.bounds.size.width - timeRemainingLabel.bounds.size.width - 5, height: controlsHeight)
        loadingIndicatorView.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
    }
    
    func invisibleButtonTapped(_ sender: UIButton!) {
        let playerIsPlaying:Bool = avPlayer.rate > 0
        if (playerIsPlaying) {
            avPlayer.pause();
        } else {
            avPlayer.play();
        }
    }
    
    // Force the view into landscape mode (which is how most video media is consumed.)
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return [.landscape]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sliderBeganTracking(_ slider: UISlider!) {
        playerRateBeforeSeek = avPlayer.rate
        avPlayer.pause()
    }
    
    func sliderEndedTracking(_ slider: UISlider!) {
        let videoDuration = CMTimeGetSeconds(avPlayer.currentItem!.duration)
        let elapsedTime: Float64 = videoDuration * Float64(seekSlider.value)
        updateTimeLabel(elapsedTime, duration: videoDuration)
        
        avPlayer.seek(to: CMTimeMakeWithSeconds(elapsedTime, 10), completionHandler: { (completed: Bool) -> Void in
            if (self.playerRateBeforeSeek > 0) {
                self.avPlayer.play()
            }
        }) 
    }
    
    func sliderValueChanged(_ slider: UISlider!) {
        let videoDuration = CMTimeGetSeconds(avPlayer.currentItem!.duration)
        let elapsedTime: Float64 = videoDuration * Float64(seekSlider.value)
        updateTimeLabel(elapsedTime, duration: videoDuration)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
