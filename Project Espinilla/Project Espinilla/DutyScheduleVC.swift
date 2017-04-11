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
    var items: [String] = ["4.14.2017: 5pm to 4.15.2017: 5pm", "4.16.2017: 5pm to 4.17.2017: 5pm", "4.20.2017: 5pm to 4.21.2017: 5pm"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
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
