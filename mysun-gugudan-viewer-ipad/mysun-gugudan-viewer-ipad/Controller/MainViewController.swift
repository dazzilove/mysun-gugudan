//
//  MainViewController.swift
//  mysun-gugudan-viewer-ipad
//
//  Created by 10028467 on 2018. 5. 26..
//  Copyright © 2018년 dazzilove. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private var questionList = Array<Question>()
    
    @IBOutlet weak var ivBg: UIImageView!
    @IBOutlet weak var btnStart: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ivBg.alpha = 0.9
        ivBg.tintColor = UIColor.black
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnStartOnClick(_ sender: Any) {
        getQuesionList()
    }
    
    func getQuesionList() -> Void {
        
        
        
        self.btnStart.setTitle("학습정보 로드 중입니다. 잠시만 기다려주세요.", for: .normal)
        
        
        
        
//        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "questionViewController") as! ViewController
//        self.present(nextViewController, animated : true)
        
        
        let url = URL(string: "http://localhost:8080/questions")
        let session = URLSession.shared

        if let usableUrl = url {
            let task = session.dataTask(with: usableUrl, completionHandler: { (data, response, error) in
                if let resultData = data {
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: resultData, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                        
                        for tempObj in jsonResult {
                            let tempObjDic = tempObj as? [String: Int]
                            let question = Question(
                                  questionNo: tempObjDic!["questionNo"] as! Int
                                , xvalue: tempObjDic!["xvalue"] as! Int
                                , yvalue: tempObjDic!["yvalue"] as! Int
                            )
                            self.questionList.append(question)
                        }
                        
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "showQuestionView", sender: self)
                        }
                        
                    } catch {
                        print("get questlist error!")
                    }
                }
            })
            task.resume()
        }
    }
    
    func preform() {
        performSegue(withIdentifier: "showQuestionView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        self.btnStart.setTitle("학습정보가 로딩되었습니다. 학습을 시작 합니다.", for: .normal)
        
        if segue.identifier == "showQuestionView" {
            let secondVC = segue.destination as! QuestionViewController
            secondVC.questionList = self.questionList
        }
    }
    

}
