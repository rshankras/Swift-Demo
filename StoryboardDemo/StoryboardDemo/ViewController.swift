//
//  ViewController.swift
//  StoryboardDemo
//
//  Created by Ravi Shankar on 24/02/16.
//  Copyright © 2016 Ravi Shankar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier  ==   "detail"   {
            let  childViewController  =  segue.destination  as? SecondViewController
            childViewController?.studentName  =  nameTextField.text
        }
    }
    
    @IBAction func nonSegueCall(sender: AnyObject) {
        let childViewContoller  =
            storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        childViewContoller . studentName  =  nameTextField.text
        present( childViewContoller ,  animated: true ,  completion: nil)
    }
    
    @IBAction func cancel(segue:UIStoryboardSegue) {
        if segue.source .isKind(of: SecondViewController.self) {
            let controller = segue.source as? SecondViewController
            print(controller?.message ?? "")
        }
    }
}

