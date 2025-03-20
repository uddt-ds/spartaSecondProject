//
//  StartSet.swift
//  spartaSecondProject
//
//  Created by Lee on 3/20/25.
//

import Foundation

let game = BaseballGame()

class StartSet {
    enum SelectOption: String {
        case gameStart = "1"
        case printLog = "2"
        case gameFin = "3"
    }

    func setStart() {
        print("환영합니다! 원하시는 번호를 입력해주세요!: ", terminator: "")
        print("1. 게임 시작하기   2. 게임 기록 보기    3. 종료하기")

        while true {
            print("1. 게임 시작하기   2. 게임 기록 보기    3. 종료하기")

            let setNumber = readLine() ?? ""
            if let option = SelectOption(rawValue: setNumber) {
                switch option {
                case .gameStart :
                    print("게임을 시작합니다")
                    game.start()
                case .printLog :
                    print("로그를 출력합니다")
                    // 로그 출력 코드 추가 필요
                    continue
                case .gameFin :
                    print("게임을 종료합니다")
                    break
                }
            } else {
                print("잘못된 입력입니다. 1 ~ 3 까지 숫자만 입력해주세요: ")
            }
        }
    }
}
