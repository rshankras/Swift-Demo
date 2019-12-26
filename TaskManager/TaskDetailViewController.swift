//
//  TaskDetailViewController.swift
//  TaskManager
//
//  Created by Ravi Shankar on 12/07/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

import UIKit
import CoreData

class TaskDetailViewController: UIViewController {

    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    
    @IBOutlet var txtDesc: UITextField!
    
    var task: Tasks? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if task != nil {
            txtDesc.text = task?.desc
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK:- IBActions
    
    
    @IBAction func done(sender: AnyObject) {
        if task != nil {
            editTask()
        } else {
            createTask()
        }
        dismissViewController()
    }
    
    @IBAction func cancel(sender: AnyObject) {
         dismissViewController()
    }
    
    // MARK:- Dismiss ViewControllers
    
    func dismissViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK:- Create task
    
    func createTask() {
        let entityDescripition = NSEntityDescription.entity(forEntityName: "Tasks", in: managedObjectContext)
        let task = Tasks(entity: entityDescripition!, insertInto: managedObjectContext)
        task.desc = txtDesc.text!
        do {
            try managedObjectContext.save()
        } catch _ {
        }
    }
    
    // MARK:- Edit task
    
    func editTask() {
        task?.desc = txtDesc.text!
        do {
            try managedObjectContext.save()
        } catch _ {
        }
    }
    
}
