//
//  KernelDetailView.swift
//  CoreImageConvolutionExplorer
//
//  Created by Simon Gladman on 17/03/2016.
//  Copyright © 2016 Simon Gladman. All rights reserved.
//

import UIKit

class KernelDetailView: UIView
{
    let labels: [UIView] =
    {
        var array = [UIView]()
        
        for _ in 0 ..< 49
        {
            array.append(UIView())
        }
        
        return array
    }()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        labels.forEach
        {
            // $0.text = "\(drand48() * 10)"

            $0.backgroundColor = UIColor.redColor()
            addSubview($0)
        }
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews()
    {
        let boxSide = Int(min(frame.width, frame.height) / 7)
        let boxesTop = (Int(max(frame.width, frame.height)) - (boxSide * 7)) / 2

        labels.enumerate().forEach
        {
            let x = $0 % 7
            let y = $0 / 7
            
            $1.frame = CGRect(x: x * boxSide,
                y: boxesTop + y * boxSide,
                width: boxSide,
                height: boxSide).insetBy(dx: 0.5, dy: 0.5)
        }
    }
}
