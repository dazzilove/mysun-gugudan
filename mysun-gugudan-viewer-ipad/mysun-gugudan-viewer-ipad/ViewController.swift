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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lblDateTitle.text = makeDateTitle();
        lblAlertText.text = "확인을 클릭하여 다음 문제로 넘어가세요.";
        
        questionList = makeQuesionList()
        lblQuestion.text = makeQuestion(orgText: questionList[3]);
        questionNumber = 1;
        lblQuestionNumber.text = makeQuesionPosition();
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
        return String("\(questionNumber)/\(questionListSize)");
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



}

