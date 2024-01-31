
//
//  ViewController.swift
//  Hangman
//
//  Created by MacBook on 28.4.23..
//


import UIKit

class ViewController: UIViewController {
    
    var nizBrojeva: [Int] = []
          
  

    let slike = ["hangmanprvi","hangmandrugi","hangmantreci", "hangmancetvrti","hangmanpeti","hangmansesti","hangman"]
    
    var labele = [UILabel] ()
    
    func vratiSlucajanNiz() -> [Int] {
    
        var array = [Int]()
        for _ in 1...4 {
         let randomNumber = Int(arc4random_uniform(10))
         array.append(randomNumber)
        }
        return array
    }
        
    
    override func viewDidLoad() {
        
  
    
        nizBrojeva = vratiSlucajanNiz()
      
        

        super.viewDidLoad()
        labele = [prvoMesto, drugoMesto, treceMesto, cetvrtoMesto]
        let brojPrve = String(nizBrojeva[0])
        prvoMesto.text = brojPrve
        prvoMesto.isHidden = true
        
        let brojDruge = String(nizBrojeva[1])
        drugoMesto.text = brojDruge
        drugoMesto.isHidden = true
        
        let brojTrece = String(nizBrojeva[2])
        treceMesto.text = brojTrece
        treceMesto.isHidden = true
        
        let brojCetvrte = String(nizBrojeva[3])
        cetvrtoMesto.text = brojCetvrte
        cetvrtoMesto.isHidden = true
        
      }
    
    
    @IBOutlet weak var drugoMesto: UILabel!
    
    @IBOutlet weak var prvoMesto: UILabel!
    
    @IBOutlet weak var treceMesto: UILabel!
    
    @IBOutlet weak var cetvrtoMesto: UILabel!
    
    @IBOutlet weak var gameOver: UIImageView!
    
    @IBOutlet weak var Slika1: UIImageView!
    
    @IBOutlet weak var Slika2: UIImageView!
    
    @IBAction func acIgrajponovo(_ sender: Any) {
       igrajPonovo()
      }
    

    
    @IBAction func acCifra(_ sender: UIButton) {
        
        ubaci(broj: sender.tag)
    }
    func igrajPonovo() {
        
    
        
        nizBrojeva = vratiSlucajanNiz()
        
      
        labele.forEach{$0.isHidden = true}
        
       
        
        Slika1.image = nil
        
        gameOver.image = nil
        
        kojaSlika = 0
        
        viewDidLoad()
       
       }
    
    func ubaci(broj: Int) {
        
        if nizBrojeva.contains(broj){
            

             for labela in labele {
                 
             if labela.text == "\(broj)" {
                 
             labela.isHidden = false
                     
            }
        }
        var areAllVisible = true
          
        labele.forEach{areAllVisible = areAllVisible && !$0.isHidden}
            
        if areAllVisible{
                
      
                
            Slika1.image = UIImage(named:"win")
                
            }
        }
        else {
            prikaziSliku()
           }
        }
   
    var kojaSlika: Int = 0
    
    func prikaziSliku() {
        
        let nazivSlike = slike[kojaSlika]
        
        

        
        if kojaSlika == 6 {
            
            gameOver.image = UIImage(named:"gameover")
            
        }
            
        
        Slika1.image = UIImage(named: nazivSlike)
            
        self.kojaSlika += 1
        
        }
}
    
    
    


