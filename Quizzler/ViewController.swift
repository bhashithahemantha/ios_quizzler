//
//  ViewController.swift
//  Quizzler
//
//  Created by bhashitha hemantha on 11/23/17.
//  Copyright © 2017 bhashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    var score: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
        
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            pickedAnswer = true
        }else if sender.tag == 2{
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber += 1
        nextQuestion()
  
    }
    
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber+1)/13"
        progressBar.frame.size.width = (view.frame.size.width/13 * CGFloat(questionNumber+1))
      
    }
    

    func nextQuestion() {
        
        if questionNumber < 12{
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        }else{
            let alert = UIAlertController(title: "Great...", message: "you finished the quiz...do yuo want to start again...?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {
                (UIAlertAction) in
                self.startOver()
                self.score = 0
                //self.scoreLabel.text = "Score: \(self.score)"
            })
            
            alert.addAction(restartAction)//append the alert to action
            present(alert, animated: true, completion: nil)//present the action
        }
                        
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        if pickedAnswer == correctAnswer{
            ProgressHUD.showSuccess("correct")
            score += 1
        }else{
            ProgressHUD.showError("incorrect")
        }
        
    }
    
    
    func startOver() {
        
        questionNumber = 0
        nextQuestion()
       
    }
    

    
}
