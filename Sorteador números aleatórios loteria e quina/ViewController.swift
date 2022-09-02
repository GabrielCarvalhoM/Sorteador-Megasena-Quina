//
//  ViewController.swift
//  Sorteador números aleatórios loteria e quina
//
//  Created by Gabriel de carvalho on 16/08/22.
//

import UIKit

enum gameType: String {
    case megasena = "Mega-Sena"
    case quina = "Quina"
}

func randomNumber(total: Int, range: Int) ->[Int] {
    var result: [Int] = []
    while result.count < total {
    let random = Int(arc4random_uniform(UInt32(range))+1)
        if !result.contains(random) {
            result.append(random)
        }
    }
    
    
    return result.sorted()
}
class ViewController: UIViewController {

    @IBOutlet weak var lbGame: UILabel!
    @IBOutlet weak var scGameType: UISegmentedControl!
    
    @IBOutlet weak var imgSix: UIImageView!
    @IBOutlet var lbNumbers: [UILabel]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNumbers(for: .megasena)

        
    }
    
    func showNumbers(for type: gameType) {
        
        lbGame.text = type.rawValue
        var game: [Int] = []
        switch type {
            case .megasena:
            game = randomNumber(total: 6, range: 60)
            lbNumbers.last!.isHidden = false
            imgSix.isHidden = false
                
            case .quina:
            game = randomNumber(total: 5, range: 80)
            lbNumbers.last!.isHidden = true
            imgSix.isHidden = true
            
        }
        
        for (abc, game) in game.enumerated() {
            lbNumbers[abc].text = ("\(game)")
        }
        
    }
    
    
    
    
    @IBAction func generateGame() {
        
        switch scGameType.selectedSegmentIndex {
        case 0:
            showNumbers(for: .megasena)
        default:
            showNumbers(for: .quina)
        }
    }
    

}

