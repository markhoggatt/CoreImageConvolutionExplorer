//
//  ConvolutionImageViewer.swift
//  CoreImageConvolutionExplorer
//
//  Created by Simon Gladman on 17/03/2016.
//  Copyright © 2016 Simon Gladman. All rights reserved.
//

import UIKit
import GLKit

class ConvolutionImageViewer: UIView
{
    let mona = CIImage(image: UIImage(named: "monalisa.jpg")!)!
    
    let imageView = OpenGLImageView()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        addSubview(imageView)
        
        imageView.image = mona
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var weights: [CGFloat]?
    {
        didSet
        {
            if weights?.count != 9 && weights?.count != 25 && weights?.count != 49
            {
                fatalError("Weights array is wrong length!")
            }
            
            applyConvolutionKernel()
        }
    }
    
    func applyConvolutionKernel()
    {
        guard let weights = weights else
        {
            return
        }
        
        let filterName: String
        
        switch weights.count
        {
        case 9:
            filterName = "CIConvolution3X3"
        case 25:
            filterName = "CIConvolution5X5"
        default:
            filterName = "CIConvolution7X7"
        }
        
        let weightsVector: CIVector = CIVector(values: weights, count: weights.count)
        
        let finalImage = mona.imageByApplyingFilter(filterName, withInputParameters: [kCIInputWeightsKey: weightsVector])
        
        imageView.image = finalImage
    }
    
    override func layoutSubviews()
    {
        imageView.frame = bounds
        imageView.setNeedsDisplay()
    }
}


// ------------------------------------------------------

class OpenGLImageView: GLKView
{
    let eaglContext = EAGLContext(API: .OpenGLES2)
    
    lazy var ciContext: CIContext =
    {
        [unowned self] in
        
        return CIContext(EAGLContext: self.eaglContext,
            options: [kCIContextWorkingColorSpace: NSNull()])
    }()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame, context: eaglContext)
    
        context = self.eaglContext
        delegate = self
    }

    override init(frame: CGRect, context: EAGLContext)
    {
        fatalError("init(frame:, context:) has not been implemented")
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// The image to display
    var image: CIImage?
    {
        didSet
        {
            setNeedsDisplay()
        }
    }
}

extension OpenGLImageView: GLKViewDelegate
{
    func glkView(view: GLKView, drawInRect rect: CGRect)
    {
        guard let image = image else
        {
            return
        }
   
        let targetRect = image.extent.aspectFitInRect(
            target: CGRect(origin: CGPointZero,
                size: CGSize(width: drawableWidth,
                    height: drawableHeight)))
        
        let ciBackgroundColor = CIColor(
            color: backgroundColor ?? UIColor.whiteColor())
        
        ciContext.drawImage(CIImage(color: ciBackgroundColor),
            inRect: CGRect(x: 0,
                y: 0,
                width: drawableWidth,
                height: drawableHeight),
            fromRect: CGRect(x: 0,
                y: 0,
                width: drawableWidth,
                height: drawableHeight))
        
        ciContext.drawImage(image,
            inRect: targetRect,
            fromRect: image.extent)
    }
}

extension CGRect
{
    func aspectFitInRect(target target: CGRect) -> CGRect
    {
        let scale: CGFloat =
        {
            let scale = target.width / self.width
            
            return self.height * scale <= target.height ?
                scale :
                target.height / self.height
        }()
        
        let width = self.width * scale
        let height = self.height * scale
        let x = target.midX - width / 2
        let y = target.midY - height / 2
        
        return CGRect(x: x,
            y: y,
            width: width,
            height: height)
    }
}