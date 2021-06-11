//
//  ViewController.swift
//  MegaSena
//
//  Created by Thiago Monteiro  on 20/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    var screenMegaSena: MegaSenaScreen?
    
    // MARK: - Super Methods
    override func loadView() {
        self.screenMegaSena = MegaSenaScreen()
        self.screenMegaSena?.delegate(self)
        self.view = self.screenMegaSena
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mega Sena"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
}

// MARK: - Extensions
extension ViewController: MegaSenaScreenProtocol {
    
    func playButton() {
        var megaSena: [Int] = []
        
        while megaSena.count < 7 {
            let number = Int(arc4random_uniform(60)+1)
            if !megaSena.contains(number) {
                self.screenMegaSena?.resultLabel.text = String("\(megaSena.map({"\($0)"}).joined(separator: "- "))")
                megaSena.append(number)
            }
        }
    }
    
    func clear() {
        self.screenMegaSena?.resultLabel.text = "🤑"
    }
}


