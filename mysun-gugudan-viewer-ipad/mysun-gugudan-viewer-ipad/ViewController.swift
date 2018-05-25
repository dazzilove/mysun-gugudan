//
//  ViewController.swift
//  mysun-gugudan-viewer-ipad
//
//  Created by 이남준 on 2018. 5. 23..
//  Copyright © 2018년 dazzilove. All rights reserved.
//

import UIKit

private var questionList = Array<String>()
private var questionNumber = 0;

class ViewController: UIViewController {
    
    @IBOutlet weak var lblDateTitle: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblAlertText: UILabel!
    @IBOutlet weak var lblQuestionNumber: UILabel!
    @IBOutlet weak var btnConfirm: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initPage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeDateTitle() -> String {
        let today = Date()
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: today);
        let month = calendar.component(.month, from: today);
        let day = calendar.component(.day, from: today);
        let surfixText = "구구단 학습"
        
        return String("\(year)년 \(month)월 \(day)일 \(surfixText)")
    }
    
    func makeQuestion(orgText:String) -> String {
        let questionParams = orgText.split(separator: ",")
        return String("\(questionParams[0]) X \(questionParams[1])");
    }
    
    func makeQuesionPosition() -> String {
        let questionListSize = questionList.count
        return String("\(questionNumber + 1)/\(questionListSize)");
    }
    
    func makeAlertText() -> Void {
        let alertTextMessageDoing = "확인을 클릭하여 다음 문제로 넘어가세요.";
        let alertTextMessageDone = "오늘 문제를 모두 풀었습니다. 수고하셨습니다. ^^";
        
        let questionListSize = questionList.count
        var alertText = "";
        var alertTextColor = UIColor.black;
        
        if (questionListSize == (questionNumber + 1)) {
            alertText = alertTextMessageDone;
            alertTextColor = UIColor.blue
        } else {
            alertText = alertTextMessageDoing;
            alertTextColor = UIColor.black
        }
        
        lblAlertText.text = alertText
        lblAlertText.textColor = alertTextColor;
    }
    
    func makeQuesionList() -> Array<String> {
        var questionList = Array<String>()
        
        questionList.append("2,1")
        questionList.append("2,2")
        questionList.append("2,3")
        questionList.append("2,4")
        questionList.append("2,5")
        questionList.append("2,6")
        questionList.append("2,7")
        questionList.append("2,8")
        questionList.append("2,9")
        
        return questionList
    }
    
    func makeRandomQuesionList() -> Array<String> {
        var questionList = makeQuesionList()
        var randomList = Array<String>()
        
        let questionListSize = questionList.count
        for _ in 0..<questionListSize {
            let randomIndex = Int(arc4random_uniform(UInt32(questionList.count)) + 1) - 1;
            let randomQuesion = questionList[randomIndex]
            questionList.remove(at: randomIndex)
            randomList.append(randomQuesion)
        }
        
        return randomList
    }
    
    func setQuestionInfo() {
        let questionListSize = questionList.count
        if (questionListSize == questionNumber) {
            return
        }
        
        lblQuestion.text = makeQuestion(orgText: questionList[questionNumber]);
        lblQuestionNumber.text = makeQuesionPosition()
        makeAlertText()
        
        questionNumber = questionNumber + 1;
    }
    
    func initPage() {
        questionNumber = 0
        lblDateTitle.text = makeDateTitle()
        questionList = makeRandomQuesionList()
        setQuestionInfo()
    }
    
    @IBAction func btnConfirmOnClick(_ sender: UIButton) {
        setQuestionInfo()
    }
    @IBAction func btnResetOnClick(_ sender: Any) {
        initPage()
    }
    
    
    
    
}


