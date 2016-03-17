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
    let kernelsTableView = KernelsTableView()
    let kernelDetailView = KernelDetailView()
    let convolutionImageViewer = ConvolutionImageViewer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
   
        view.addSubview(kernelsTableView)
        view.addSubview(kernelDetailView)
        view.addSubview(convolutionImageViewer)
        
        kernelsTableView.addTarget(self, action: "kernelSelectionChange",
            forControlEvents: .ValueChanged)
    }
    
    func kernelSelectionChange()
    {
        kernelDetailView.weights = kernelsTableView.weights
        convolutionImageViewer.weights = kernelsTableView.weights
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
            height: workspaceHeight).insetBy(dx: 5, dy: 0)
        
        if view.frame.width > view.frame.height
        {
            kernelDetailView.frame = CGRect(x: kernelsTableViewWidth,
                y: topMargin,
                width: workspaceWidth / 2,
                height: workspaceHeight).insetBy(dx: 5, dy: 0)
            
            convolutionImageViewer.frame = CGRect(x: kernelsTableViewWidth + workspaceWidth / 2,
                y: topMargin,
                width: workspaceWidth / 2,
                height: workspaceHeight).insetBy(dx: 5, dy: 0)
        }
        else
        {
            kernelDetailView.frame = CGRect(x: kernelsTableViewWidth,
                y: topMargin,
                width: workspaceWidth - kernelsTableViewWidth,
                height: workspaceHeight / 2).insetBy(dx: 5, dy: 5)
            
            convolutionImageViewer.frame = CGRect(x: kernelsTableViewWidth,
                y: topMargin + workspaceHeight / 2,
                width: workspaceWidth - kernelsTableViewWidth,
                height: workspaceHeight / 2).insetBy(dx: 5, dy: 5)
        }
    }

}

