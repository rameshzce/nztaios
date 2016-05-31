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
    var loadingIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
    let playbackLikelyToKeepUpContext = UnsafeMutablePointer<(Void)>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blackColor()
        
        // An AVPlayerLayer is a CALayer instance to which the AVPlayer can
        // direct its visual output. Without it, the user will see nothing.
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        view.layer.insertSublayer(avPlayerLayer, atIndex: 0)
        
        view.addSubview(invisibleButton)
        invisibleButton.addTarget(self, action: #selector(PlayVideoViewController.invisibleButtonTapped), forControlEvents: UIControlEvents.TouchUpInside)
        
        let url = NSURL(string: "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8");
        let playerItem = AVPlayerItem(URL: url!)
        avPlayer.replaceCurrentItemWithPlayerItem(playerItem)
        
        let timeInterval: CMTime = CMTimeMakeWithSeconds(1.0, 10)
        timeObserver = avPlayer.addPeriodicTimeObserverForInterval(timeInterval, queue: dispatch_get_main_queue()) {
            (elapsedTime: CMTime) -> Void in
            NSLog("elapsedTime now %f", CMTimeGetSeconds(elapsedTime));
        }
        
        timeObserver = avPlayer.addPeriodicTimeObserverForInterval(timeInterval,
                                                                   queue: dispatch_get_main_queue()) { (elapsedTime: CMTime) -> Void in
                                                                    
                                                                    // NSLog("elapsedTime now %f", CMTimeGetSeconds(elapsedTime));
                                                                    self.observeTime(elapsedTime)
        }
        
        timeRemainingLabel.textColor = UIColor.whiteColor()
        view.addSubview(timeRemainingLabel)
        
        view.addSubview(seekSlider)
        seekSlider.addTarget(self, action: #selector(PlayVideoViewController.sliderBeganTracking),
                             forControlEvents: UIControlEvents.TouchDown)
        seekSlider.addTarget(self, action: #selector(PlayVideoViewController.sliderEndedTracking),
                             forControlEvents: [UIControlEvents.TouchUpInside, UIControlEvents.TouchUpOutside])
        seekSlider.addTarget(self, action: #selector(PlayVideoViewController.sliderValueChanged),
                             forControlEvents: UIControlEvents.ValueChanged)
        
        seekSlider.addTarget(self, action: #selector(PlayVideoViewController.sliderValueChanged),
                             forControlEvents: UIControlEvents.ValueChanged)
        
        loadingIndicatorView.hidesWhenStopped = true
        view.addSubview(loadingIndicatorView)
        avPlayer.addObserver(self, forKeyPath: "currentItem.playbackLikelyToKeepUp",
                             options: NSKeyValueObservingOptions.New, context: playbackLikelyToKeepUpContext)

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
    
     override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if (context == playbackLikelyToKeepUpContext) {
            if (avPlayer.currentItem!.playbackLikelyToKeepUp) {
                loadingIndicatorView.stopAnimating()
            } else {
                loadingIndicatorView.startAnimating()
            }
        }
    }
    
    private func observeTime(elapsedTime: CMTime) {
        let duration = CMTimeGetSeconds(avPlayer.currentItem!.duration);
        if (isfinite(duration)) {
            let elapsedTime = CMTimeGetSeconds(elapsedTime)
            updateTimeLabel(elapsedTime, duration: duration)
        }
    }
    
    private func updateTimeLabel(elapsedTime: Float64, duration: Float64) {
        let timeRemaining: Float64 = CMTimeGetSeconds(avPlayer.currentItem!.duration) - elapsedTime
        timeRemainingLabel.text = String(format: "%02d:%02d", ((lround(timeRemaining) / 60) % 60), lround(timeRemaining) % 60)
    }
    
    deinit {
        avPlayer.removeTimeObserver(timeObserver)
        avPlayer.removeObserver(self, forKeyPath: "currentItem.playbackLikelyToKeepUp")
    }
    
    override func viewWillAppear(animated: Bool) {
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
        loadingIndicatorView.center = CGPoint(x: CGRectGetMidX(view.bounds), y: CGRectGetMidY(view.bounds))
    }
    
    func invisibleButtonTapped(sender: UIButton!) {
        let playerIsPlaying:Bool = avPlayer.rate > 0
        if (playerIsPlaying) {
            avPlayer.pause();
        } else {
            avPlayer.play();
        }
    }
    
    // Force the view into landscape mode (which is how most video media is consumed.)
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [.Landscape]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sliderBeganTracking(slider: UISlider!) {
        playerRateBeforeSeek = avPlayer.rate
        avPlayer.pause()
    }
    
    func sliderEndedTracking(slider: UISlider!) {
        let videoDuration = CMTimeGetSeconds(avPlayer.currentItem!.duration)
        let elapsedTime: Float64 = videoDuration * Float64(seekSlider.value)
        updateTimeLabel(elapsedTime, duration: videoDuration)
        
        avPlayer.seekToTime(CMTimeMakeWithSeconds(elapsedTime, 10)) { (completed: Bool) -> Void in
            if (self.playerRateBeforeSeek > 0) {
                self.avPlayer.play()
            }
        }
    }
    
    func sliderValueChanged(slider: UISlider!) {
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
