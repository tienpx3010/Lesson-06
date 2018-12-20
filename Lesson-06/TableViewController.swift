//
//  TableViewController.swift
//  Lesson-06
//
//  Created by pham.xuan.tien on 12/19/18.
//  Copyright © 2018 pham.xuan.tien. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class TableViewController: UITableViewController {
    let URL = "https://api.github.com/users/google/repos"
    var gitResponse = [Git]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataFromGitHub()
    }

    func loadDataFromGitHub() {
        Alamofire.request(URL).responseArray { (response: DataResponse<[Git]>) in
            self.gitResponse = response.result.value ?? []
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return gitResponse.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = gitResponse[indexPath.row].name
        cell.detailTextLabel?.text = gitResponse[indexPath.row].html_url
        return cell
    }
}
