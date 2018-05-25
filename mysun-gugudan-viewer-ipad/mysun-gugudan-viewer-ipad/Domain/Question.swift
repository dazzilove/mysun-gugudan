class Question: Decodable {
    var questionNo: Int
    var xvalue: Int
    var yvalue: Int
    
    init(questionNo: Int, xvalue: Int, yvalue: Int) {
        self.questionNo = questionNo
        self.xvalue = xvalue
        self.yvalue = yvalue
    }
    
    func getQuestion() -> String {
        return String(self.xvalue) + "," + String(self.yvalue)
    }
}
