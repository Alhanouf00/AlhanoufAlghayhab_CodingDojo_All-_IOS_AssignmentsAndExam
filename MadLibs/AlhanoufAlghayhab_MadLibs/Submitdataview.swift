//
//  Submitdataview.swift
//  AlhanoufAlghayhab_MadLibs
//
//  Created by administrator on 10/10/2021.
//

import UIKit

class Submitdataview: UIViewController {

    
    var Adjective:String!
    var Verb:String!
    var Verb1:String!
    var Noun:String!
    
    @IBOutlet weak var Adj: UITextField!
    
    
    @IBOutlet weak var Ver: UITextField!
    
    
    @IBOutlet weak var Ver1: UITextField!
    
    @IBOutlet weak var Nou: UITextField!
    
    @IBAction func Submit(_ sender: UIButton) {
        
        Adjective = Adj.text!
        Verb = Ver.text!
        Verb1 = Ver1.text!
        Noun = Nou.text!
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sendData = segue.destination as! ViewController
        sendData.reciveData = "We are having a perfectly \(Adjective!) right now. Later we will \(Verb!) and \(Verb1!) in the \(Noun!)"
        
        
    
    }
    
    
    }
       
  


