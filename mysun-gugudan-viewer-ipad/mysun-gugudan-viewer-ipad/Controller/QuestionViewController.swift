//
//  ViewController.swift
//  mysun-gugudan-viewer-ipad
//
//  Created by 이남준 on 2018. 5. 23..
//  Copyright © 2018년 dazzilove. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    public var questionList = Array<Question>()
    private var answerList = Array<Answer>()
    private var questionNumber = 0
    private let txtAnswersDefaultText = "Answers... \n"
    
    @IBOutlet weak var lblDateTitle: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblAlertText: UILabel!
    @IBOutlet weak var lblQuestionNumber: UILabel!
    @IBOutlet weak var btnConfirm: UIButton!
    @IBOutlet weak var btnReset: UIButton!
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
        txtAnswers.text = txtAnswersDefaultText
        questionList = makeRandomQuesionList()
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
    
    func makeQuestion(question: Question) -> String {
        return makeQuestion(orgText: question.getQuestion())
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
    
    func makeRandomQuesionList() -> Array<Question> {
        var questionList = self.questionList
        var randomList = Array<Question>()
        
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
        
        let nowQuestion = questionList[questionNumber]
        nowQuestion.start()
        questionList[questionNumber] = nowQuestion
        
        lblQuestion.text = makeQuestion(question: nowQuestion);
        lblQuestionNumber.text = makeQuesionPosition()
        makeAlertText()
    }
    
    func addAnswer() -> Void {
        if(isOverQuestionList()) {
            return
        }
        
        let nowQuestion = questionList[questionNumber]
        nowQuestion.stop()
        questionList[questionNumber] = nowQuestion
        
        let answer = Answer(question: nowQuestion)
        answerList.append(answer.self)
        
        questionNumber = questionNumber + 1
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
            let nowQuestion = answer.question
            let questionNo = nowQuestion.questionNo
            let question = makeQuestion(question: nowQuestion)
            let startTime = makeStartTimeText(date: nowQuestion.getStartTime())
            let endTime = makeEndTimeText(date: nowQuestion.getEndTime())
            let answerInfo = String("\(questionNo), \(question), \(startTime), \(endTime) \n")
            text = text + answerInfo
        }
        txtAnswers.text = text
    }
    
    @IBAction func btnConfirmOnClick(_ sender: UIButton) {
        addAnswer()
        showAnswers()
        setQuestionInfo()
    }
    
    @IBAction func btnResetOnClick(_ sender: UIButton) {
        initPage()
    }
    
}


