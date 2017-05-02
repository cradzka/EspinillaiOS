//
//  IssuePreviewCellDataAndDelegate.swift
//  Project Espinilla
//
//  Created by Carter Radzka on 4/1/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class IssuePreviewCellDataAndDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var issueContent: UIView!
    @IBOutlet weak var issueText: UITextView!
    
    var items = 0
    var sections = 1
    var issuePreviewList: Array<String>
    
    init(issuePreviewList: Array<String>, numberOfPreviews: Int) {
        self.items = numberOfPreviews
        self.issuePreviewList = issuePreviewList
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.items
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "IssuePreviewBlock", for: indexPath) as! IssuePreviewCell
        cell.backgroundColor = UIColor.white
        cell.IssueTextView.text = self.issuePreviewList[indexPath.row]
        cell.issueContentView.addSubview(cell.IssueTextView)
        cell.contentView.addSubview(cell.issueContentView)
        return cell
    }
}
