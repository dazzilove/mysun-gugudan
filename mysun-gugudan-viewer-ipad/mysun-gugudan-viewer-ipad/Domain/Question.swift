import Foundation

class Question: Decodable {
    
    var questionNo: Int
    var xvalue: Int
    var yvalue: Int
    private var startTime: Date
    private var endTime: Date
    
    init(questionNo: Int, xvalue: Int, yvalue: Int) {
        self.questionNo = questionNo
        self.xvalue = xvalue
        self.yvalue = yvalue
        self.startTime = Date()
        self.endTime = Date()
    }
    
    func start() {
        self.startTime = Date()
    }
    
    func stop() {
        self.endTime = Date()
    }
    
    func getStartTime()  -> Date {
        return self.startTime
    }
    
    func getEndTime() -> Date {
        return self.endTime
    }
    
    func getQuestion() -> String {
        return String(self.xvalue) + "," + String(self.yvalue)
    }
}
