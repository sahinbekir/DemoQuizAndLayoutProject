//
//  QuizBrain.swift
//  DemoQuizAndLayoutProject
//
//  Created by sahinbekir on 9.07.2024.
//

import Foundation

struct QuizBrain {
    var gameover = 0
    var questionNumber = 0
    var score = 0
    
    let quiz = [
        Question(q: "What is the capital of Turkey?", a: ["Bursa", "Edirne", "Istanbul", "Ankara"], correctAnswer: "Ankara"),
        Question(q: "What is the capital of Spain?", a: ["Malaga", "Madrid", "Barcelona", "Cadiz"], correctAnswer: "Madrid"),
        Question(q: "What is the capital of England?", a: ["London", "Cambridge", "Nottingham", "Brighton"], correctAnswer: "London"),
        Question(q: "What is the capital of Italy?", a: ["Rome", "Naples", "Milan", "Bologna"], correctAnswer: "Rome"),
        Question(q: "What is the capital of Germany?", a: ["Hamburg", "Munich", "Dortmund", "Berlin"], correctAnswer: "Berlin"),
        Question(q: "What is the capital of France?", a: ["Paris", "Lyon", "Marseille", "Lille"], correctAnswer: "Paris"),
        Question(q: "What is the capital of Portugal?", a: ["Porto", "Lisbon", "Braga", "Faro"], correctAnswer: "Lisbon"),
        Question(q: "What is the capital of Belgium?", a: ["Brussels", "Bruges", "Antwerp", "Liège"], correctAnswer: "Brussels"),
        Question(q: "What is the capital of Russia?", a: ["Sochi", "Kazan", "Moscow", "Saint Petersburg"], correctAnswer: "Moscow"),
        Question(q: "What is the capital of the Netherlands?", a: ["Utrecht", "Amsterdam", "Rotterdam", "Zwolle"], correctAnswer: "Amsterdam")
    ]

    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    //Need a way of fetching the answer choices.
    func getAnswers() -> [String] {
        return quiz[questionNumber].answers
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    mutating func getScore() -> Int {
        return score
    }
    
     mutating func nextQuestion() {
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            gameover = quiz.count + 1
        }
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        //Need to change answer to rightAnswer here.
        if userAnswer == quiz[questionNumber].rightAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
}

