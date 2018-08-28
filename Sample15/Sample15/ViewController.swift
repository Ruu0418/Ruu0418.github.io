import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBAction func startTimebutton(_ sender: UIButton) {
        createTimer()
    }
    
    //ユーザーが指定した時間(仮) 秒
    let userTimer:Int = 5

    var timeLabel:UILabel!
    var secondLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        startButton.backgroundColor = UIColor.green
        
        
        //ラベルを適当に用意しておく
        //時間
        timeLabel = UILabel()
        timeLabel.frame = CGRect(x:140,y:170,width:70,height:50)
        timeLabel.font = UIFont.systemFont(ofSize: 35)
        timeLabel.textAlignment = .center
        timeLabel.text = String(userTimer)
        view.addSubview(timeLabel)
        
        //秒
        secondLabel = UILabel()
        secondLabel.frame = CGRect(x:210,y:170,width:30,height:50)
        secondLabel.font = UIFont.systemFont(ofSize: 33)
        secondLabel.textAlignment = .center
        secondLabel.text = "秒"
        view.addSubview(secondLabel)
    }
    
    
    //タイマーの作成
    func createTimer(){
        let timer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target: self,
                                         selector: #selector(self.timerAction(sender:)),
                                         userInfo: nil,
                                         repeats: true)
        timer.fire()
        
    }
    
    //タイマーの処理
    @objc func timerAction(sender:Timer){
        timeLabel .text = String(Int(timeLabel.text!)! - 1)
        
        if timeLabel.text == "-1"{
            sender.invalidate()
            timeLabel.text = String(userTimer)
        }
        
        


    }
}
