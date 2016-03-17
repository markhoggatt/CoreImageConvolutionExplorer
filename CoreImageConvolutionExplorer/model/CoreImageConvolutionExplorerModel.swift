//
//  CoreImageConvolutionExplorerModel.swift
//  CoreImageConvolutionExplorer
//
//  Created by Simon Gladman on 17/03/2016.
//  Copyright © 2016 Simon Gladman. All rights reserved.
//

import CoreGraphics

struct Kernel
{
    let name: String
    let weights: [CGFloat]
}

struct CoreImageConvolutionExplorerModel
{
    let kernels = [
        Kernel(name: "3 x 3 Box Blur", weights: [1,1,1,  1,1,1,  1,1,1]),
        Kernel(name: "3 x 3 Sharpen", weights: [0,-1,0,  -1,5,-1,  0,-1,0]),
        Kernel(name: "3 x 3 Edge Detect", weights: [0,1,0,  1,4,1,  0,1,0]),
        Kernel(name: "3 x 3 Emboss", weights: [-2,-1,0,  -1,1,1,  0,1,2]),
        
        Kernel(name: "5 x 5 Box Blur", weights: [1,1,1,1,1,  1,1,1,1,1,  1,1,1,1,1,  1,1,1,1,1,  1,1,1,1,1]),
        
        Kernel(name: "7 x 7 Box Blur", weights: [1,1,1,1,1,1,1,  1,1,1,1,1,1,1,  1,1,1,1,1,1,1,  1,1,1,1,1,1,1,  1,1,1,1,1,1,1,  1,1,1,1,1,1,1,  1,1,1,1,1,1,1,]),
        
        ].sort({$0.name < $1.name})
}
