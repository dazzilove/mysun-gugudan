
import Foundation

class Answer {
    let question: Question
    var answer: String
    
    init(question: Question) {
        self.question = question
        self.answer = ""
    }
}
