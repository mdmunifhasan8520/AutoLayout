//
//  ViewController.swift
//  AutoLayout
//
//  Created by MacBook Pro on 3/12/19.
//  Copyright © 2019 Code Drizzlers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var allQuestions = QuestionBank()

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var fourthImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let firstQuestion = allQuestions.list[0]
            firstImageView?.image = firstQuestion.questionImage[0]
            secondImageView?.image = firstQuestion.questionImage[1]
            thirdImageView?.image = firstQuestion.questionImage[2]
            fourthImageView?.image = firstQuestion.questionImage[3]
       
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

