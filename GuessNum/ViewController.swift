//
//  ViewController.swift
//  GuessNum
//
//  Created by WenLin on 2016/4/19.
//  Copyright © 2016年 WenLin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var startNum:Int = 0
    var endNum: Int = 100
    var input:Int = 0
    var answer:Int = 0
    var count = 0
    
    @IBOutlet weak var startTextField: UITextField!
    
    @IBOutlet weak var endTextField: UITextField!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func startChanged(sender: UITextField) {
        if let startNum = Int(sender.text!) {
            self.startNum = startNum
            setRandom()
        }
        else {
            self.startNum = 0
            startTextField.text=""
        }
        
    }
    
    @IBAction func endChanged(sender: UITextField) {
        if let endNum = Int(sender.text!) {
            self.endNum = endNum
            setRandom()
        }
        else {
            self.endNum = 100
            endTextField.text = ""
        }

    }
    
    @IBAction func didEndOnExit(sender: UITextField) {
        
        if let input = Int(sender.text!) {
            self.input  = input
            
            if input == answer{
                resultLabel.text = "Bingo!!"
                resultLabel.textColor = UIColor.redColor()
                inputTextField.enabled = false
            }
            else {
                count += 1
                resultLabel.text = "Wrong!You have " + "\(5 - count)" + " more chance!"
                resultLabel.textColor = UIColor.blackColor()
            }
        }
        
        if count >= 5 {
            inputTextField.enabled = false
            resultLabel.text = "Game over!"
            inputTextField.text = "Answer: \(answer)"
        }
        
    }

    @IBAction func inputChanged(sender: UITextField) {
        if endNum < startNum {
            startTextField.text = String(endNum)
            endTextField.text = String(startNum)
        }
        
        if startTextField.text == "" {
            startNum = 0
            setRandom()
        }
        if endTextField.text == "" {
            endNum == 100
            setRandom()
        }
        

        print("Start:\(startNum), End:\(endNum), Ans:\(answer)")
    }
    
    @IBAction func startNewGameButton(sender: UIButton) {
        loadView()
        setRandom()
        count = 0
        startTextField.text = String(min(startNum,endNum))
        endTextField.text = String(max(startNum,endNum))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setRandom()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setRandom() {
        let range = abs(self.endNum - self.startNum)
        answer = Int( arc4random_uniform(UInt32(range)) + UInt32(min(startNum,endNum)) )
        
        print(answer)
    }
    


}

