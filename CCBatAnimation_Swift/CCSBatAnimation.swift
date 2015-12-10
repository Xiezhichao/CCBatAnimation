//
//  CCSBatAnimation.swift
//  Demo
//
//  Created by mmclick on 15/12/9.
//  Copyright © 2015年 MMC. All rights reserved.
//

import Foundation
import UIKit

class CCSBatAnimation: NSObject {
    
    /** 增加蝙蝠动画：加在哪个view，加多少数量 */
    class func addBatAnimation(tempView: UIView, andCount count: Int) -> Void {
        
        let image1 = UIImage(named: "cc_bat_bianfu1")
        let image2 = UIImage(named: "cc_bat_bianfu2")
        let image3 = UIImage(named: "cc_bat_bianfu3")
        let imageArr: [UIImage] = [image1!, image2!, image3!]
        
        let midW:Int = 30
        let viewWidth: Int  = Int(tempView.bounds.size.width)
        let viewHeight: Int = Int(tempView.bounds.size.height)
        for var index = 0; index < count; index++ {
            
            // 元素参数
            let startX = -Int(arc4random() % UInt32(viewWidth) + UInt32(midW));
            let startY = Int(arc4random() % UInt32(viewHeight - midW * 2) + UInt32(midW));
            let addX   = CGFloat(viewWidth * 2 + midW);
            let addY   = Bool(Int(arc4random() % UInt32(2))) ? CGFloat(arc4random() % UInt32(midW)) : -CGFloat(arc4random() % UInt32(midW));
            let batW   = Int(arc4random() % UInt32(midW) + 10);
            let time   = Float(arc4random() % 5) + 3.5;
            let alpha  = CGFloat(batW) * 0.01 + 0.5;
            
            // 图片动画
            let batImageView = UIImageView()
            batImageView.frame = CGRect(x: startX, y: startY, width: batW, height: batW)
            batImageView.image = image1
            batImageView.alpha = alpha
            batImageView.animationImages = imageArr
            batImageView.animationDuration = 0.5
            batImageView.startAnimating()
            tempView.addSubview(batImageView)
            
            // 位置移动
            let value1 = NSValue(CGPoint: batImageView.center)
            let value2 = NSValue(CGPoint: CGPoint(x: Int(batImageView.center.x + addX), y: Int(batImageView.center.y + addY)))

            CATransaction.begin()
            CATransaction.setCompletionBlock({ () -> Void in
                batImageView.removeFromSuperview()
            })
            let keyAnimation = CAKeyframeAnimation(keyPath: "position")
            keyAnimation.values   = [value1, value2]
            keyAnimation.duration = Double(time)
            keyAnimation.removedOnCompletion = false
            batImageView.layer.addAnimation(keyAnimation, forKey: "")
            CATransaction.commit()
        }
    }
}