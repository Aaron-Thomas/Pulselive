//
//  ViewController.swift
//  Pulselive
//
//  Created by Aaron Thomas on 30/04/2019.
//  Copyright © 2019 InteractiveCode. All rights reserved.
//

import UIKit

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentListItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "contentlistcell", for: indexPath) as? ContentListCell else { return UITableViewCell() }
        
        let listItem = contentListItems[indexPath.row]
        cell.configureCell(listItem: listItem)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = self.storyboard!.instantiateViewController(withIdentifier: "detailviewcontroller") as? DetailViewController else { return }
        let navController = UINavigationController(rootViewController: detailVC)
        
        let listItem = contentListItems[indexPath.row]
        
        contentDelegate = detailVC
        contentDelegate?.contentSelectedFromList(listItem: listItem)
        
        self.present(navController, animated: true, completion: nil)
    }
}
