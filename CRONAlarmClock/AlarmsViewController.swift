//
//  ViewController.swift
//  CRONAlarmClock
//
//  Created by Zachary Churchill on 9/30/20.
//

import UIKit

class AlarmsViewController: UITableViewController {
    
    /* Instance variables and functions */
    
    var alarmStore: AlarmStore!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.leftBarButtonItem!.tintColor = UIColor.accent
    }
    
    /* Interface Builder methods */

    @IBAction func addNewAlarm(_ sender: UIBarButtonItem) {
        // Just use dummy alarm for time being
        let alarm = Alarm()
        alarmStore.alarms.append(alarm)
        
        if let index = alarmStore.alarms.firstIndex(of: alarm) {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    /* Overriden Functions */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return alarmStore.alarms.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmCell",
                                                 for: indexPath) as! AlarmCell
        
        // Our table will only ever have one section, so just use row to get alarm
        let alarm = alarmStore.alarms[indexPath.row]
        cell.updateDetails(alarm: alarm)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            let alarm = alarmStore.alarms[indexPath.row]
            alarmStore.removeAlarm(alarm)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            print("no implementation for \(editingStyle)")
        }
    }
}

