//
//  main.swift
//  spartaSecondProject
//
//  Created by Lee on 3/17/25.
//

import Foundation

/*
 1. Lv1
     - [ ]  1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다
     - [ ]  정답은 랜덤으로 만듭니다.(1에서 9까지의 서로 다른 임의의 수 3자리)
 */

let randomNumber1 = Int.random(in: 1...9)
let randomNumber2 = Int.random(in: 1...9)
let randomNUmber3 = Int.random(in: 1...9)
var computerChoice: [Int] = []
computerChoice = [randomNumber1, randomNumber2, randomNUmber3]






