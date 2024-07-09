//
//  ViewController.swift
//  DemoQuizAndLayoutProject
//
//  Created by sahinbekir on 9.07.2024.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    //buttons
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    var timer = Timer()
    var totalTime = 100
    var secondsPassed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        timer.invalidate()
        secondsPassed = 0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
        
    }

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        if quizBrain.gameover < quizBrain.quiz.count + 1 {
            questionLabel.text = quizBrain.getQuestionText()
            
            //Need to fetch the answers and update the button titles using the setTitle method.
            let answerChoices = quizBrain.getAnswers()
            choice1.setTitle(answerChoices[0], for: .normal)
            choice2.setTitle(answerChoices[1], for: .normal)
            choice3.setTitle(answerChoices[2], for: .normal)
            choice4.setTitle(answerChoices[3], for: .normal)
            
            progressBar.progress = quizBrain.getProgress()
            scoreLabel.text = "Score: \(quizBrain.getScore())/\(quizBrain.quiz.count)"
            
            
            choice1.backgroundColor = UIColor.clear
            choice2.backgroundColor = UIColor.clear
            
            //Third button needs to be reset too.
            choice3.backgroundColor = UIColor.clear
            choice4.backgroundColor = UIColor.clear
            }
        else {
            if quizBrain.questionNumber == 0 {
                scoreLabel.text = "Score:\(quizBrain.getScore())/\(quizBrain.quiz.count)"
                progressBar.progress = quizBrain.getProgress()
                timeLabel.text = "Time: \(secondsPassed)"
                timer.invalidate()
            }
            questionLabel.text = " All questions done..."
            choice1.setTitle("A", for: .normal)
            choice2.setTitle("B", for: .normal)
            choice3.setTitle("C", for: .normal)
            choice4.setTitle("D", for: .normal)
            choice1.backgroundColor = UIColor.clear
            choice2.backgroundColor = UIColor.clear
            
            //Third button needs to be reset too.
            choice3.backgroundColor = UIColor.clear
            choice4.backgroundColor = UIColor.clear
            }
        
        
    }
    
    @objc func updateTimer() {
            if secondsPassed < totalTime {
                secondsPassed += 1
                timeLabel.text = "Time: \(secondsPassed)"
            } else {
                timer.invalidate()
                timeLabel.text = "Time OVER"
            }
        }

}

