//
//  BaseballGame.swift
//  spartaSecondProject
//
//  Created by Lee on 3/18/25.
//

import Foundation

class BaseballGame {
    var tryCount = 0

    func start() {
        let answer = makeAnswer()
        print("서로 다른 숫자 3개를 입력해주세요(범위: 1 ~ 9, 예: 356): ", terminator: "")
        while true {
            let userInput = getUserInput()
            if userInput == 0 {
                print("잘못된 입력입니다. 다시 입력해주세요: ",terminator: "")
            } else if userInput != 0 {
                let result = checkAnswer(computerChoice: answer, userChoice: userInput)
                print(result)

                if result == "정답입니다!" {
                    break
                } else {
                    print("다시 입력해주세요: ", terminator: "")
                }
            }
        }

    }

    func makeAnswer() -> Int {
        let randomNumber1 = Int.random(in: 1...9)
        var randomNumber2 = Int.random(in: 0...9)
        var randomNumber3 = Int.random(in: 0...9)

        while randomNumber1 == randomNumber2 || randomNumber1 == randomNumber3 || randomNumber2 == randomNumber3 {
            randomNumber2 = Int.random(in: 0...9)
            randomNumber3 = Int.random(in: 0...9)
        }

        let computerChoice = [randomNumber1, randomNumber2, randomNumber3]

        let strComputerChoice = computerChoice.map(String.init).joined()
        guard let intComputerChoice = Int(strComputerChoice) else { return 0 }
        return intComputerChoice
    }

    func getUserInput() -> Int {
        let userInput = readLine() ?? ""
        let ArrUserInput = Array(userInput)

        // 첫번째 index에 0 입력 시 예외처리 추가
        if ArrUserInput.first == "0" {
            return 0
        }
        // 중복되는 숫자 예외처리 추가
        let SetUserInput = Set(ArrUserInput)
        guard SetUserInput.count == 3 else { return 0 }

        guard let intUserInput = Int(userInput) else { return 0 }
        return intUserInput
    }

    func checkAnswer(computerChoice: Int, userChoice: Int) -> String {
        // int형인 숫자를 string으로 변경
        let computerChoice = String(computerChoice)
        let userChoice = String(userChoice)

        // string을 개별 String으로 배열에 저장
        let arrComputerChoice = Array(computerChoice)
        let arrUserChoice = Array(userChoice)

        var strikeCount = 0
        var ballCount = 0

        for (index1, value1) in arrComputerChoice.enumerated() {
            for (index2, value2) in arrUserChoice.enumerated() {
                if index1 == index2 && value1 == value2 {
                    strikeCount += 1
                } else if index1 != index2 && value1 == value2 {
                    ballCount += 1
                }
            }
        }

        if strikeCount == 0 && ballCount == 0 {
            tryCount += 1
            return "Nothing"
        }

        let result = (strikeCount, ballCount)

        switch result {
        case (3, 0):
            tryCount += 1
            return "정답입니다!"
        case (2, 0):
            tryCount += 1
            return "\(strikeCount)스트라이크"
        case (1, 0):
            tryCount += 1
            return "\(strikeCount)스트라이크"
        case (2, 1):
            tryCount += 1
            return "\(strikeCount)스트라이크, \(ballCount)볼"
        case (1, 1):
            tryCount += 1
            return "\(strikeCount)스트라이크, \(ballCount)볼"
        case (0, 3):
            tryCount += 1
            return "\(ballCount)볼"
        case (0, 2):
            tryCount += 1
            return "\(ballCount)볼"
        case (0, 1):
            tryCount += 1
            return "\(ballCount)볼"
        default:
            return "잘못된 입력입니다"
        }
    }
}
