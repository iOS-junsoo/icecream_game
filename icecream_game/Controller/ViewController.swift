//
//  ViewController.swift
//  icecream_game
//
//  Created by 준수김 on 2021/10/03.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    //버튼들의 클릭 상태를 나타내주는 변수
    var stateStrawberry = false
    var stateVanilla = false
    var stateMelon = false
    var stateStick = false
    var stateBeanStick = false
    var stateMachine = false
    var stateMachine1 = false
    var stateMachine2 = false
    var stateMachine3 = false
    var stateFreeze = false
    var stateFreeze1 = false
    var stateFreeze2 = false
    var stateFreeze3 = false
    
    //아이스크림 다시 만들 때 오류를 수정해주느 변수들
    var checkSugar = ""
    var checkIceCream1 = ""
    var checkIceCream2 = ""
    var checkIceCream3 = ""
    var checkIceCream4 = ""
    
    var flagSugar1 = 0 //아이스크림을 만들 때 다른 시럽을 갔다와도 해당 냉동기의 시럽은 유지되게 하는 변수
    var statecheck1 = "" //시럽을 냉동기에 넣었을 때 해당 시럽을 저장하도록 하는 변수
    var flagSugar2 = 0 //아이스크림을 만들 때 다른 시럽을 갔다와도 해당 냉동기의 시럽은 유지되게 하는 변수
    var statecheck2 = "" //시럽을 냉동기에 넣었을 때 해당 시럽을 저장하도록 하는 변수
    var flagSugar3 = 0 //아이스크림을 만들 때 다른 시럽을 갔다와도 해당 냉동기의 시럽은 유지되게 하는 변수
    var statecheck3 = "" //시럽을 냉동기에 넣었을 때 해당 시럽을 저장하도록 하는 변수
    var flagSugar4 = 0 //아이스크림을 만들 때 다른 시럽을 갔다와도 해당 냉동기의 시럽은 유지되게 하는 변수
    var statecheck4 = "" //시럽을 냉동기에 넣었을 때 해당 시럽을 저장하도록 하는 변수
    var stickCheck1 = ""
    var stickCheck2 = ""
    var flagStick1 = 0
    var flagStick2 = 0
    var stickCheck3 = ""
    var stickCheck4 = ""
    var flagStick3 = 0
    var flagStick4 = 0
    var froze1 = false
    var froze2 = false
    var froze3 = false
    var froze4 = false
    var whichStick1 = 0
    var whichStick2 = 0
    var whichStick3 = 0
    var whichStick4 = 0
    var money = 0
    var level:Level = Level(progress: 0.0167, targetMoney: 1000)
    
    //초등학생과 돈 버튼 교체 변수
    var countKids = 1
    
    //냉동기 청소 여부 확인 변수
    var freezeCount1 = 0
    var freezeCount2 = 0
    var freezeCount3 = 0
    var freezeCount4 = 0
    
    @IBOutlet weak var strawberryBtn: UIButton!
    @IBOutlet weak var vanillaBtn: UIButton!
    @IBOutlet weak var melonBtn: UIButton!
    @IBOutlet weak var stickBtn: UIButton!
    @IBOutlet weak var beanStickBtn: UIButton!
    @IBOutlet weak var machineBtn: UIButton!
    @IBOutlet weak var machineBtn1: UIButton!
    @IBOutlet weak var machineBtn2: UIButton!
    @IBOutlet weak var machineBtn3: UIButton!
    @IBOutlet weak var freezeBtn: UIButton!
    @IBOutlet weak var freezeBtn1: UIButton!
    @IBOutlet weak var freezeBtn2: UIButton!
    @IBOutlet weak var freezeBtn3: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var gameStartBtn: UIButton!
    @IBOutlet weak var currentMoney: UILabel!
    @IBOutlet weak var kids: UIButton!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var targetMoney: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        self.targetMoney.text = "\(level.targetMoney)" + "원"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    @IBAction func strawberryClicked(_ sender: UIButton) {
        stateStrawberry = true
        stateVanilla = false
        stateMelon = false
        stateBeanStick = false
        stateStick = false
    }
    
    @IBAction func vanillaClicked(_ sender: UIButton) {
        stateStrawberry = false
        stateVanilla = true
        stateMelon = false
        stateBeanStick = false
        stateStick = false
    }
    
    @IBAction func melonClicked(_ sender: UIButton) {
        stateStrawberry = false
        stateVanilla = false
        stateMelon = true
        stateBeanStick = false
        stateStick = false
    }
    
    @IBAction func beanStickClicked(_ sender: UIButton) {
        stateBeanStick = true
        stateStick = false
    }
    
    @IBAction func stickClicked(_ sender: UIButton) {
        stateBeanStick = false
        stateStick = true
    }
    
    //게임시작 버튼
    @IBAction func buttonPressed(_ sender: UIButton) {
        stateStrawberry = false
        stateVanilla = false
        stateMelon = false
        stateBeanStick = false
        stateStick = false
        flagStick1 = 0
        flagStick2 = 0
        flagStick3 = 0
        flagStick4 = 0
        flagSugar1 = 0
        flagSugar2 = 0
        flagSugar3 = 0
        flagSugar4 = 0
        statecheck1 = ""
        statecheck2 = ""
        statecheck3 = ""
        statecheck4 = ""
        self.currentMoney.text = "000"
        self.money = 0
        self.machineBtn.setImage(UIImage(named: "빈냉동기"), for: .normal)
        self.machineBtn1.setImage(UIImage(named: "빈냉동기"), for: .normal)
        self.machineBtn2.setImage(UIImage(named: "빈냉동기"), for: .normal)
        self.machineBtn3.setImage(UIImage(named: "빈냉동기"), for: .normal)
        self.levelLabel.text = ""
        var progress: Float = 0.0
        progressBar.progress = level.progress
        
        self.kids.setImage(UIImage(named: "초등학생"), for: .normal)
            
    
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(timer) in
                    
                    progress += 0.0167
                    //print(self.progressBar.progress)
                    self.progressBar.progress = progress
                    if self.progressBar.progress == 1.0 {
                        print("⏰타이머종료⏰")
                        self.timer.invalidate()
                        let alert2 = UIAlertController(title: "⏰Game Over⏰", message: "게임이 종료되었습니다.", preferredStyle: .alert)
                        alert2.addAction(UIAlertAction(title: "다시하기", style: .cancel, handler: { (_) in
                            self.progressBar.progress = 0.0
                        }))
                        alert2.addAction(UIAlertAction(title: "나가기", style: .default, handler: { (_) in
                            exit(0)
                        }))
                        self.present(alert2, animated: true, completion: nil)
                        
                        self.progressBar.progress = 0.0
                    }
                    
                })
            }
        }
    }
    
    //첫번째 냉동기 작동
    @IBAction func machineClicked(_ sender: UIButton) {
        stateMachine = true
        if freezeCount1 == 1 {
            let alert2 = UIAlertController(title: "⚠️경고⚠️", message: "냉동기를 청소해주세요", preferredStyle: .alert)
            alert2.addAction(UIAlertAction(title: "확인", style: .cancel, handler: { (_) in
                
            }))
            self.present(alert2, animated: true, completion: nil)
        }
        
        if flagSugar1 == 0 {
            if stateStrawberry == true {
                statecheck1 = "strawberry"
                flagSugar1 = 1
            } else if stateVanilla == true {
                statecheck1 = "vanilla"
                flagSugar1 = 1
            } else if stateMelon == true {
                statecheck1 = "melon"
                flagSugar1 = 1
            }
        }
        
        
        if flagStick1 == 0 {
            if stateStick == true{
                stickCheck1 = "stick"
                flagStick1 = 1
            } else if stateBeanStick == true{
                stickCheck1 = "beanstick"
                flagStick1 = 1
            }
        }
        
        //액체
        DispatchQueue.global(qos: .userInitiated).sync {
            if self.statecheck1 == "strawberry" && self.stateMachine == true {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "액체딸기"), for: .normal)
                    self.stateMachine = false
                }
            } else if self.statecheck1 == "vanilla" && self.stateMachine == true {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "액체바닐라"), for: .normal)
                    self.stateMachine = false
                }
            } else if self.statecheck1 == "melon" && self.stateMachine == true {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "액체멜론"), for: .normal)
                    self.stateMachine = false
                }
            } 
            
         }
        
        //액체 + 막대기
        DispatchQueue.global(qos: .userInitiated).sync {
            if self.stickCheck1 == "stick" && self.stateMachine == true && self.statecheck1 == "strawberry" {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "딸기막대"), for: .normal)
                    self.stateMachine = false
                }
            } else if self.stickCheck1 == "stick" && self.stateMachine == true && self.statecheck1 == "vanilla" {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "바닐라막대"), for: .normal)
                    self.stateMachine = false
                }
            } else if self.stickCheck1 == "stick" && self.stateMachine == true && self.statecheck1 == "melon" {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "멜론막대"), for: .normal)
                    self.stateMachine = false
                    print(self.stickCheck1)
                }
            } else if self.stickCheck1 == "beanstick" && self.stateMachine == true && self.statecheck1 == "strawberry" {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "팥딸기"), for: .normal)
                    self.stateMachine = false
                    print(self.stickCheck1)
                }
            } else if self.stickCheck1 == "beanstick" && self.stateMachine == true && self.statecheck1 == "vanilla" {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "팥바닐라"), for: .normal)
                    self.stateMachine = false
                }
            } else if self.stickCheck1 == "beanstick" && self.stateMachine == true && self.statecheck1 == "melon" {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "팥멜론"), for: .normal)
                    self.stateMachine = false
                }
            }
        }
    }
    
    //두번째 냉동기 작동
    @IBAction func machine1Clicked(_ sender: UIButton) {
        stateMachine1 = true
        if freezeCount2 == 1 {
            let alert2 = UIAlertController(title: "⚠️경고⚠️", message: "냉동기를 청소해주세요", preferredStyle: .alert)
            alert2.addAction(UIAlertAction(title: "확인", style: .cancel, handler: { (_) in
                
            }))
            self.present(alert2, animated: true, completion: nil)
        }
        if flagSugar2 == 0 {
            if stateStrawberry == true {
                statecheck2 = "strawberry"
                flagSugar2 = 1
            } else if stateVanilla == true {
                statecheck2 = "vanilla"
                flagSugar2 = 1
            } else if stateMelon == true {
                statecheck2 = "melon"
                flagSugar2 = 1
            }
        }
        
        if flagStick2 == 0 {
            if stateStick == true{
                stickCheck2 = "stick"
                flagStick2 = 1
            } else if stateBeanStick == true{
                stickCheck2 = "beanstick"
                flagStick2 = 1
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).sync {
            if self.statecheck2 == "strawberry" && self.stateMachine1 == true {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "액체딸기"), for: .normal)
                    self.stateMachine1 = false
                }
            } else if self.statecheck2 == "vanilla" && self.stateMachine1 == true {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "액체바닐라"), for: .normal)
                    self.stateMachine1 = false
                }
            } else if self.statecheck2 == "melon" && self.stateMachine1 == true {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "액체멜론"), for: .normal)
                    self.stateMachine1 = false
                }
            }
            
         }
        DispatchQueue.global(qos: .userInitiated).sync {
            if self.stickCheck2 == "stick" && self.stateMachine1 == true && self.statecheck2 == "strawberry" {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "딸기막대"), for: .normal)
                    self.stateMachine1 = false
                }
            } else if self.stickCheck2 == "stick" && self.stateMachine1 == true && self.statecheck2 == "vanilla" {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "바닐라막대"), for: .normal)
                    self.stateMachine1 = false
                }
            } else if self.stickCheck2 == "stick" && self.stateMachine1 == true && self.statecheck2 == "melon" {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "멜론막대"), for: .normal)
                    self.stateMachine1 = false
                }
            } else if self.stickCheck2 == "beanstick" && self.stateMachine1 == true && self.statecheck2 == "strawberry" {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "팥딸기"), for: .normal)
                    self.stateMachine1 = false
                }
            } else if self.stickCheck2 == "beanstick" && self.stateMachine1 == true && self.statecheck2 == "vanilla" {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "팥바닐라"), for: .normal)
                    self.stateMachine1 = false
                }
            } else if self.stickCheck2 == "beanstick" && self.stateMachine1 == true && self.statecheck2 == "melon" {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "팥멜론"), for: .normal)
                    self.stateMachine1 = false
                }
            }
            
        }
    }
    
    //세번째 냉동기 작동
    @IBAction func machine2Clicked(_ sender: UIButton) {
        stateMachine2 = true
        if freezeCount3 == 1 {
            let alert2 = UIAlertController(title: "⚠️경고⚠️", message: "냉동기를 청소해주세요", preferredStyle: .alert)
            alert2.addAction(UIAlertAction(title: "확인", style: .cancel, handler: { (_) in
                
            }))
            self.present(alert2, animated: true, completion: nil)
        }
        if flagSugar3 == 0 {
            if stateStrawberry == true {
                statecheck3 = "strawberry"
                flagSugar3 = 1
            } else if stateVanilla == true {
                statecheck3 = "vanilla"
                flagSugar3 = 1
            } else if stateMelon == true {
                statecheck3 = "melon"
                flagSugar3 = 1
            }
        }
        
        if flagStick3 == 0 {
            if stateStick == true{
                stickCheck3 = "stick"
                flagStick3 = 1
            } else if stateBeanStick == true{
                stickCheck3 = "beanstick"
                flagStick3 = 1
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).sync {
            if self.statecheck3 == "strawberry" && self.stateMachine2 == true {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "액체딸기"), for: .normal)
                    self.stateMachine2 = false
                }
            } else if self.statecheck3 == "vanilla" && self.stateMachine2 == true {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "액체바닐라"), for: .normal)
                    self.stateMachine2 = false
                }
            } else if self.statecheck3 == "melon" && self.stateMachine2 == true {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "액체멜론"), for: .normal)
                    self.stateMachine2 = false
                }
            }
            
         }
        DispatchQueue.global(qos: .userInitiated).sync {
            if self.stickCheck3 == "stick" && self.stateMachine2 == true && self.statecheck3 == "strawberry" {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "딸기막대"), for: .normal)
                    self.stateMachine2 = false
                }
            } else if self.stickCheck3 == "stick" && self.stateMachine2 == true && self.statecheck3 == "vanilla" {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "바닐라막대"), for: .normal)
                    self.stateMachine2 = false
                }
            } else if self.stickCheck3 == "stick" && self.stateMachine2 == true && self.statecheck3 == "melon" {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "멜론막대"), for: .normal)
                    self.stateMachine2 = false
                }
            } else if self.stickCheck3 == "beanstick" && self.stateMachine2 == true && self.statecheck3 == "strawberry" {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "팥딸기"), for: .normal)
                    self.stateMachine2 = false
                }
            } else if self.stickCheck3 == "beanstick" && self.stateMachine2 == true && self.statecheck3 == "vanilla" {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "팥바닐라"), for: .normal)
                    self.stateMachine2 = false
                }
            } else if self.stickCheck3 == "beanstick" && self.stateMachine2 == true && self.statecheck3 == "melon" {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "팥멜론"), for: .normal)
                    self.stateMachine2 = false
                }
            }
        }
    }
    
    //네번째 냉동기 작동
    @IBAction func machine3Clicked(_ sender: UIButton) {
        stateMachine3 = true
        if freezeCount4 == 1 {
            let alert2 = UIAlertController(title: "⚠️경고⚠️", message: "냉동기를 청소해주세요", preferredStyle: .alert)
            alert2.addAction(UIAlertAction(title: "확인", style: .cancel, handler: { (_) in
                
            }))
            self.present(alert2, animated: true, completion: nil)
        }
        if flagSugar4 == 0 {
            if stateStrawberry == true {
                statecheck4 = "strawberry"
                flagSugar4 = 1
            } else if stateVanilla == true {
                statecheck4 = "vanilla"
                flagSugar4 = 1
            } else if stateMelon == true {
                statecheck4 = "melon"
                flagSugar4 = 1
            }
        }
        
        if flagStick4 == 0 {
            if stateStick == true{
                stickCheck4 = "stick"
                flagStick4 = 1
            } else if stateBeanStick == true{
                stickCheck4 = "beanstick"
                flagStick4 = 1
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).sync {
            if self.statecheck4 == "strawberry" && self.stateMachine3 == true {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "액체딸기"), for: .normal)
                    self.stateMachine3 = false
                }
            } else if self.statecheck4 == "vanilla" && self.stateMachine3 == true {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "액체바닐라"), for: .normal)
                    self.stateMachine3 = false
                }
            } else if self.statecheck4 == "melon" && self.stateMachine3 == true {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "액체멜론"), for: .normal)
                    self.stateMachine3 = false
                }
            }
            
         }
        DispatchQueue.global(qos: .userInitiated).sync {
            if self.stickCheck4 == "stick" && self.stateMachine3 == true && self.statecheck4 == "strawberry" {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "딸기막대"), for: .normal)
                    self.stateMachine3 = false
                }
            } else if self.stickCheck4 == "stick" && self.stateMachine3 == true && self.statecheck4 == "vanilla" {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "바닐라막대"), for: .normal)
                    self.stateMachine3 = false
                }
            } else if self.stickCheck4 == "stick" && self.stateMachine3 == true && self.statecheck4 == "melon" {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "멜론막대"), for: .normal)
                    self.stateMachine3 = false
                }
            } else if self.stickCheck4 == "beanstick" && self.stateMachine3 == true && self.statecheck4 == "strawberry" {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "팥딸기"), for: .normal)
                    self.stateMachine3 = false
                }
            } else if self.stickCheck4 == "beanstick" && self.stateMachine3 == true && self.statecheck4 == "vanilla" {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "팥바닐라"), for: .normal)
                    self.stateMachine3 = false
                }
            } else if self.stickCheck4 == "beanstick" && self.stateMachine3 == true && self.statecheck4 == "melon" {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "팥멜론"), for: .normal)
                    self.stateMachine3 = false
                }
            }
        }
    }
    
    //첫번째 얼리기
    @IBAction func freezeBtn(_ sender: UIButton) {
        stateFreeze = true
        flagSugar1 = 0
        flagStick1 = 0
        freezeCount1 = 1
        DispatchQueue.global(qos: .userInitiated).sync {
            if self.stateFreeze == true && self.statecheck1 == "strawberry" && self.stateStick == true  {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "얼린딸기"), for: .normal)
                    
                    self.stateStrawberry = false
                    self.stateStick = false
                    self.whichStick1 = 1
                    print(self.whichStick1)
                }
            } else if self.stateFreeze && self.statecheck1 == "vanilla" && self.stateStick == true  {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "얼린바닐라"), for: .normal)
                    
                    self.stateVanilla = false
                    self.stateStick = false
                    self.whichStick1 = 1
                }
            } else if self.stateFreeze && self.statecheck1 == "melon" && self.stateStick == true {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "얼린멜론"), for: .normal)
                    
                    self.stateMelon = false
                    self.stateStick = false
                    self.whichStick1 = 1
                }
            } else if self.stateFreeze && self.statecheck1 == "strawberry" && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "얼린팥딸기"), for: .normal)
                    
                    self.stateStrawberry = false
                    self.stateBeanStick = false
                    self.whichStick1 = 2
                }
            } else if self.stateFreeze && self.statecheck1 == "vanilla" && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "얼린팥바닐라"), for: .normal)
                   
                    self.stateVanilla = false
                    self.stateBeanStick = false
                    self.whichStick1 = 2
                }
            } else if self.stateFreeze && self.statecheck1 == "melon" && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "얼린팥멜론"), for: .normal)
                    
                    self.stateMelon = false
                    self.stateBeanStick = false
                    self.whichStick1 = 2
                }
            }
            
        }
    }
    
    //두번째 얼리기
    @IBAction func freeze1Btn(_ sender: UIButton) {
        stateFreeze1 = true
        flagSugar2 = 0
        flagStick2 = 0
        freezeCount2 = 1
        DispatchQueue.global(qos: .userInitiated).sync {
            if self.stateFreeze1 == true && self.statecheck2 == "strawberry" && self.stateStick == true  {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "얼린딸기"), for: .normal)
                    
                    self.stateStrawberry = false
                    self.stateStick = false
                    self.whichStick2 = 1
                }
            } else if self.stateFreeze1 && self.statecheck2 == "vanilla" && self.stateStick == true  {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "얼린바닐라"), for: .normal)
                    
                    self.stateVanilla = false
                    self.stateStick = false
                    self.whichStick2 = 1
                }
            } else if self.stateFreeze1 && self.statecheck2 == "melon" && self.stateStick == true {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "얼린멜론"), for: .normal)
                    
                    self.stateMelon = false
                    self.stateStick = false
                    self.whichStick2 = 1
                }
            } else if self.stateFreeze1 && self.statecheck2 == "strawberry" && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "얼린팥딸기"), for: .normal)
                    
                    self.stateStrawberry = false
                    self.stateBeanStick = false
                    self.whichStick2 = 2
                }
            } else if self.stateFreeze1 && self.statecheck2 == "vanilla" && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "얼린팥바닐라"), for: .normal)
                   
                    self.stateVanilla = false
                    self.stateBeanStick = false
                    self.whichStick2 = 2
                }
            } else if self.stateFreeze1 && self.statecheck2 == "melon" && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "얼린팥멜론"), for: .normal)
                    
                    self.stateMelon = false
                    self.stateBeanStick = false
                    self.whichStick2 = 2
                }
            }
        }
    }
    
    //세번째 얼리기
    @IBAction func freeze2Btn(_ sender: UIButton) {
        stateFreeze2 = true
        flagSugar3 = 0
        flagStick3 = 0
        freezeCount3 = 1
        DispatchQueue.global(qos: .userInitiated).sync {
            if self.stateFreeze2 == true && self.statecheck3 == "strawberry" && self.stateStick == true  {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "얼린딸기"), for: .normal)
                    
                    self.stateStrawberry = false
                    self.stateStick = false
                    self.whichStick3 = 1
                }
            } else if self.stateFreeze2 && self.statecheck3 == "vanilla" && self.stateStick == true  {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "얼린바닐라"), for: .normal)
                    
                    self.stateVanilla = false
                    self.stateStick = false
                    self.whichStick3 = 1
                }
            } else if self.stateFreeze2 && self.statecheck3 == "melon" && self.stateStick == true {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "얼린멜론"), for: .normal)
                    
                    self.stateMelon = false
                    self.stateStick = false
                    self.whichStick3 = 1
                }
            } else if self.stateFreeze2 && self.statecheck3 == "strawberry" && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "얼린팥딸기"), for: .normal)
                    
                    self.stateStrawberry = false
                    self.stateBeanStick = false
                    self.whichStick3 = 2
                }
            } else if self.stateFreeze2 && self.statecheck3 == "vanilla" && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "얼린팥바닐라"), for: .normal)
                    
                    self.stateVanilla = false
                    self.stateBeanStick = false
                    self.whichStick3 = 2
                }
            } else if self.stateFreeze2 && self.statecheck3 == "melon" && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "얼린팥멜론"), for: .normal)
                    
                    self.stateMelon = false
                    self.stateBeanStick = false
                    self.whichStick3 = 2
                }
            }
        }
    }
    
    //네번째 얼리기
    @IBAction func freeze3Btn(_ sender: UIButton) {
        stateFreeze3 = true
        flagSugar4 = 0
        flagStick4 = 0
        freezeCount4 = 1
        DispatchQueue.global(qos: .userInitiated).sync {
            if self.stateFreeze3 == true && self.statecheck4 == "strawberry" && self.stateStick == true  {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "얼린딸기"), for: .normal)
                    self.stateStrawberry = false
                    self.stateStick = false
                    self.whichStick4 = 1
                }
            } else if self.stateFreeze3 && self.statecheck4 == "vanilla" && self.stateStick == true  {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "얼린바닐라"), for: .normal)
                    
                    self.stateVanilla = false
                    self.stateStick = false
                    self.whichStick4 = 1
                }
            } else if self.stateFreeze3 && self.statecheck4 == "melon" && self.stateStick == true {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "얼린멜론"), for: .normal)
                    
                    self.stateMelon = false
                    self.stateStick = false
                    self.whichStick4 = 1
                }
            } else if self.stateFreeze3 && self.statecheck4 == "strawberry" && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "얼린팥딸기"), for: .normal)
                    self.stateStrawberry = false
                    self.stateBeanStick = false
                    self.whichStick4 = 2
                }
            } else if self.stateFreeze3 && self.statecheck4 == "vanilla" && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "얼린팥바닐라"), for: .normal)
                    self.stateVanilla = false
                    self.stateBeanStick = false
                    self.whichStick4 = 2
                }
            } else if self.stateFreeze3 && self.statecheck4 == "melon" && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "얼린팥멜론"), for: .normal)
                    self.stateMelon = false
                    self.stateBeanStick = false
                    self.whichStick4 = 2
                    
                }
            }
        }
    }
    
    //초등학생 클릭
    @IBAction func sellIceCream(_ sender: UIButton) {
        DispatchQueue.global(qos: .userInitiated).sync {
            print(countKids)
            if countKids % 2 == 0 {
                DispatchQueue.main.async {
                    if self.stateFreeze && self.whichStick1 == 1 {
                        self.money += 100
                    } else if self.stateFreeze && self.whichStick1 == 2 {
                        self.money += 200
                    } else if self.stateFreeze && self.whichStick2 == 1 {
                        self.money += 100
                    } else if self.stateFreeze && self.whichStick2 == 2 {
                        self.money += 200
                    } else if self.stateFreeze && self.whichStick3 == 1 {
                        self.money += 100
                    } else if self.stateFreeze && self.whichStick3 == 2 {
                        self.money += 200
                    } else if self.stateFreeze && self.whichStick4 == 1 {
                        self.money += 100
                    } else if self.stateFreeze && self.whichStick4 == 2 {
                        self.money += 200
                    }
                   // print(self.money)
                    self.currentMoney.text = String(self.money)
                    self.currentMoney.sizeToFit()
                    self.whichStick1 = 0
                    self.whichStick2 = 0
                    self.whichStick3 = 0
                    self.whichStick4 = 0
                    self.kids.setImage(UIImage(named: "초등학생"), for: .normal)
                    self.countKids += 1
                    if self.money >= self.level.targetMoney {
                        self.stateStrawberry = false
                        self.stateVanilla = false
                        self.stateMelon = false
                        self.stateBeanStick = false
                        self.stateStick = false
                        self.flagStick1 = 0
                        self.flagStick2 = 0
                        self.flagStick3 = 0
                        self.flagStick4 = 0
                        self.flagSugar1 = 0
                        self.flagSugar2 = 0
                        self.flagSugar3 = 0
                        self.flagSugar4 = 0
                        self.statecheck1 = ""
                        self.statecheck2 = ""
                        self.statecheck3 = ""
                        self.statecheck4 = ""
                        self.currentMoney.text = "000"
                        self.money = 0
                        self.machineBtn.setImage(UIImage(named: "빈냉동기"), for: .normal)
                        self.machineBtn1.setImage(UIImage(named: "빈냉동기"), for: .normal)
                        self.machineBtn2.setImage(UIImage(named: "빈냉동기"), for: .normal)
                        self.machineBtn3.setImage(UIImage(named: "빈냉동기"), for: .normal)
                        self.timer.invalidate()
                        
                        self.money = 0
                        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "LevelUpViewController") as? LevelUpViewController {
                            //스토리보드가 있으면 스토리보드에 SecondVC라는 이름을 가진 ViewViewController 인스턴스를 만드는데 그거의 타입은 SecondViewController이다.
                            
                            vc.modalPresentationStyle = .fullScreen
                            //modalPresentationStyle: 어떤식으로 화면을 전환하고 싶나?
                            
                            self.present(vc, animated: true)
                            //vc라는 화면의 애니메이션을 True로 한다,.
                        }
                    }
                }
            
            } else {
                self.kids.setImage(UIImage(named: "돈"), for: .normal)
                self.countKids += 1
                
            }
        }
    }
    
    
    //냉동기 청소
    @IBAction func reset(_ sender: UIButton) {
        stateStrawberry = false
        stateVanilla = false
        stateMelon = false
        stateBeanStick = false
        stateStick = false
        flagStick1 = 0
        flagStick2 = 0
        flagStick3 = 0
        flagStick4 = 0
        flagSugar1 = 0
        flagSugar2 = 0
        flagSugar3 = 0
        flagSugar4 = 0
        statecheck1 = " "
        statecheck2 = " "
        statecheck3 = " "
        statecheck4 = " "
        stickCheck1 = " "
        stickCheck2 = " "
        stickCheck3 = " "
        stickCheck4 = " "
        self.machineBtn.setImage(UIImage(named: "빈냉동기"), for: .normal)
        self.machineBtn1.setImage(UIImage(named: "빈냉동기"), for: .normal)
        self.machineBtn2.setImage(UIImage(named: "빈냉동기"), for: .normal)
        self.machineBtn3.setImage(UIImage(named: "빈냉동기"), for: .normal)
        freezeCount1 = 0
        freezeCount2 = 0
        freezeCount3 = 0
        freezeCount4 = 0
    }
}


