//
//  ViewController.swift
//  mysun-gugudan-viewer-ipad
//
//  Created by 이남준 on 2018. 5. 23..
//  Copyright © 2018년 dazzilove. All rights reserved.
//

import UIKit

private var questionList = Array<String>()
private var answerList = Array<Answer>()
private var questionNumber = 0
private var startTime = Date()
private var endTime = Date()
private let txtAnswersDefaultText = "Answers... \n"

class ViewController: UIViewController {
    
    @IBOutlet weak var lblDateTitle: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblAlertText: UILabel!
    @IBOutlet weak var lblQuestionNumber: UILabel!
    @IBOutlet weak var btnConfirm: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var lblDuringTime: UILabel!
    @IBOutlet weak var txtAnswers: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initPage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initPage() {
        questionNumber = 0
        answerList = Array<Answer>()
        
        lblDateTitle.text = makeDateTitle()
        questionList = makeRandomQuesionList()
        txtAnswers.text = txtAnswersDefaultText
        setQuestionInfo()
    }
    
    func makeDuringTimeText(startDate: Date) -> String {
        let startTimeText = makeStartTimeText(date: startDate)
        return String("\(startTimeText)")
    }
    
    func makeStartTimeText(date:Date) -> String {
        let timeText = makeTimeText(date: date)
        return String("Start Time = \(timeText)")
    }
    
    func makeEndTimeText(date:Date) -> String {
        let timeText = makeTimeText(date: date)
        return String("End Time = \(timeText)")
    }
    
    func makeTimeText(date: Date) -> String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        return String("\(hour):\(minute):\(second)")
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
        if(isOverQuestionList()) {
            return
        }
        
        startTime = Date()
        lblDuringTime.text = makeStartTimeText(date: startTime)
        
        lblQuestion.text = makeQuestion(orgText: questionList[questionNumber]);
        lblQuestionNumber.text = makeQuesionPosition()
        makeAlertText()
        
        questionNumber = questionNumber + 1;
    }
    
    func addAnswer() -> Void {
        if(isOverQuestionList()) {
            return
        }
        
        endTime = Date()
        
        let answer = Answer(question: questionList[questionNumber])
        answer.startTime = startTime
        answer.endTime = endTime
        answerList.append(answer.self)
    }
    
    func isOverQuestionList() -> Bool {
        let questionListSize = questionList.count
        if (questionListSize == questionNumber) {
            return true
        }
        return false
    }
    
    func showAnswers() -> Void {
        var text = txtAnswersDefaultText
        txtAnswers.text = text
        for answer in answerList {
            let question = makeQuestion(orgText: answer.quesion)
            let startTime = makeStartTimeText(date: answer.startTime)
            let endTime = makeEndTimeText(date: answer.endTime)
            let answerInfo = String("\(question), \(startTime), \(endTime) \n")
            text = text + answerInfo
        }
        txtAnswers.text = text
    }
    
    @IBAction func btnConfirmOnClick(_ sender: UIButton) {
        addAnswer()
        showAnswers()
        setQuestionInfo()
    }
    
    @IBAction func btnResetOnClick(_ sender: Any) {
        initPage()
    }
    
    
    
    
}


