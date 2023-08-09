//
//  Level.swift
//  PacMan
//
//  Created by The Architect.
//  ©The Architect Labs - 2023
//  Website:  https://thearchitectlabs.github.io
//  YouTube:  https://www.youtube.com/@thearchitectlabs
//

import SwiftUI

struct Level {
    
    // MARK: - PROPERTIES
    var level: Int
    var bonus: String
    var bonusPoints: Int
    
    private let baseSpeed: CGFloat = 384
    
    var pacNormalSpeed: CGFloat
    var pacFrightSpeed: CGFloat
    
    var ghostNormalSpeed: CGFloat
    var ghostTunnelSpeed: CGFloat
    var ghostFrightSpeed: CGFloat
    
    var frightTime: CFTimeInterval
    var frightFlashes: Int
    
    var elroy1Trigger: Int
    var elroy1Speed: CGFloat
    
    var elroy2Trigger: Int
    var elroy2Speed: CGFloat
    
    var stateTime: [CFTimeInterval]
    
    var arrayPointer: Int
    
    // --------------------     Default Value Arrays     -------------------- //
    // Each array has 21 items to represent the levels. After level 21, use the last item of each array for the remaining levels. //
    
    let bonusArray: [String] = ["Cherry","Strawberry","Orange","Orange","Apple","Apple","Melon",
                                "Melon","Galaxian","Galaxian","Bell","Bell","Key","Key",
                                "Key","Key","Key","Key","Key","Key","Key"]
    
    private let bonusPointArray: [Int] = [0100,0300,0500,0500,0700,0700,1000,
                                          1000,2000,2000,3000,3000,5000,5000,
                                          5000,5000,5000,5000,5000,5000,5000]
    
    private let pacNormalSpeedArray: [CGFloat] = [0.80,0.90,0.90,0.90,1.00,1.00,1.00,
                                                  1.00,1.00,1.00,1.00,1.00,1.00,1.00,
                                                  1.00,1.00,1.00,1.00,1.00,1.00,0.90]
    
    private let pacFrightSpeedArray: [CGFloat] = [0.90,0.95,0.95,0.95,1.00,1.00,1.00,
                                                  1.00,1.00,1.00,1.00,1.00,1.00,1.00,
                                                  1.00,1.00,0.00,1.00,0.00,0.00,0.00]
    
    private let ghostNormalSpeedArray: [CGFloat] = [0.75,0.85,0.85,0.85,0.95,0.95,0.95,
                                                    0.95,0.95,0.95,0.95,0.95,0.95,0.95,
                                                    0.95,0.95,0.95,0.95,0.95,0.95,0.95]
    
    private let ghostFrightSpeedArray: [CGFloat] = [0.50,0.55,0.55,0.55,0.60,0.60,0.60,
                                                    0.60,0.60,0.60,0.60,0.60,0.60,0.60,
                                                    0.60,0.60,0.00,0.60,0.00,0.00,0.00]
    
    private let ghostTunnelSpeedArray: [CGFloat] = [0.40,0.45,0.45,0.45,0.50,0.50,0.50,
                                                    0.50,0.50,0.50,0.50,0.50,0.50,0.50,
                                                    0.50,0.50,0.50,0.50,0.50,0.50,0.50]
    
    private let frightTimeArray: [CFTimeInterval] = [6,5,4,3,2,5,2,
                                                     2,1,5,2,1,1,3,
                                                     1,1,0,1,0,0,0]
    
    private let frightFlashArray: [Int] = [5,5,5,5,5,5,5,
                                           5,3,5,5,3,3,5,
                                           3,3,0,3,0,0,0]
    
    private let elroy1SpeedArray: [CGFloat] = [0.80,0.90,0.90,0.90,1.00,1.00,1.00,
                                               1.00,1.00,1.00,1.00,1.00,1.00,1.00,
                                               1.00,1.00,1.00,1.00,1.00,1.00,1.00]
    
    private let elroy2SpeedArray: [CGFloat] = [0.85,0.95,0.95,0.95,1.05,1.05,1.05,
                                               1.05,1.05,1.05,1.05,1.05,1.05,1.05,
                                               1.05,1.05,1.05,1.05,1.05,1.05,1.05]
    
