//
//  ViewController.swift
//  00457022_work2
//
//  Created by User01 on 2018/12/4.
//  Copyright © 2018 00557146. All rights reserved.
//
import UIKit

struct QuestionAnswer {
    var question:String
    var choose:[String]=[]
    var answer:Int
}

class ViewController: UIViewController {
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var QuestionNumber: UILabel!
    @IBOutlet weak var Question: UILabel!
    @IBOutlet var Buttons: [UIButton]!
    
    
    var correctAnswer: Int = 0;
    var Score = 0
    var QuestionCount = 0;
    var list: [Int] = []
    var examQuestions: [QuestionAnswer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setExamData()
        nextQuestion()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func ChooseAction(_ sender: UIButton) {
        let userChooser=sender.tag
        
        if(userChooser == correctAnswer){
            Score = Score + 10
            ScoreLabel.text = "目前得分：\(Score)";
        }
        checkGame()
        
    }
    
    @IBAction func NextQuestionAction(_ sender: Any){
        checkGame()
    }
    
    @IBAction func RestartAction(_ sender: Any) {
        setExamData()
        nextQuestion()
    }
    
    func setExamData(){
        //Q1
        examQuestions.append(QuestionAnswer(question: "右撇子的壽命比左撇子平均長幾年", choose: ["七","八","九","十"], answer: 1))
        //Q2
        examQuestions.append(QuestionAnswer(question: "肝臟有幾百種以上的功能", choose: ["四百","五百","六百","七百"], answer: 2))
        //Q3
        examQuestions.append(QuestionAnswer(question: "如果把人類的DNA 展開來，長度可以來回月球幾千次", choose: ["三千","四千","五千","六千"], answer: 1))
        //Q4
        examQuestions.append(QuestionAnswer(question: "一邊的眉毛大約有幾根", choose: ["450","550","650","750"], answer: 2))
        //Q5
        examQuestions.append(QuestionAnswer(question: "人體的重量大約是大腦的幾倍以上", choose: ["15","20","30","40"], answer: 4))
        //Q6
        examQuestions.append(QuestionAnswer(question: "人一年呼吸大約幾次", choose: ["8千萬","9千萬","１億","１億１千萬"], answer: 3))
        //Q7
        examQuestions.append(QuestionAnswer(question: "人體有幾百條以上的肌肉", choose: ["5百","6百","3百","4百"], answer: 2))
        //Q8
        examQuestions.append(QuestionAnswer(question: "人體最有力的肌肉是哪裡", choose: ["左右手","🐔雞雞","眼球","舌頭"], answer: 2))
        //Q9
        examQuestions.append(QuestionAnswer(question: "手指甲生長的速率是腳指甲的幾倍", choose: ["三","四","五","六"], answer: 2))
        //Q10
        examQuestions.append(QuestionAnswer(question: "人一年平均做多少個夢", choose: ["1989","1696","1460","1024"], answer: 3))
        //Q11
        examQuestions.append(QuestionAnswer(question:"小孩在哪個季節長得比較快", choose: ["春天","夏天","秋天","冬天"], answer: 1))
        //Q12
        examQuestions.append(QuestionAnswer(question: "指甲哪個長得最慢，哪個指甲最快", choose: ["拇指．中指","拇指．小指","中指．小指","小指．拇指"], answer: 1))
        //Q13
        examQuestions.append(QuestionAnswer(question: "人體最敏感的手指是哪支", choose: ["拇指","食指","中指","小指"], answer: 1))
        //Q14
        examQuestions.append(QuestionAnswer(question: "人出生的時候有300 塊骨頭，成年後只剩幾 塊", choose: ["87","206","177","1"], answer: 2))
        //Q15
        examQuestions.append(QuestionAnswer(question: "新生兒的第一駝屎是什麼顏色", choose: ["咖啡色","綠色","黑色","黃色"], answer: 2))
        //Q16
        examQuestions.append(QuestionAnswer(question: "可樂最早是什麼色的", choose: ["黑色","綠色","黃色","咖啡色"], answer: 2))
        //Q17
        examQuestions.append(QuestionAnswer(question: "蚊子是有牙齒的，是幾個", choose: ["20","22","24","26"], answer: 2))
        //Q18
        examQuestions.append(QuestionAnswer(question: "微笑需要17條肌肉，皺眉需要幾條？", choose: ["10","16","37","42"], answer: 4))
        //Q19
        examQuestions.append(QuestionAnswer(question: "眨單眼需要運動幾條以上的肌肉？", choose: ["100","200","300","400"], answer: 2))
        //Q20
        examQuestions.append(QuestionAnswer(question: "人類胚胎在幾個月大時才有指紋", choose: ["三個月","四個月","五個月","六個月"], answer: 1))
        
        Score = 0
        QuestionCount = 0
        ScoreLabel.text = "目前得分：\(Score) ";
    list=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
    }
    
    func nextQuestion(){
        QuestionCount = QuestionCount + 1
        
        let random = Int(arc4random()) % list.count
        let index = list[random]
        
        for i in 0 ..< Buttons.count{
            Buttons[i].setTitle("\(examQuestions[index].choose[i])", for: UIControl.State.normal)
        }
        list.remove(at: random)
        QuestionNumber.text = "第\(String(QuestionCount))題";
        Question.text = examQuestions[index].question
        correctAnswer = examQuestions[index].answer
    }
    
    func checkGame(){
        if(QuestionCount == 10){
            let alertController = UIAlertController(title:"答題結束", message:"得分：\(Score)", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title:"OK", style:.default, handler:{action in self.setExamData()})
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
            setExamData()
            nextQuestion()
        }
        else{
            nextQuestion()
        }
    }
}

