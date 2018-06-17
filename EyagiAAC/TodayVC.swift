//
//  TodayVC.swift
//  EyagiAAC
//
//  Created by Donghoon Shin on 2018. 6. 17..
//  Copyright © 2018년 Donghoon Shin. All rights reserved.
//

import UIKit

class TodayVC: UIViewController {

    
    @IBOutlet weak var selectedDateLabel: UILabel!
    
    @IBOutlet weak var datepicker: ScrollableDatepicker! {
        didSet {
            var dates = [Date]()
            for day in -15...15 {
                dates.append(Date(timeIntervalSinceNow: Double(day * 86400)))
            }
            
            datepicker.dates = dates
            datepicker.selectedDate = Date()
            datepicker.delegate = self
            
            var configuration = Configuration()
            
            // weekend customization
            configuration.weekendDayStyle.dateTextColor = UIColor(red: 242.0/255.0, green: 93.0/255.0, blue: 28.0/255.0, alpha: 1.0)
            //configuration.weekendDayStyle.dateTextFont = UIFont.boldSystemFont(ofSize: 20)
            configuration.weekendDayStyle.weekDayTextColor = UIColor(red: 242.0/255.0, green: 93.0/255.0, blue: 28.0/255.0, alpha: 1.0)
            
            // selected date customization
            configuration.selectedDayStyle.backgroundColor = UIColor(red: 0.62, green: 0.83, blue: 0.95, alpha: 0.5)
            configuration.selectedDayStyle.selectorColor = UIColor(red: 0.62, green: 0.83, blue: 0.95, alpha: 1)
            configuration.daySizeCalculation = .numberOfVisibleItems(3)
            
            datepicker.configuration = configuration
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        DispatchQueue.main.async {
            self.showSelectedDate()
            self.datepicker.scrollToSelectedDate(animated: false)
        }

    }
    fileprivate func showSelectedDate() {
        guard let selectedDate = datepicker.selectedDate else {
            return
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM YYYY"
        selectedDateLabel.text = formatter.string(from: selectedDate)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func homeClicked(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension TodayVC: ScrollableDatepickerDelegate {
    
    func datepicker(_ datepicker: ScrollableDatepicker, didSelectDate date: Date) {
        showSelectedDate()
    }
    
}

