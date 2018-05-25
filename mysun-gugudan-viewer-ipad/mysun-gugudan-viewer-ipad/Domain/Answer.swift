
import Foundation

class Answer {
    let quesion: Question
    var answer: String
    var startTime: Date
    var endTime: Date
    
    init(question: Question) {
        self.quesion = question
        self.answer = ""
        self.startTime = Date()
        self.endTime = Date()
    }
}
