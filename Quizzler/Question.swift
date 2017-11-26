//
//  Question.swift
//  Quizzler
//
//  Created by bhashitha hemantha on 11/25/17.
//  Copyright © 2017 bhashi. All rights reserved.
//

import Foundation

class Question {
    
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}

