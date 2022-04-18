//
//  Question.swift
//  PersonalityQuiz
//
//  Created by Александр on 18.04.2022.
//

struct Question {
    let title: String
    let answers: [Answer]
    let type: ResponseType
    
    static func getQuestions() -> [Question] {
        [
            Question(title: "Какую пищу вы предпочитаете?",
                     answers: [
                        Answer(title: "Трава", animal: .cow),
                        Answer(title: "Корма", animal: .horse),
                        Answer(title: "Все что дают", animal: .cow),
                        Answer(title: "Овощи и фрукты", animal: .monkey)
                     ],
                     type: .single
            ),
            Question(title: "Что вам нравится больше?",
                     answers: [
                        Answer(title: "Пастись на лугу", animal: .cow),
                        Answer(title: "Бегать", animal: .horse),
                        Answer(title: "Купаться в грязи", animal: .cow),
                        Answer(title: "Лазать по деревьям", animal: .monkey)
                     ],
                     type: .multiple
            ),
            Question(title: "Любите ли вы гулять?",
                     answers: [
                        Answer(title: "Ненавижу", animal: .pig),
                        Answer(title: "Не люблю", animal: .cow),
                        Answer(title: "Люблю", animal: .monkey),
                        Answer(title: "Обожаю", animal: .horse)
                     ],
                     type: .ranged
            )
            
        ]
    }
}

struct Answer {
    let title: String
    let animal: Animal
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

enum Animal: Character {
    case cow = "🐮"
    case horse = "🐴"
    case pig = "🐷"
    case monkey = "🐵"
    
    var definition: String {
        switch self {
        case .cow:
            return "Ты коровка"
        case .horse:
            return "Ты лошадка"
        case .pig:
            return "Ты свинка"
        case .monkey:
            return "Ты обезьянка"
        }
    }
}
