//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Akmal Nurmatov on 3/25/20.
//  Copyright © 2020 Akmal Nurmatov. All rights reserved.
//

import UIKit

protocol  DatePickedDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {

   
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func doneButton(_ sender: Any) {
        delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
    var delegate: DatePickedDelegate? 
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