    private let elroy1TriggerArray: [Int] = [20,30,40,40,40,50,50,
                                        50,60,60,60,80,80,80,
                                        100,100,100,100,120,120,120]
    
    private let elroy2TriggerArray: [Int] = [10,15,20,20,20,25,25,
                                        25,30,30,30,40,40,40,
                                        50,50,50,50,60,60,60]
    
    // --------------------     Default Value Arrays     -------------------- //
    
    // MARK: - INITIALIZER
    init(level: Int = 0, bonus: String = "Empty", bonusPoints: Int = 0,
         pacNormalSpeed: CGFloat = 0.0, pacFrightSpeed: CGFloat = 0.0,
         ghostNormalSpeed: CGFloat = 0.0, ghostTunnelSpeed: CGFloat = 0.0, ghostFrightSpeed: CGFloat = 0.0,
         frightTime: CFTimeInterval = 0.0, frightFlashes: Int = 0, elroy1Trigger: Int = 0, elroy1Speed: CGFloat = 0.0,
         elroy2Trigger: Int = 0, elroy2Speed: CGFloat = 0.0, stateTime: [CFTimeInterval] = [0.0], arrayPointer: Int = 0) {
        self.level = level
        self.bonus = bonus
        self.bonusPoints = bonusPoints
        self.pacNormalSpeed = pacNormalSpeed
        self.pacFrightSpeed = pacFrightSpeed
        self.ghostNormalSpeed = ghostNormalSpeed
        self.ghostTunnelSpeed = ghostTunnelSpeed
        self.ghostFrightSpeed = ghostFrightSpeed
        self.frightTime = frightTime
        self.frightFlashes = frightFlashes
        self.elroy1Trigger = elroy1Trigger
        self.elroy1Speed = elroy1Speed
        self.elroy2Trigger = elroy2Trigger
        self.elroy2Speed = elroy2Speed
        self.stateTime = stateTime
        self.arrayPointer = level
    }
    
    // MARK: - METHODS
    func printLevelData() {
        print("Level: \(level) - Bonus: \(bonus) - Bonus Points: \(bonusPoints)")
        print("Pacman Speed - Normal: \(pacNormalSpeed) - Frightened: \(pacFrightSpeed)")
        print("Ghost Speed - Normal: \(ghostNormalSpeed) - Frightened: \(ghostFrightSpeed) - Tunnel: \(ghostTunnelSpeed)")
        print("Frightened Time: \(frightTime) seconds - Flashes: \(frightFlashes)")
    }
    
    mutating func setupLevel(level: Int) {
        self.level = level
        self.bonus = bonusArray[level-1]
        self.bonusPoints = bonusPointArray[level-1]
        self.pacNormalSpeed = pacNormalSpeedArray[level-1] * baseSpeed
        self.pacFrightSpeed = pacFrightSpeedArray[level-1] * baseSpeed
        self.ghostNormalSpeed = ghostNormalSpeedArray[level-1] * baseSpeed
        self.ghostTunnelSpeed = ghostTunnelSpeedArray[level-1] * baseSpeed
        self.ghostFrightSpeed = ghostFrightSpeedArray[level-1] * baseSpeed
        self.frightTime = frightTimeArray[level-1]
        self.frightFlashes = frightFlashArray[level-1]
        
        self.elroy1Trigger = elroy1TriggerArray[level-1]
        self.elroy1Speed = elroy1SpeedArray[level-1] * baseSpeed
        self.elroy2Trigger = elroy2TriggerArray[level-1]
        self.elroy2Speed = elroy2SpeedArray[level-1] * baseSpeed
        
        self.stateTime.removeAll()
        if level == 1 {
            stateTime = [7,20,7,20,5,20,5,86400]
        } else if level >= 2 && level <= 4 {
            stateTime = [7,20,7,20,5,1033,0.02,86400]
        } else {
            stateTime = [5,20,5,20,5,1037,0.02,86400]
        }
        
        arrayPointer = level > 21 ? 21 : level
    }
}
