//
//  ViewController.swift
//  BowlingGame
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: -
    // MARK: IBOutlets
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var fullStrikeButton: UIButton!
    @IBOutlet weak var fullSpareButton: UIButton!
    @IBOutlet weak var fullNineButton: UIButton!
    
    // MARK: -
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        fullStrikeButton.round(withRadius: 5)
        fullSpareButton.round(withRadius: 5)
        fullNineButton.round(withRadius: 5)
    }
    
    // MARK: -
    // MARK: IBAction
    @IBAction func FullStrikeButtonTapped(_ sender: Any) {
        let line = Line(withRolls: [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10])
        scoreLabel.text = "\(line.score())"
    }
    
    @IBAction func FullSpareButtonTapped(_ sender: Any) {
        let line = Line(withRolls: [5, 5,
                                    5, 5,
                                    5, 5,
                                    5, 5,
                                    5, 5,
                                    5, 5,
                                    5, 5,
                                    5, 5,
                                    5, 5,
                                    5, 5, 5])
        scoreLabel.text = "\(line.score())"
    }
    
    @IBAction func FullNineButtonTapped(_ sender: Any) {
        let line = Line(withRolls: [9, 0,
                                    9, 0,
                                    9, 0,
                                    9, 0,
                                    9, 0,
                                    9, 0,
                                    9, 0,
                                    9, 0,
                                    9, 0,
                                    9, 0])
        scoreLabel.text = "\(line.score())"
    }
}

extension UIView {
    func round(withRadius radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}
