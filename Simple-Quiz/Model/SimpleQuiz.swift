//
//  Simple-Quiz.swift
//  Simple-Quiz
//
//  Created by Randy Efan Jayaputra on 21/04/20.
//  Copyright © 2020 Randy Efan Jayaputra. All rights reserved.
//

import Foundation

struct SimpleQuiz {
    
    let quiz = [
        Pertanyaan(soal: "4+2 = 6", jawaban: "Benar"),
        Pertanyaan(soal: "5 > 7", jawaban: "Salah"),
        Pertanyaan(soal: "Sapi adalah Binatang berkaki empat", jawaban: "Benar"),
        Pertanyaan(soal: "Ikan hidup di darat", jawaban: "Salah")
    ]
    
    var numberQuestion = 0
    var score = 0
    
    func getSoal () -> String {
        return quiz[numberQuestion].soal
    }
    
    func getProgressBar () -> Float {
        return Float(numberQuestion + 1) / Float(quiz.count)
    }
    
    func getScore() -> Int {
        return score
    }
    
    mutating func cekJawaban (_ jawabanPengguna: String) -> Bool {
        if (jawabanPengguna == quiz[numberQuestion].jawaban) {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func pertanyaanSelanjutnya() {
        if numberQuestion + 1 < quiz.count {
            numberQuestion += 1
        } else {
            score = 0
            numberQuestion = 0
        }
    }
}
