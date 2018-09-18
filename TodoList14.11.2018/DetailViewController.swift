//
//  DetailViewController.swift
//  TodoList14.11.2018
//
//  Created by Dan Li on 03.09.18.
//  Copyright © 2018 DanStenLee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var deatlData:String!
    
    
    @IBOutlet weak var myTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
myTextView.text=deatlData
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
