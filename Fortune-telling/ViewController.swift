//
//  ViewController.swift
//  Fortune-telling
//
//  Created by Chi-Che Hsieh on 2018/5/25.
//  Copyright © 2018年 ppquitmax. All rights reserved.
//

import UIKit
import GameplayKit

let randomResult = GKRandomDistribution(lowestValue: 0, highestValue: 2)

class ViewController: UIViewController {
    @IBOutlet weak var askButton: UIButton!
    @IBOutlet weak var questionText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func compareResult(_ sender: Any) {
        let defaultResult = randomResult.nextInt()
        var answerWord:String = ""
        if questionText.text?.isEmpty == true {
            resultLabel.text = "回去想好問題再來吧!"
        } else if ((questionText.text?.contains("Mr. Right"))!)||((questionText.text?.contains("真命天女"))!)||((questionText.text?.contains("真命天子"))!) {
            switch defaultResult {
            case 0:
                answerWord = "東"
            case 1:
                answerWord = "西"
            case 2:
                answerWord = "南"
            default:
                answerWord = "北"
            }
            resultLabel.text = "過兩天往\(answerWord)邊去吧！\n相信可以在那邊遇到他/她"
        } else if ((questionText.text?.contains("work"))!)||((questionText.text?.contains("工作"))!)||((questionText.text?.contains("轉換跑道"))!) {
            switch defaultResult {
            case 0:
                resultLabel.text = "你有聽過iOS界的Peter Pan嗎？\n或許那是一條不錯的選擇"
            case 1:
                resultLabel.text = "有時後強出頭不是好事"
            case 2:
                resultLabel.text = "你應該試著去反轉這個狀況\n去吧！去突破現況"
            default:
                break
            }
        } else if ((questionText.text?.contains("friend"))!)||((questionText.text?.contains("朋友"))!)||((questionText.text?.contains("口角"))!) {
            switch defaultResult {
            case 0:
                resultLabel.text = "你最近走小人運\n盡量不要與人衝突"
            case 1:
                resultLabel.text = "與人和善 以和為貴\n我能說的就這麼多"
            case 2:
                resultLabel.text = "盡快遠離你身邊的酒肉朋友"
            default:
                break
            }
        } else {
            switch defaultResult {
            case 0:
                resultLabel.text = "佛曰：不可說!"
            case 1:
                resultLabel.text = "說不得啊!"
            case 2:
                resultLabel.text = "天機不可洩漏!"
            default:
                break
            }
        }
    }
    
    @IBAction func closeKeyboard(_ sender: Any) {
        // close keyboard when pressing return on keyboard
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 幫button加上圓角
        askButton.layer.cornerRadius = 5
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func keyboardWillShow(notification:NSNotification) {
        // resultLabel.text = "鍵盤來啦!"
        //var userInfo = notification.userInfo!
        //let keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        //let changeInHeight = keyboardFrame.height
        
        viewPositionModify(show: true)
        //let screenSize = UIScreen.main.bounds.height/2-80
        //print(screenSize)
        //view.center.y -= screenSize
    }
    
    @objc func keyboardWillHide(notification:NSNotification) {
        // resultLabel.text = "鍵盤走啦!"
        //var userInfo = notification.userInfo!
        //let keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        //changeInHeight = keyboardFrame.height
        
        viewPositionModify(show: false)
        //let screenSize = UIScreen.main.bounds.height/2-80
        //print(screenSize)
        //view.center.y += screenSize
    }
    
    func viewPositionModify (show:Bool) -> () {
        let screenSize = UIScreen.main.bounds.height/2-80
        if show {
            view.center.y -= screenSize
        } else {
            view.center.y += screenSize
        }
    }
}

