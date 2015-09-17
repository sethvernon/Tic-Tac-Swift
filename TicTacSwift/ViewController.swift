//
//  ViewController.swift
//  TicTacSwift
//
//  Created by Seth A. Vernon on 9/9/15.
//  Copyright (c) 2015 Seth A. Vernon All rights reserved.
//

import UIKit

class ViewController: UIViewController
    
{

    @IBOutlet weak var whichPlayerLabel: UILabel!
    @IBOutlet var collectionOfLabels: [UILabel]!
    @IBOutlet weak var timeRemainingLabel: UILabel!
    
    
    let homePoint = CGPoint()
    var countDownTimer = NSTimer()
    var timeRemaining = Int()
    lazy var winningCombinationsArray = [titlePosition]()
    
    
// Make the enum for the game squares.
            enum titlePosition:Int {
            
                case  tilePositionTopLeft     = 0
                case  tilePositionTopMiddle   = 1
                case  tilePositionTopRight    = 2
                case  tilePositionMidLeft     = 3
                case  tilePositionMidMiddle   = 4
                case  tilePositionMidRight    = 5
                case  tilePositionBottomLeft  = 6
                case  tilePositionBottomMiddle = 7
                case  tilePositionBottomRight = 8
            
            }
    
            // Create struct for x,y coordinates.
            struct Move
            {
                var x = Int();
                var y = Int();
            }
    
    
            // Function for movement
    func MoveMake(x:Move, y:Move) -> Move
            {
            var m = Move()
            x.x;
            y.y;
                return m
            }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set the text for the collection labels.
        collectionOfLabels[0].text = ""
        var label:UILabel = collectionOfLabels[0]
        label.text = ""
        
        whichPlayerLabel.text = "X"
        
        // for loop throuch collection to set the paramaters of the UI.
        for label in collectionOfLabels
        {
            label.layer.borderColor = UIColor.blueColor().CGColor
            label.layer.borderWidth = 2
            
        }
        
        whichPlayerLabel.layer.borderColor = UIColor.blueColor().CGColor
        whichPlayerLabel.layer.borderWidth = 2
        whichPlayerLabel.center = homePoint
        
       
        
            
        winningCombinationsArray = [titlePosition.tilePositionTopLeft, titlePosition.tilePositionTopMiddle, titlePosition.tilePositionTopRight,
                                    titlePosition.tilePositionMidLeft, titlePosition.tilePositionMidMiddle, titlePosition.tilePositionMidRight,
                                    titlePosition.tilePositionBottomLeft, titlePosition.tilePositionBottomMiddle, titlePosition.tilePositionBottomRight,
                                    titlePosition.tilePositionTopLeft, titlePosition.tilePositionMidMiddle, titlePosition.tilePositionBottomRight,
                                    titlePosition.tilePositionBottomMiddle, titlePosition.tilePositionMidMiddle, titlePosition.tilePositionTopMiddle,
                                    titlePosition.tilePositionTopRight, titlePosition.tilePositionMidRight, titlePosition.tilePositionBottomRight,
                                    titlePosition.tilePositionBottomLeft, titlePosition.tilePositionMidMiddle, titlePosition.tilePositionTopRight,
                                    titlePosition.tilePositionTopLeft, titlePosition.tilePositionMidMiddle, titlePosition.tilePositionBottomRight
                                    ]
        
//        startTimer()
    }
//    
//    func startTimer() {
//        
//        timeRemaining = 25
//        timeRemainingLabel.text = "25"
//        
////        if countDownTimer {
////            countDownTimer.invalidate()
////        }
//        countDownTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self,
//                                                                 selector: Selector("timerFired"),
//                                                                 userInfo: nil,
//                                                                   repeats: true)
//        
//    }

//    func timerFired(timer:NSTimer) {
//        
//        if timeRemaining == 0
//        {
//            // If you run out of time you get an alert message "Ran Out Of Time.... Try Again!"
//        }
//        timeRemaining--
//        timeRemainingLabel.text = "%i"
//    }
//    
//    
//    override func dismissViewControllerAnimated(flag: Bool, completion: (() -> Void)?) {
//        // dismiss controller and start timer
//    }
//       
    func findLabelUsingPoint (point:CGPoint) -> UILabel? {
        
        
        for labelWithPoint in collectionOfLabels
        {
            if CGRectContainsPoint(labelWithPoint.frame, point) {
                
                return labelWithPoint
            }
        }
        
        return nil
    }
    
    

    func selectLabel(labelToSelect:UILabel) ->Bool {
     
        if labelToSelect.isEqual(nil) {
            return false
        }
        
//        if ((labelToSelect.text?.hashValue) != nil) {
//            return false
//        }
        
        if (whichPlayerLabel.text == "X") {
            labelToSelect.text = "X"
            labelToSelect.textColor = UIColor.blueColor()
            
            whichPlayerLabel.text = "O"
        }
        
        else {
            
            labelToSelect.text = "O"
            labelToSelect.textColor = UIColor.redColor()
            whichPlayerLabel.text = "X"
        }
       // startTimer()
        
        return true
        
    }
    
    func triggerAI() {
        
        whichPlayerLabel.userInteractionEnabled = true
        var arrayOfUnselectedLabels = NSMutableArray()
        
        for label:UILabel in collectionOfLabels
        {
            if label.text == ""
            {
                arrayOfUnselectedLabels.arrayByAddingObject(label)
            }
        }
        
    }
    
    
    
    func bestLabelToSelectAs(playerString:NSString) -> Int? {
        
        
        var otherPlayerString = playerString.isEqualToString("X") ? "O" : "X"
        var labelTextArray = arrayOfAllLabelsTexts()
        var otherPlayerMoves = NSMutableArray()
        
        for (var i = 0; i < labelTextArray.count; i++)
        {
            if labelTextArray[i].isEqual(otherPlayerString) {
                otherPlayerMoves.addObject(i)
            }
            
        
        }
        
        return 0

        
    }
   
    
    
    
    func arrayOfAllLabelsTexts() -> NSMutableArray {
        var results = NSMutableArray()
        
        for (label:UILabel) in collectionOfLabels
        {
            results.addObject(label.text!)
        }
        return results
    }
        
        

    @IBAction func viewTapped(sender: UITapGestureRecognizer) {

        
        if let labelToSelect = findLabelUsingPoint(sender.locationInView(view))
        {
        selectLabel(labelToSelect)
        checkForWinner()
        }
    }
        
    
    
    func checkForWinner() {
        
        var winner = whoWon()
        
        if (winner != nil) {
            var alert = UIAlertController(title: "", message:"Congradulations! \(winner)", preferredStyle: UIAlertControllerStyle.Alert)
            
            self.presentViewController(alert, animated:true, completion:nil)
        }
        
    }
    
    func alertView() {
        
    }
    
    func alertViewCancel() {
        
    }
    
    
    
    func whoWon() -> String? {
        
        var labelTextArray:NSMutableArray = arrayOfAllLabelsTexts()
        
        for winningCombo in winningCombinationsArray {
            
//            var firstString = winningCombo.indexOfObject as String
//            var secondString = winningCombo.rawValue
//            var thirdString = winningCombo.rawValue
            return nil
            
            
            
        }
        
        
        return nil
    }
//
//    func isDraw() ->Bool {
//        
//    }
    
    //    @IBAction cardPanned(panGesture:UIPanGestureRecognizer) {
//    
//    }
//    func checkForWinner() {
//            
//        }
//    
    
    func moveCardToPostion(position:titlePosition) {
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }

        

}