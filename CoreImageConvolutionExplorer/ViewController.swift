//
//  ViewController.swift
//  CoreImageConvolutionExplorer
//
//  Created by Simon Gladman on 17/03/2016.
//  Copyright © 2016 Simon Gladman. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    let mona = CIImage(image: UIImage(named: "monalisa.jpg")!)!
    
    let kernelsTableView = KernelsTableView()
    let kernelDetailView = KernelDetailView()
    let imageView = UIImageView(image: UIImage(named: "monalisa.jpg")!)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        kernelDetailView.backgroundColor = UIColor.lightGrayColor()
        
        view.addSubview(kernelsTableView)
        view.addSubview(kernelDetailView)
        view.addSubview(imageView)
    }
    
    override func viewDidLayoutSubviews()
    {
        let topMargin = topLayoutGuide.length
        let kernelsTableViewWidth = CGFloat(200)
        let workspaceWidth = view.frame.width - kernelsTableViewWidth
        let workspaceHeight = view.frame.height - topMargin
        
        kernelsTableView.frame = CGRect(x: 0,
            y: topMargin,
            width: kernelsTableViewWidth,
            height: workspaceHeight)
        
        kernelDetailView.frame = CGRect(x: kernelsTableViewWidth,
            y: topMargin,
            width: workspaceWidth / 2,
            height: workspaceHeight)
        
        imageView.frame = CGRect(x: kernelsTableViewWidth + workspaceWidth / 2,
            y: topMargin,
            width: workspaceWidth / 2,
            height: workspaceHeight)
    }

}

