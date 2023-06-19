import Foundation

enum Sign: Int {
    case rock = 1, paper, scissors
    
    var description: String {
        switch self {
        case .rock:
            return "Taş"
        case .paper:
            return "Kağıt"
        case .scissors:
            return "Makas"
        }
    }
    
    func beats(_ opponent: Sign) -> Bool {
        return (self == .rock && opponent == .scissors) ||
               (self == .paper && opponent == .rock) ||
               (self == .scissors && opponent == .paper)
    }
}

func getPlayerInput() -> Sign? {
    print("Taş, kağıt ya da makas? (1: Taş, 2: Kağıt, 3: Makas)")
    guard let input = readLine(), let choice = Int(input), let sign = Sign(rawValue: choice) else {
        print("Geçersiz bir seçim yaptınız.")
        return nil
    }
    return sign
}

func getComputerSign() -> Sign {
    let randomChoice = Int.random(in: 1...3)
    return Sign(rawValue: randomChoice)!
}

func playGame() {
    if let playerChoice = getPlayerInput() {
        let computerChoice = getComputerSign()
        
        print("Siz: \(playerChoice.description)")
        print("Bilgisayar: \(computerChoice.description)")
        
        if playerChoice == computerChoice {
            print("Berabere! Tekrar deneyin.")
        } else if playerChoice.beats(computerChoice) {
            print("Tebrikler, kazandınız!")
        } else {
            print("Üzgünüm, kaybettiniz.")
        }
    }
    
    print("------------------------")
    playGame()
}

playGame()
