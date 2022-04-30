//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Александр on 24.04.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var whoAreYou: UILabel!
    @IBOutlet weak var animalDescription: UILabel!
    
    
    var answersChosenResults: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        updateUI()
    }
    
    private func updateUI() {
        let youAre = findMostCommonAnimal()
        whoAreYou.text = "Вы - \(youAre.rawValue)"
        animalDescription.text = youAre.definition
    }
    
    private func findMostCommonAnimal() -> Animal {
        var animalsDict: [Animal: Int]!
        animalsDict = answersChosenResults.reduce(into: [:]) { counts, answer in
            counts[answer.animal, default: 0] += 1
        }
        let commonAnimal = animalsDict.first(where: { $0.value == animalsDict.values.max() })?.key ?? .horse
        return commonAnimal
    }
}
