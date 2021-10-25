//
//  TableViewSampleViewController.swift
//  GradLearningProject
//
//  Created by Mani on 25/10/21.
//

import UIKit

// datasource
// delegate

// tableview holds dynamic data
// how to populate, what to populate is decided by us
class TableViewSampleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt \(indexPath.row)")
        if indexPath.row == 0 {
            guard let cell = tableview.dequeueReusableCell(withIdentifier: "identifier2", for: indexPath) as? UITableViewCell else { return UITableViewCell() }
            cell.textLabel?.text = "\(indexPath.row)-index"
            return cell
        }
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "identifier1", for: indexPath) as? UITableViewCell else { return UITableViewCell() }
        cell.textLabel?.text = "\(indexPath.row)-index"
        return cell
    }

    @IBOutlet var tableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            // some action
        } else if indexPath.row == 1 {
            // then some action
        }
        print(indexPath.row)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // what kind of operations, do you think we can perform here ?
        // real life examples based on apps like instagram, facebook ...
        print("willDisplay \(indexPath.row)")
    }


}
