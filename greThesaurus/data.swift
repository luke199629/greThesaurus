//
//  data.swift
//  greThesaurus
//
//  Created by zhao yuanyuan on 12/2/16.
//  Copyright © 2016 kelu2zhao102. All rights reserved.
//

import Foundation


struct Question {
    let prompt:String
    let option:[String]
    let solutionIndex: Int

}

var questions = [
    Question(prompt: "Many find it strange that her writing is thought to be tortuous; her recent essays, although longer than most of her earlier essays, are extremely _____.", option: ["painstaking","tedious","insightful","sophisticated"], solutionIndex: 1),
    
    Question(prompt: "Most spacecraft are still at little risk of collision with space debris during their operational lifetimes, but given the numbers of new satellites launched each year, the orbital environment in the future is likely to be less _____", option: ["crowded","invulnerable","protected","polluted"], solutionIndex: 1),
    
    Question(prompt: "The author presents the life of Zane Grey with a(n) _____ unusual in a biographer: he is not even convinced that Grey was a good writer.", option: ["zeal","deftness","detachment","imaginativeness"], solutionIndex: 1),

    Question(prompt: "The slower-learning monkeys searched _____ but unintelligently: although they worked closely together, they checked only the most obvious hiding places", option: ["competitively","impulsively","harmoniously","deviously"], solutionIndex: 1),

    Question(prompt: "By about age eight, children’s phonetic capacities are fully developed but still _____; thus children at that age can learn to speak a new language with a native speaker’s accent.", option: ["vestigial","inarticulate","unformed","nascent"], solutionIndex: 1),

    Question(prompt: "In medieval philosophy every physical phenomenon is presumed to have some determinate cause, leaving no place for _____ in the explanation of particular events.", option: ["happenstance","chance","experience","miscalculation"], solutionIndex: 1),
    
    Question(prompt: "Although the film is rightly judged imperfect by most of today’s critics, the films being created today are _____ it, since its release in 1940 provoked sufficient critical discussion to enhance the intellectual respectability of cinema considerably.", option: ["beholden to","indebted to","derivative of","based on"], solutionIndex: 1),

    Question(prompt: "The detective’s conviction that there were few inept crimes in her district led her to impute some degree of _____ to every suspect she studied.", option: ["deceit","acumen","shrewdness","duplicity"], solutionIndex: 1)]


