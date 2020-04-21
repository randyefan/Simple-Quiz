//
//  ViewController.swift
//  Simple-Quiz
//
//  Created by Randy Efan Jayaputra on 20/04/20.
//  Copyright © 2020 Randy Efan Jayaputra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var soalLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    var waktu = Timer()
    var simpleQuiz = SimpleQuiz()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let jawabanPengguna = sender.currentTitle!
        
        let cek = simpleQuiz.cekJawaban(jawabanPengguna)
        
        if (cek) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        simpleQuiz.pertanyaanSelanjutnya()
        
        waktu = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        progressBar.progress = simpleQuiz.getProgressBar()
        soalLabel.text = simpleQuiz.getSoal()
        scoreLabel.text = "Score : \(simpleQuiz.getScore())"
        trueButton.backgroundColor = UIColor(red: 255.0/255, green: 189.0/255, blue: 105.0/255, alpha: 1)
        falseButton.backgroundColor = UIColor(red: 255.0/255, green: 189.0/255, blue: 105.0/255, alpha: 1)
    }
    
}

