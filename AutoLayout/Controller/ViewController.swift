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
    
    var answerString: String = " "
    
   var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
    
    var someSet = Array<Character>()
    var arrCharacters = [Array<Character>]()
    
    
    //let characters = [Array<Any>]
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var fourthImageView: UIImageView!
    
    @IBOutlet weak var answerCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
            let firstQuestion = allQuestions.list[0]
        
            firstImageView?.image = firstQuestion.questionImage[0]
            secondImageView?.image = firstQuestion.questionImage[1]
            thirdImageView?.image = firstQuestion.questionImage[2]
            fourthImageView?.image = firstQuestion.questionImage[3]
        
        
        
        
        
            answerCollectionView?.delegate = self
            answerCollectionView?.dataSource = self
        
         answerString = firstQuestion.answerText
        
        let characters = Array(answerString)
        for i in 0..<(answerString.count) {
            
            someSet.append(characters[i])
            someDict.updateValue(String(characters[i]), forKey: i)
        
            
        }
        
       
        
        //arrCharacters.append(someSet)
        print(someDict)
        print(arrCharacters)
        print(someSet)
        
//        for data in 0..<(answerString.count - 1) {
//
//            someSet.append(characters[data])
//            someDict.updateValue(String(characters[data]), forKey: String(characters[data]))
//            //someDict.u
//
//        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! answerCell
        return answerString.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! answerCell
//        cell.answerLabel.text = someDict[indexPath.row]
//        cell.answerLabel.isHidden = true
        cell.answerButton.setTitle(someDict[indexPath.row], for: .normal)
        cell.answerButton.setBackgroundImage(UIImage(named: "letter"), for: .normal)
        
        //        print(cell.answerLabel.text)
        return cell
    }
    
    
    
}
