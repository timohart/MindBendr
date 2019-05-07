//
//  RecordTableViewController.swift
//  MindBendr
//
//  Created by Timothy Hartwig Student on 4/30/19.
//  Copyright © 2019 CVTC Spring 2019 Capstone. All rights reserved.
//

import UIKit
import CoreData

class RecordTableViewController: UITableViewController {
  
    // MARK: - Class Var and Let
    var records :[NSManagedObject] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return records.count + 4
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
      
      switch indexPath.row {
      case 0:
        cell.textLabel?.text = "Last Game Score"
        
        let record = records[records.count-1]
        
        let correct = record.value(forKey: "correct") as? Int
        let incorrect = record.value(forKey: "incorrect") as? Int
        let date = record.value(forKey: "date") as? String
        let totalQuestions : Int = correct! + incorrect!
        
        cell.detailTextLabel?.text = "\(date) \(correct) / \(totalQuestions)"
      case 1:
        cell.textLabel?.text = "Number of Games"
        cell.detailTextLabel?.text = "\(records.count)"
      case 2:
        cell.textLabel?.text = "Average Score"
        
        var totalCorrect : Int = 0
        var totalQuestions : Int = 0
        
        for record in records {
          let correct = record.value(forKey: "correct") as? Int
          let incorrect = record.value(forKey: "incorrect") as? Int
          
          totalCorrect = totalCorrect + correct!
          totalQuestions = totalQuestions + correct! + incorrect!
        }
        
        let averageCorrect = totalCorrect / records.count
        let averageQuestions = totalQuestions / records.count
        
        cell.detailTextLabel?.text = "\(averageCorrect) / \(averageQuestions)"
      case 3:
        cell.textLabel?.text = "Past Games"
      default:
        let record = records[indexPath.row - 4]
        
        let correct = record.value(forKey: "correct") as? Int
        let incorrect = record.value(forKey: "incorrect") as? Int
        let date = record.value(forKey: "date") as? String
        let totalQuestions : Int = correct! + incorrect!
        
        cell.textLabel?.text = "\(date)"
        cell.detailTextLabel?.text = "\(correct) / \(totalQuestions)"
      }
      
        return cell
    }
  
    override func viewWillAppear(_ animated: Bool) {
      
      guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
      
      let managedContext = appDelegate.persistentContainer.viewContext
      
      let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Record")
      
      do {
        records = try managedContext.fetch(fetchRequest)
      } catch {
        fatalError("Failed to fetch records: \(error)")
      }
      
    }
}
