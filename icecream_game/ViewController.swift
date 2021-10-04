//
//  ViewController.swift
//  icecream_game
//
//  Created by 준수김 on 2021/10/03.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
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
    var checkSugar = ""
    var checkIceCream1 = ""
    var checkIceCream2 = ""
    var checkIceCream3 = ""
    var checkIceCream4 = ""
    
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
    @IBOutlet weak var kids: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        self.machineBtn.setImage(UIImage(named: "빈냉동기"), for: .normal)
        
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
        var progress: Float = 0.0
        progressBar.progress = progress
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.kids.image = UIImage(named: "초등학생")
            self.disappearKids()
        }
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(timer) in
                    
                    progress += 0.0167
                    
                    self.progressBar.progress = progress
                    if self.progressBar.progress == 1.0 {
                        print("⏰타이머종료⏰")
                        let alert2 = UIAlertController(title: "⏰Game Over⏰", message: "게임이 종료되었습니다.", preferredStyle: .alert)
                        alert2.addAction(UIAlertAction(title: "다시하기", style: .cancel, handler: { (_) in
                            
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
    
    //초등학생
    private func disappearKids() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.kids.image = UIImage(named: "초등학생화남")
        }
    }
    
    //첫번째 냉동기 작동
    @IBAction func machineClicked(_ sender: UIButton) {
        stateMachine = true
        
        //액체
        DispatchQueue.global(qos: .userInitiated).async {
            if self.stateStrawberry == true && self.stateMachine == true {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "액체딸기"), for: .normal)
                    self.stateMachine = false
                }
            } else if self.stateVanilla == true && self.stateMachine == true {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "액체바닐라"), for: .normal)
                    self.stateMachine = false
                }
            } else if self.stateMelon == true && self.stateMachine == true {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "액체멜론"), for: .normal)
                    self.stateMachine = false
                }
            } 
            
         }
        
        //액체 + 막대기
        DispatchQueue.global(qos: .userInitiated).async {
            if self.stateStick == true && self.stateMachine == true && self.stateStrawberry == true {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "딸기막대"), for: .normal)
                    self.stateMachine = false
                }
            } else if self.stateStick == true && self.stateMachine == true && self.stateVanilla == true {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "바닐라막대"), for: .normal)
                    self.stateMachine = false
                }
            } else if self.stateStick == true && self.stateMachine == true && self.stateMelon == true {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "멜론막대"), for: .normal)
                    self.stateMachine = false
                }
            } else if self.stateBeanStick == true && self.stateMachine == true && self.stateStrawberry == true {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "팥딸기"), for: .normal)
                    self.stateMachine = false
                }
            } else if self.stateBeanStick == true && self.stateMachine == true && self.stateVanilla == true {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "팥바닐라"), for: .normal)
                    self.stateMachine = false
                }
            } else if self.stateBeanStick == true && self.stateMachine == true && self.stateMelon == true {
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
        DispatchQueue.global(qos: .userInitiated).async {
            if self.stateStrawberry == true && self.stateMachine1 == true {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "액체딸기"), for: .normal)
                    self.stateMachine1 = false
                }
            } else if self.stateVanilla == true && self.stateMachine1 == true {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "액체바닐라"), for: .normal)
                    self.stateMachine1 = false
                }
            } else if self.stateMelon == true && self.stateMachine1 == true {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "액체멜론"), for: .normal)
                    self.stateMachine1 = false
                }
            }
            
         }
        DispatchQueue.global(qos: .userInitiated).async {
            if self.stateStick == true && self.stateMachine1 == true && self.stateStrawberry == true {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "딸기막대"), for: .normal)
                    self.stateMachine1 = false
                }
            } else if self.stateStick == true && self.stateMachine1 == true && self.stateVanilla == true{
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "바닐라막대"), for: .normal)
                    self.stateMachine1 = false
                }
            } else if self.stateStick == true && self.stateMachine1 == true && self.stateMelon == true{
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "멜론막대"), for: .normal)
                    self.stateMachine1 = false
                }
            } else if self.stateBeanStick == true && self.stateMachine1 == true && self.stateStrawberry == true {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "팥딸기"), for: .normal)
                    self.stateMachine1 = false
                }
            } else if self.stateBeanStick == true && self.stateMachine1 == true && self.stateVanilla == true{
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "팥바닐라"), for: .normal)
                    self.stateMachine1 = false
                }
            } else if self.stateBeanStick == true && self.stateMachine1 == true && self.stateMelon == true{
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
        DispatchQueue.global(qos: .userInitiated).async {
            if self.stateStrawberry == true && self.stateMachine2 == true {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "액체딸기"), for: .normal)
                    self.stateMachine2 = false
                }
            } else if self.stateVanilla == true && self.stateMachine2 == true {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "액체바닐라"), for: .normal)
                    self.stateMachine2 = false
                }
            } else if self.stateMelon == true && self.stateMachine2 == true {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "액체멜론"), for: .normal)
                    self.stateMachine2 = false
                }
            }
            
         }
        DispatchQueue.global(qos: .userInitiated).async {
            if self.stateStick == true && self.stateMachine2 == true && self.stateStrawberry == true {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "딸기막대"), for: .normal)
                    self.stateMachine2 = false
                }
            } else if self.stateStick == true && self.stateMachine2 == true && self.stateVanilla == true{
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "바닐라막대"), for: .normal)
                    self.stateMachine2 = false
                }
            } else if self.stateStick == true && self.stateMachine2 == true && self.stateMelon == true{
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "멜론막대"), for: .normal)
                    self.stateMachine2 = false
                }
            } else if self.stateBeanStick == true && self.stateMachine2 == true && self.stateStrawberry == true {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "팥딸기"), for: .normal)
                    self.stateMachine2 = false
                }
            } else if self.stateBeanStick == true && self.stateMachine2 == true && self.stateVanilla == true{
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "팥바닐라"), for: .normal)
                    self.stateMachine2 = false
                }
            } else if self.stateBeanStick == true && self.stateMachine2 == true && self.stateMelon == true{
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
        DispatchQueue.global(qos: .userInitiated).async {
            if self.stateStrawberry == true && self.stateMachine3 == true {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "액체딸기"), for: .normal)
                    self.stateMachine3 = false
                }
            } else if self.stateVanilla == true && self.stateMachine3 == true {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "액체바닐라"), for: .normal)
                    self.stateMachine3 = false
                }
            } else if self.stateMelon == true && self.stateMachine3 == true {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "액체멜론"), for: .normal)
                    self.stateMachine3 = false
                }
            }
            
         }
        DispatchQueue.global(qos: .userInitiated).async {
            if self.stateStick == true && self.stateMachine3 == true && self.stateStrawberry == true {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "딸기막대"), for: .normal)
                    self.stateMachine3 = false
                }
            } else if self.stateStick == true && self.stateMachine3 == true && self.stateVanilla == true{
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "바닐라막대"), for: .normal)
                    self.stateMachine3 = false
                }
            } else if self.stateStick == true && self.stateMachine3 == true && self.stateMelon == true{
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "멜론막대"), for: .normal)
                    self.stateMachine3 = false
                }
            } else if self.stateBeanStick == true && self.stateMachine3 == true && self.stateStrawberry == true {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "팥딸기"), for: .normal)
                    self.stateMachine3 = false
                }
            } else if self.stateBeanStick == true && self.stateMachine3 == true && self.stateVanilla == true{
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "팥바닐라"), for: .normal)
                    self.stateMachine3 = false
                }
            } else if self.stateBeanStick == true && self.stateMachine3 == true && self.stateMelon == true{
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
        print("stateFreeze")
        DispatchQueue.global(qos: .userInitiated).async {
            if self.stateFreeze == true && self.stateStrawberry == true && self.stateStick == true  {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "얼린딸기"), for: .normal)
                    self.stateFreeze = false
                    self.stateStrawberry = false
                    self.stateStick = false
                }
            } else if self.stateFreeze && self.stateVanilla == true && self.stateStick == true  {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "얼린바닐라"), for: .normal)
                    self.stateFreeze = false
                    self.stateVanilla = false
                    self.stateStick = false
                }
            } else if self.stateFreeze && self.stateMelon == true && self.stateStick == true {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "얼린멜론"), for: .normal)
                    self.stateFreeze = false
                    self.stateMelon = false
                    self.stateStick = false
                }
            } else if self.stateFreeze && self.stateStrawberry == true && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "얼린팥딸기"), for: .normal)
                    self.stateFreeze = false
                    self.stateStrawberry = false
                    self.stateBeanStick = false
                }
            } else if self.stateFreeze && self.stateVanilla == true && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "얼린팥바닐라"), for: .normal)
                    self.stateFreeze = false
                    self.stateVanilla = false
                    self.stateBeanStick = false
                }
            } else if self.stateFreeze && self.stateMelon == true && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "얼린팥멜론"), for: .normal)
                    self.stateFreeze = false
                    self.stateMelon = false
                    self.stateBeanStick = false
                }
            }
        }
    }
    
    //두번째 얼리기
    @IBAction func freeze1Btn(_ sender: UIButton) {
        stateFreeze1 = true
        print("stateFreeze")
        DispatchQueue.global(qos: .userInitiated).async {
            if self.stateFreeze1 == true && self.stateStrawberry == true && self.stateStick == true  {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "얼린딸기"), for: .normal)
                    self.stateFreeze = false
                    self.stateStrawberry = false
                    self.stateStick = false
                }
            } else if self.stateFreeze1 && self.stateVanilla == true && self.stateStick == true  {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "얼린바닐라"), for: .normal)
                    self.stateFreeze = false
                    self.stateVanilla = false
                    self.stateStick = false
                }
            } else if self.stateFreeze1 && self.stateMelon == true && self.stateStick == true {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "얼린멜론"), for: .normal)
                    self.stateFreeze = false
                    self.stateMelon = false
                    self.stateStick = false
                }
            } else if self.stateFreeze1 && self.stateStrawberry == true && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "얼린팥딸기"), for: .normal)
                    self.stateFreeze = false
                    self.stateStrawberry = false
                    self.stateBeanStick = false
                }
            } else if self.stateFreeze1 && self.stateVanilla == true && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "얼린팥바닐라"), for: .normal)
                    self.stateFreeze = false
                    self.stateVanilla = false
                    self.stateBeanStick = false
                }
            } else if self.stateFreeze1 && self.stateMelon == true && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn1.setImage(UIImage(named: "얼린팥멜론"), for: .normal)
                    self.stateFreeze = false
                    self.stateMelon = false
                    self.stateBeanStick = false
                }
            }
        }
    }
    
    //세번째 얼리기
    @IBAction func freeze2Btn(_ sender: UIButton) {
        stateFreeze2 = true
        print("stateFreeze")
        DispatchQueue.global(qos: .userInitiated).async {
            if self.stateFreeze2 == true && self.stateStrawberry == true && self.stateStick == true  {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "얼린딸기"), for: .normal)
                    self.stateFreeze = false
                    self.stateStrawberry = false
                    self.stateStick = false
                }
            } else if self.stateFreeze2 && self.stateVanilla == true && self.stateStick == true  {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "얼린바닐라"), for: .normal)
                    self.stateFreeze = false
                    self.stateVanilla = false
                    self.stateStick = false
                }
            } else if self.stateFreeze2 && self.stateMelon == true && self.stateStick == true {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "얼린멜론"), for: .normal)
                    self.stateFreeze = false
                    self.stateMelon = false
                    self.stateStick = false
                }
            } else if self.stateFreeze2 && self.stateStrawberry == true && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "얼린팥딸기"), for: .normal)
                    self.stateFreeze = false
                    self.stateStrawberry = false
                    self.stateBeanStick = false
                }
            } else if self.stateFreeze2 && self.stateVanilla == true && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "얼린팥바닐라"), for: .normal)
                    self.stateFreeze = false
                    self.stateVanilla = false
                    self.stateBeanStick = false
                }
            } else if self.stateFreeze2 && self.stateMelon == true && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn2.setImage(UIImage(named: "얼린팥멜론"), for: .normal)
                    self.stateFreeze = false
                    self.stateMelon = false
                    self.stateBeanStick = false
                }
            }
        }
    }
    
    //네번째 얼리기
    @IBAction func freeze3Btn(_ sender: UIButton) {
        stateFreeze3 = true
        print("stateFreeze")
        DispatchQueue.global(qos: .userInitiated).async {
            if self.stateFreeze3 == true && self.stateStrawberry == true && self.stateStick == true  {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "얼린딸기"), for: .normal)
                    self.stateFreeze = false
                    self.stateStrawberry = false
                    self.stateStick = false
                }
            } else if self.stateFreeze3 && self.stateVanilla == true && self.stateStick == true  {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "얼린바닐라"), for: .normal)
                    self.stateFreeze = false
                    self.stateVanilla = false
                    self.stateStick = false
                }
            } else if self.stateFreeze3 && self.stateMelon == true && self.stateStick == true {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "얼린멜론"), for: .normal)
                    self.stateFreeze = false
                    self.stateMelon = false
                    self.stateStick = false
                }
            } else if self.stateFreeze3 && self.stateStrawberry == true && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "얼린팥딸기"), for: .normal)
                    self.stateFreeze = false
                    self.stateStrawberry = false
                    self.stateBeanStick = false
                }
            } else if self.stateFreeze3 && self.stateVanilla == true && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "얼린팥바닐라"), for: .normal)
                    self.stateFreeze = false
                    self.stateVanilla = false
                    self.stateBeanStick = false
                }
            } else if self.stateFreeze3 && self.stateMelon == true && self.stateBeanStick == true {
                DispatchQueue.main.async {
                    self.machineBtn3.setImage(UIImage(named: "얼린팥멜론"), for: .normal)
                    self.stateFreeze = false
                    self.stateMelon = false
                    self.stateBeanStick = false
                }
            }
        }
    }
    
    
}


