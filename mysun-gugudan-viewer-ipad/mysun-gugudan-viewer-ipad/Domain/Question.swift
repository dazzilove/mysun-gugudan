class Question {
    var questionNo: Int
    var questionX: Int
    var questionY: Int
    
    init(questionNo: Int, questionX: Int, questtionY: Int) {
        self.questionNo = questionNo
        self.questionX = questionX
        self.questionY = questtionY
    }
    
    func getQuestion() -> String {
        return String(self.questionX) + "," + String(self.questionY)
    }
}
