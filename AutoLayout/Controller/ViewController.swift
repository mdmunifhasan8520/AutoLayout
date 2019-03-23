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
    
    //for correct answer
    var answerString: String = " "
    var answerDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
    var someSet = Array<Character>()
//    var arrCharacters = [Array<Character>]()
    
    
    //for hints alphabet
    var randomDict = [Int:String]()
    var keepingCurrent:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
    
    
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var fourthImageView: UIImageView!
    
    @IBOutlet weak var answerCollectionView: UICollectionView!
    @IBOutlet weak var hintsCollectionView: UICollectionView!
    
    
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
        
        hintsCollectionView?.delegate = self
        hintsCollectionView?.dataSource = self
        
            answerString = firstQuestion.answerText

            let characters = Array(answerString)
            for i in 0..<(answerString.count) {
                
                someSet.append(characters[i])
                answerDict.updateValue(String(characters[i]), forKey: i)
        
            
        }
        
        func randomAlphaNumericString(length: Int) -> String {
            let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
            let allowedCharsCount = UInt32(allowedChars.characters.count)
            var randomString = ""
        
            for _ in 0..<length {
                let randomNum = Int(arc4random_uniform(allowedCharsCount))
                let randomIndex = allowedChars.index(allowedChars.startIndex, offsetBy: randomNum)
                let newCharacter = allowedChars[randomIndex]
                randomString += String(newCharacter)
                randomString = randomString.uppercased()
            }
        
            return randomString
        }
        
        //for length counter
        var randomAlphabet = randomAlphaNumericString(length: 16 - answerString.count)
        //hints label alphabet
        randomAlphabet += answerString
        
        var randomcharacters = Array(randomAlphabet)
        print(randomcharacters)
        var indexArray = Array(randomcharacters.indices)
        var index = indexArray.endIndex
        
        //randomize the string
        let indexIterator: AnyIterator<Int> = AnyIterator {
            guard let nextIndex = indexArray.index(index, offsetBy: -1, limitedBy: indexArray.startIndex)
                else { return nil }
            
            index = nextIndex
            let randomIndex = Int(arc4random_uniform(UInt32(index)))
            if randomIndex != index {
                indexArray.swapAt(randomIndex, index)
            }
            
            return indexArray[index]
        }
        
        let newRandomArray = indexIterator.map { randomcharacters[$0] }
        //print(newArray)
        
        
        for i in 0..<(newRandomArray.count) {
            
           // someSet.append(characters[i])
            randomDict.updateValue(String(newRandomArray[i]), forKey: i)
            
            
        }
        
        print(randomDict)
//        randomDict.sorted { $0 < $1 }
//        print("another \(randomDict)")
        
        
//        keepingCurrent = someDict.merging(randomDict) { current, _ in current }
//        //keepingCurrent = someDict.merging(randomDict) { (current, _) in current }
//        print("keeping old\(keepingCurrent)")
//        let filtereed = randomDict.values.filter{ $0 == answerString}
//        print("filter\(filtereed)")
//     keepingCurrent = someDict.merging(filtereed) { current, _ in current }
//        print("keeping old\(keepingCurrent)")
     
    }
    

}

//answer collectionView

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! answerCell
        
        if collectionView == self.answerCollectionView {
            return answerString.count
        } else {
            return 16
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
     
            if collectionView == self.answerCollectionView {
                let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! answerCell
                cell1.answerButton.setTitle(answerDict[indexPath.row], for: .normal)
                cell1.answerButton.setBackgroundImage(UIImage(named: "letter"), for: .normal)
                
                return cell1
                
            } else {
                let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "HINTS", for: indexPath) as! hintsCell
                cell2.hintsButton.setTitle(randomDict[indexPath.row], for: .normal)
                cell2.hintsButton.setBackgroundImage(UIImage(named: "letter"), for: .normal)
                return cell2
            }
       
    }
    
}


//hints collectionView


