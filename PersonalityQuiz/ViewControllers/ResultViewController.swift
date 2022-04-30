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
    var animalsDict: [Animal: Int]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: true)
        let youAre = findMostCommonAnimal()
        
        whoAreYou.text = "Вы - \(youAre.rawValue)"
        animalDescription.text = youAre.definition
        
        // Do any additional setup after loading the view.
    }
    
    private func findMostCommonAnimal() -> Animal {
        animalsDict = answersChosenResults.reduce(into: [:]) { counts, answer in
            counts[answer.animal, default: 0] += 1
        }
        let commonAnimal = animalsDict.first(where: { $0.value == animalsDict.values.max() })?.key ?? .pig
        return commonAnimal
    }
}
