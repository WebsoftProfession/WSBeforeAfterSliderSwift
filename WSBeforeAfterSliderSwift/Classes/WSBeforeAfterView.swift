//
//  WSBeforeAfterView.swift
//  WSBeforeAfterSliderSwift
//
//  Created by WebsoftProfession on 04/19/2023.
//  Copyright (c) 2023 WebsoftProfession. All rights reserved.
//
//

import UIKit

public class WSBeforeAfterView: UIView {

    public var beforeImage: UIImage?
    public var afterImage: UIImage?
    public var sliderColor: UIColor = .white
    public var playSpeed: CGFloat = 1.0
    public var isPlaying: Bool {
        return playTimer != nil
    }
    
    
    private var slider :UIView!
    private var isSliderTap: Bool = false
    private var isDragMode = false
    private var scaleRatio: CGFloat = 1
    
    private var playTimer :Timer?
    private var moveValue = 0.0 {
        didSet {
            if moveValue < 0 {
                isReverse = false
            }
            else if moveValue > self.bounds.size.width - 8.0 {
                isReverse = true
            }
        }
    }
    private var isReverse = false
    
    public override func draw(_ rect: CGRect) {
        
        if beforeImage == nil || afterImage == nil {
            return
        }
        
        beforeImage?.draw(in: rect)
        
        if slider == nil {
            scaleRatio = afterImage!.size.width / rect.size.width
            isSliderTap = false
            isDragMode = false
            slider = UIView.init(frame: CGRect(x: (rect.size.width/2)-4, y: self.bounds.origin.y, width: 8, height: rect.size.height))
            moveValue = (rect.size.width/2)-4
            slider.backgroundColor = sliderColor.withAlphaComponent(0.3)
            self.addSubview(slider)
            
            if let image = self.getImageForRect(rect: CGRect(x: 0, y: 0, width: slider.frame.origin.x*scaleRatio, height: afterImage!.size.height)) {
                image.draw(in: CGRect(x: 0, y: slider.frame.origin.y, width: slider.frame.origin.x, height: slider.frame.size.height))
            }
        }
        
        
        if isPlaying {
            if isReverse {
                moveValue -= playSpeed
            }
            else{
                moveValue += playSpeed
            }
            slider.frame = CGRect(x: moveValue, y: slider.frame.origin.y, width: 8, height: slider.frame.size.height);
        }
        
        if isDragMode {
            if let image = self.getImageForRect(rect: CGRect(x: 0, y: 0, width: slider.frame.origin.x*scaleRatio, height: afterImage!.size.height)) {
                image.draw(in: CGRect(x: 0, y: slider.frame.origin.y, width: slider.frame.origin.x, height: slider.frame.size.height))
            }
        }
    }
    
    public func prepare(){
        self.setNeedsDisplay()
    }
    
    public func play(){
        moveValue = slider.frame.origin.x
        if playTimer != nil {
            playTimer?.invalidate()
            playTimer = nil
        }
        playTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(handleTimer(timer:)), userInfo: nil, repeats: true)
    }
    
    public func pause(){
        isReverse = false
        if playTimer != nil {
            playTimer?.invalidate()
            playTimer = nil
        }
    }
    
    @objc private func handleTimer(timer: Timer) {
        isDragMode = true
        self.setNeedsDisplay()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchPoint = touch?.location(in: self)
        if slider.frame.contains(touchPoint ?? .zero) {
            isSliderTap = true
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isSliderTap {
            isDragMode = true;
            let touch = touches.first
            let touchPoint = touch?.location(in: self) ?? .zero
            if (touchPoint.x > self.bounds.origin.x - 4) && (touchPoint.x < self.frame.size.width - 4) {
                slider.frame = CGRect(x: touchPoint.x, y: slider.frame.origin.y, width: 8, height: slider.frame.size.height);
                self.setNeedsDisplay()
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDragMode = false
        isSliderTap = false
    }
    
    
    private func getImageForRect(rect: CGRect) -> UIImage? {
        if let imageRef:CGImage = afterImage!.cgImage!.cropping(to: rect) {
            let img:UIImage! = UIImage(cgImage: imageRef)
            return img
        }
        return nil
    }
}
