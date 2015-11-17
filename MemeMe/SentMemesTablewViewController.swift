//
//  SentMemesTablewViewController.swift
//  MemeMe_v1
//
//  Created by Elva Cabrera on 11/15/15.
//  Copyright © 2015 elvacabrera. All rights reserved.
//

import UIKit

class SentMemesTableViewController: UITableViewController {
    
    var memes: [Meme]! {
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView!.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeCollectionCell", forIndexPath: indexPath) as! SentMemesTableViewController
        
        
        let meme = memes[indexPath.row]
        
        cell.memeTextLabel?.text = "\(meme.topText)...\(meme.bottomText)"
        cell.memeImageView?.image = meme.memedImage
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let memeDetailVC = storyboard!.instantiateViewControllerWithIdentifier("SentMemesTableViewController") as! MemeDetailViewController
        memeDetailVC.meme = memes[indexPath.row]
        navigationController?.pushViewController(memeDetailVC, animated: true)
    }
    
    
}
