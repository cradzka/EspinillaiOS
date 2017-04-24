//
//  IssueListViewController.swift
//  Project Espinilla
//
//  Created by Carter Radzka on 4/19/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class BuildingIssueListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var buildingNames: Array<String>?
    var issueLists: [String: Array<String>] = [:]
    @IBOutlet var issueTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        issueTableView.register(UINib(nibName: "IssuePreviewCell", bundle: nil), forCellReuseIdentifier: "IssuePreviewCell")

        
        self.issueTableView.dataSource = self
        self.issueTableView.delegate = self
        
        print(self.buildingNames)
        print(self.issueLists)
        /*
        if self.buildingNames == nil {
            fatalError("buildingNames == nil")
        }
        if self.issueLists.isEmpty {
            fatalError("IssueLists == nil")
        }
        */
        //TODO: add building list class
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    //One section since issues are for one building only
    func numberOfSections(in tableView: UITableView) -> Int {
        return (self.buildingNames?.count)!
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (issueLists[self.buildingNames![section]]?.count)!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IssuePreviewCell", for: indexPath) as! IssuePreviewCell
        let buildingIssueList = self.issueLists[self.buildingNames![indexPath.section]]
        cell.IssueTextView.text = buildingIssueList?[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.buildingNames?[section]
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
