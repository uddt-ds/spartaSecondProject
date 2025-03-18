//
//  BaseballGame.swift
//  spartaSecondProject
//
//  Created by Lee on 3/18/25.
//

import Foundation


/*
 1. Lv1
    - 1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다
     - 정답은 랜덤으로 만듭니다.(1에서 9까지의 서로 다른 임의의 수 3자리)

 2. Lv2
    - 정답을 맞추기 위해 3자리수를 입력하고 힌트를 받습니다
    - 힌트는 야구용어인 **볼**과 **스트라이크**입니다.
    - 같은 자리에 같은 숫자가 있는 경우 **스트라이크**, 다른 자리에 숫자가 있는 경우 **볼**입니다
    - ex) 정답 : 456 인 경우
         - 435를 입력한 경우 → 1스트라이크 1볼
         - 357를 입력한 경우 → 1스트라이크
         - 678를 입력한 경우 → 1볼
         - 123를 입력한 경우 → Nothing
    - 만약 올바르지 않은 입력값에 대해서는 오류 문구를 보여주세요
    - 3자리 숫자가 정답과 같은 경우 게임이 종료됩니다
 */

class BaseballGame {
    func start() {
        print("게임을 시작합니다")
        makeAnswer() // 정답을 만드는 함수
        print("서로 다른 숫자 3개를 입력해주세요(범위: 1 ~ 9, 예: 356)", terminator: "")
    }

    func makeAnswer() -> Int {
        let randomNumber1 = Int.random(in: 1...9)
        var randomNumber2 = Int.random(in: 1...9)
        var randomNumber3 = Int.random(in: 1...9)

        while randomNumber1 == randomNumber2 || randomNumber1 == randomNumber3 || randomNumber2 == randomNumber3 {
            randomNumber2 = Int.random(in: 1...9)
            randomNumber3 = Int.random(in: 1...9)
        }

        let computerChoice = [randomNumber1, randomNumber2, randomNumber3]

        let strComputerChoice = computerChoice.map(String.init).joined()  // ["5", "6", "7"]
        guard let intComputerChoice = Int(strComputerChoice) else { return 0 }
        return intComputerChoice // 567
    }
}

