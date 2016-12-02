//
//  data.swift
//  greThesaurus
//
//  Created by Ding Zhang on 12/2/16.
//  Copyright © 2016 kelu2zhao102. All rights reserved.
//

import Foundation


struct Question {
    let prompt:String
    let option:[String]
    let solutionIndex: Int

}

var questions = [
    Question(prompt: "What is ____", option: ["life","life2","life3","life4"], solutionIndex: 1),
    
    Question(prompt: "What is ____", option: ["life","life2","life3","life4"], solutionIndex: 1),
    
    Question(prompt: "What is ____", option: ["life","life2","life3","life4"], solutionIndex: 1)]
