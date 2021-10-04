//
//  ViewController.swift
//  icecream_game
//
//  Created by 준수김 on 2021/10/03.
//

import UIKit

class ViewController: UIViewController {

    var stateStrawberry = false
    var stateVanilla = false
    var stateMelon = false
    var stateStick = false
    var stateBeanStick = false
    var stateMachine = false
    var stateFreeze = false
    
    @IBOutlet weak var strawberryBtn: UIButton!
    @IBOutlet weak var vanillaBtn: UIButton!
    @IBOutlet weak var melonBtn: UIButton!
    @IBOutlet weak var stickBtn: UIButton!
    @IBOutlet weak var beanStickBtn: UIButton!
    @IBOutlet weak var machineBtn: UIButton!
    @IBOutlet weak var freezeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.machineBtn.setImage(UIImage(named: "빈냉동기"), for: .normal)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    @IBAction func strawberryClicked(_ sender: UIButton) {
        stateStrawberry = true
        stateVanilla = false
        stateMelon = false
    }
    
    @IBAction func vanillaClicked(_ sender: UIButton) {
        stateStrawberry = false
        stateVanilla = true
        stateMelon = false
    }
    
    @IBAction func melonClicked(_ sender: UIButton) {
        stateStrawberry = false
        stateVanilla = false
        stateMelon = true
    }
    
    @IBAction func beanStickClicked(_ sender: UIButton) {
        stateBeanStick = true
        stateStick = false
    }
    
    @IBAction func stickClicked(_ sender: UIButton) {
        stateBeanStick = false
        stateStick = true
    }
    
    //첫번째 냉동기 작동
    @IBAction func machineClicked(_ sender: UIButton) {
        stateMachine = true
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
        DispatchQueue.global(qos: .userInitiated).async {
            if self.stateStick == true && self.stateMachine == true && self.stateStrawberry == true {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "딸기막대"), for: .normal)
                    self.stateMachine = false
                }
            } else if self.stateStick == true && self.stateMachine == true && self.stateVanilla == true{
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "바닐라막대"), for: .normal)
                    self.stateMachine = false
                }
            } else if self.stateStick == true && self.stateMachine == true && self.stateMelon == true{
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "멜론막대"), for: .normal)
                    self.stateMachine = false
                }
            } else if self.stateBeanStick == true && self.stateMachine == true && self.stateStrawberry == true {
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "팥딸기"), for: .normal)
                    self.stateMachine = false
                }
            } else if self.stateBeanStick == true && self.stateMachine == true && self.stateVanilla == true{
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "팥바닐라"), for: .normal)
                    self.stateMachine = false
                }
            } else if self.stateBeanStick == true && self.stateMachine == true && self.stateMelon == true{
                DispatchQueue.main.async {
                    self.machineBtn.setImage(UIImage(named: "팥멜론"), for: .normal)
                    self.stateMachine = false
                }
            }
        }
        
    }
    
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
    
        

    
    
}

