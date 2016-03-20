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
        
        Kernel(name: "3 x 3 Identity", weights: [
            0,0,0,
            0,1,0,
            0,0,0]),
        
        Kernel(name: "3 x 3 Box Blur", weights: [
            1,1,1,
            1,1,1,
            1,1,1]),
        
        Kernel(name: "3 x 3 Sharpen", weights: [
             0, -1,  0,
            -1,  5, -1,
             0, -1,  0
            ]),
        
        Kernel(name: "3 x 3 Sharper", weights: [
            -1,-1,-1,
            -1, 9,-1,
            -1,-1,-1
            ]),
        
        Kernel(name: "3 x 3 Sharpest", weights: [
            1,  1, 1,
            1, -7, 1,
            1,  1, 1
            ]),
        
        Kernel(name: "3 x 3 Edge Detect", weights: [
            -1,-1,-1,
            -1, 8,-1,
            -1,-1,-1
            ]),
        
        Kernel(name: "3 x 3 Emboss", weights: [
            -2, -1, 0,
            -1,  1, 1,
             0,  1, 2]),
        
        Kernel(name: "3 x 3 Emboss (2)", weights: [
            2,  0, 0,
            0, -1, 0,
            0, 0, -1]),
        
        Kernel(name: "3 x 3 Sobel x", weights: [
            -1, 0, 1,
            -2, 0, 2,
            -1, 0, 1]),
        
        Kernel(name: "3 x 3 Sobel y", weights: [
            -1, -2, -1,
             0,  0,  0,
             1,  2,  1]),

        Kernel(name: "5 x 5 Box Blur", weights: [
            1,1,1,1,1,
            1,1,1,1,1,
            1,1,1,1,1,
            1,1,1,1,1,
            1,1,1,1,1]),
        
        Kernel(name: "5 x 5 Bias Demo Emboss (zero)", weights: [
            5,5,5,5,5,
            5,0,0,0,-5,
            5,0,0,0,-5,
            5,0,0,0,-5,
            -5,-5,-5,-5,-5
            ]),
        
        Kernel(name: "5 x 5 Bias Demo Emboss (+ve)", weights: [
            5,5,5,5,5,
            5,0,0,0,-5,
            5,0,0,0,-5,
            5,0,0,0,-5,
            5,-5,-5,-5,-5
            ]),

        Kernel(name: "5 x 5 Gaussian Blur", weights: [
             1,  4,  7,  4, 1,
             4, 16, 26, 16, 4,
             7, 26, 41, 26, 7,
             4, 16, 26, 16, 4,
             1,  4,  7,  4, 1
            ]),
        
        Kernel(name: "5 x 5 Laplacian of Gaussian", weights: [
             0,  0, -1,  0,  0,
             0, -1, -2, -1,  0,
            -1, -2, 16, -2, -1,
             0, -1, -2, -1,  0,
             0,  0, -1,  0,  0
            ]), 

        Kernel(name: "5 x 5 Emboss", weights: [
            -1, -1, -1, -1, 0,
            -1, -1, -1,  0, 1,
            -1, -1,  0,  1, 1,
            -1,  0,  1,  1, 0,
             0,  1,  1,  1, 1
            ]),
        
        Kernel(name: "5 x 5 Unsharp", weights: [
            1, 4, 6, 4, 1,
            4, 16, 24, 16, 4,
            6, 24, -476, 24, 6,
            4, 16, 24, 16, 4,
            1, 4, 6, 4, 1,
            ]),
        
        Kernel(name: "5 x 5 Sharpen", weights: [
            -1, -1, -1, -1, -1,
            -1,  2,  2,  2, -1,
            -1,  2,  8,  2, -1,
            -1,  2,  2,  2, -1,
            -1, -1, -1, -1, -1
            ]),
        
        Kernel(name: "5 x 5 Sobel x", weights: [
            -1, -2, 0, 2, 1,
            -4, -8, 0, 8, 4,
            -6, -12, 0, 12, 6,
            -4, -8, 0, 8, 4,
            -1, -2, 0, 2, 1,
            ]),
        
        Kernel(name: "5 x 5 Sobel y", weights: [
            -1, -4, -6, -4, -1,
            -2, -8, -12, -8, -2,
            0, 0, 0, 0, 0,
            2, 8, 12, 8, 2,
            1, 4, 6, 4, 1
            ]),
        
        Kernel(name: "7 x 7 Box Blur", weights: [
            1,1,1,1,1,1,1,
            1,1,1,1,1,1,1,
            1,1,1,1,1,1,1,
            1,1,1,1,1,1,1,
            1,1,1,1,1,1,1,
            1,1,1,1,1,1,1,
            1,1,1,1,1,1,1]),
        
        Kernel(name: "7 x 7 Edge Detect", weights: [
             0,  0, -1, -1, -1,  0,  0,
             0, -1, -3, -3, -3, -1,  0,
            -1, -3,  0,  7,  0, -3, -1,
            -1, -3,  7, 25,  7, -3, -1,
            -1, -3,  0,  7,  0, -3, -1,
             0, -1, -3, -3, -3, -1,  0,
             0,  0, -1, -1, -1,  0,  0
            ]),
        
        Kernel(name: "7 x 7 Gaussian Blur", weights: [
            0, 0, 0, 5, 0, 0, 0,
            0, 5, 18, 32, 18, 5, 0,
            0, 18, 64, 100, 64, 18, 0,
            5, 32, 100, 100, 100, 32, 5,
            0, 18, 64, 100, 64, 18, 0,
            0, 5, 18, 32, 18, 5, 0,
            0, 0, 0, 5, 0, 0, 0
            ])
 
        
        ].sort({$0.name < $1.name})
}
