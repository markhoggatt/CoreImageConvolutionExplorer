//
//  KernelsTableView.swift
//  CoreImageConvolutionExplorer
//
//  Created by Simon Gladman on 17/03/2016.
//  Copyright © 2016 Simon Gladman. All rights reserved.
//

import UIKit

class KernelsTableView: UIControl
{
    let model = CoreImageConvolutionExplorerModel()
    
    let tableView: UITableView =
    {
        let tableView = UITableView(frame: CGRectZero,
            style: UITableViewStyle.Plain)

        tableView.registerClass(UITableViewCell.self,
            forCellReuseIdentifier: "ItemRenderer")
        
        return tableView
    }()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        
        addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.reloadData()
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews()
    {
        tableView.frame = bounds; print(bounds)
    }
}

extension KernelsTableView: UITableViewDataSource
{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return model.kernels.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemRenderer",
            forIndexPath: indexPath)
     
        cell.textLabel?.text = model.kernels[indexPath.row].name
        
        return cell
    }
}

extension KernelsTableView: UITableViewDelegate
{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
    }
}