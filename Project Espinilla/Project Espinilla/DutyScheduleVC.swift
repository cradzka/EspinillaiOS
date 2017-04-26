//
//  DutyScheduleVC.swift
//  Project Espinilla
//
//  Created by Matthew Crepeau on 3/30/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class DutyScheduleVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView?
    var items: [String] = ["5.4.2017: 5pm to 5.5.2017: 5pm", "5.6.2017: 5pm to 5.7.2017: 5pm", "5.10.2017: 5pm to 5.11.2017: 5pm"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (self.tableView!.dequeueReusableCell(withIdentifier: "cell")!)
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
