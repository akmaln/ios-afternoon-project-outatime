//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Akmal Nurmatov on 3/25/20.
//  Copyright © 2020 Akmal Nurmatov. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    private var timer: Timer?
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBAction func travelBackButton(_ sender: Any) {
        startTimer()
    }
    @IBAction func setDestinationTimeButton(_ sender: Any) {
    }
    
    var currentSpeed = 0
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentDate = Date()
        presentTimeLabel.text = dateFormatter.string(from: currentDate)
        speedLabel.text = "\(currentSpeed) MPH"
        lastDepartedLabel.text = "--- -- ---"
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let setDestinationTimeVC = segue.destination as? DatePickerViewController else {return}
            setDestinationTimeVC.delegate = self
        }
        
    }
    
    func startTimer () {
        cancelTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    func resetTimer () {
        cancelTimer()
    }
    func cancelTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeed(timer: Timer) {
        if currentSpeed < 88 {
            currentSpeed += 1
            speedLabel.text = String(currentSpeed) 
        } else {
            lastDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            cancelTimer() 
            showAlert()
        }
        
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(presentTimeLabel.text!)", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Comfirm", style: .cancel, handler: nil)
        
        alert.addAction(okayAction)
        
        present(alert, animated: true, completion: nil)
    }


    
    
}
extension TimeCircuitsViewController: DatePickedDelegate {
        func destinationDateWasChosen(date: Date) {
            destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}

