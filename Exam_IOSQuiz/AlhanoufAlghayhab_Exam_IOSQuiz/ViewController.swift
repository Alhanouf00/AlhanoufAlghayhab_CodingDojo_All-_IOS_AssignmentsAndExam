//
//  ViewController.swift
//  AlhanoufAlghayhab_Exam_IOSQuiz
//
//  Created by administrator on 03/10/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressq: UIProgressView!
    
    struct QA
    {
        let Qustion : String!
        let Answers : [String]!
        let CorrectAnswer :Int!
        
    }
    
    
   var currentQustion: QA?
    var currentIndexOfQ: Int = 0
    var score: Int = 0
   var Answerlabelsend :String!
    var Resultlabelsend :String!
    
   var qustionsAnswers :[QA] = [
   QA (Qustion: "What is the game winner of the best game in 2018 ?",Answers: ["Red Dead Redemption 2","Monster Hunter: World","Marvel's Spider-Man ","God of War"],CorrectAnswer: 3),
   
   QA (Qustion: "Who is publishr Nioh ? ",Answers: ["Koie Tecom","EA","Microsoft","Team Ninja"],CorrectAnswer: 0),
   
   QA (Qustion: "what is the difficult games ? ",Answers: ["God of War","BloodBorn","Nioh2 ","Cuphead"],CorrectAnswer: 1),
   
  QA (Qustion: "what is best part of Resident Evil series ? ",Answers: ["Resident Evil 0","Resident Evil 4","Resident Evil 1 ","Resident Evil 6"],CorrectAnswer: 1),
   
  QA (Qustion: "when release Ghost of Tsushima ? ",Answers: ["2013","2007","2020","2000"],CorrectAnswer: 2),
   
   QA (Qustion: "what is genre of Hollow Knight ? ",Answers: ["Sports","RPG","Adventure","Metroidvania"],CorrectAnswer: 3)]
    
  
    
    
 
    
    @IBOutlet weak var Qustionlabel: UILabel!


    @IBOutlet weak var choiceanswer1: UIButton!
    
    @IBOutlet weak var choiceanswer2: UIButton!
    
    @IBOutlet weak var choiceanswer3: UIButton!
    
    @IBOutlet weak var choiceanswer4: UIButton!
    
    
    
    @IBAction func Choic1(_ sender: Any) {
        
        answers(correctAnswer:0)
        
    }
    
  
    
    @IBAction func Choice2(_ sender: Any) {
        answers(correctAnswer:1)
       
        
        
        
        }
    
    @IBAction func Choice3(_ sender: Any) {
        
        answers(correctAnswer:2)
       

    }
        
    @IBAction func Choice4(_ sender: Any) {
        answers(correctAnswer:3)
       

    }
    

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        currentQustion = qustionsAnswers[0]
        qustions()
       

        
     
       
        
        
        // Do any additional setup after loading the view.
    }

    
       func qustions()
       
       {
           
           
           Qustionlabel?.text = (currentQustion!.Qustion)
           
           choiceanswer1?.setTitle((currentQustion!.Answers[0]), for: UIControl.State.normal)
           choiceanswer2?.setTitle((currentQustion!.Answers[1]), for: UIControl.State.normal)
           choiceanswer3?.setTitle((currentQustion!.Answers[2]), for: UIControl.State.normal)
           choiceanswer4?.setTitle((currentQustion!.Answers[3]), for: UIControl.State.normal)
       }
    
    
    func answers (correctAnswer: Int)
    
    {
        if(correctAnswer == currentQustion!.CorrectAnswer)
        {
            score += 1
            Answerlabelsend = (currentQustion!.Answers[correctAnswer])
            Resultlabelsend = "Correct !!!"
        
            performSegue(withIdentifier: "ShowResults", sender: nil)
            
        }
        else
        {
            
            Resultlabelsend = "Not Quit !"
           
            performSegue(withIdentifier: "ShowResults", sender: nil)

        }
        nextQustion()
    
      
        
        
    }
    
    
    func nextQustion()
    {
        
        if (currentIndexOfQ + 1 < qustionsAnswers.count)
        {
            currentIndexOfQ += 1
            currentQustion = qustionsAnswers[currentIndexOfQ]
            
            
            qustions()
        }
        
        

        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if(segue.identifier == "ShowResults") {
               
               let nextqustion = segue.destination as! ResultScreen
               nextqustion.total = qustionsAnswers.count
               nextqustion.Scoretotal = score
               nextqustion.anser = Answerlabelsend
               nextqustion.result = Resultlabelsend
               nextqustion.nextq = currentIndexOfQ
           }}
    

}

