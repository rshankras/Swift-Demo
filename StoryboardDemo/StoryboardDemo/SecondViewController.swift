//
//  DetailViewController.swift
//  StoryboardDemo
//
//  Created by Ravi Shankar on 24/02/16.
//  Copyright © 2016 Ravi Shankar. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var studentName: String?
    var message: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = studentName {
            nameLabel.text = name
            message = "Success"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
