//
//  ListViewController.swift
//  Pulselive
//
//  Created by Aaron Thomas on 30/04/2019.
//  Copyright © 2019 InteractiveCode. All rights reserved.
//

import UIKit

protocol ContentDelegate: class {
    func contentSelectedFromList(listItem: ContentListItem)
}

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var contentListItems = [ContentListItem]()
    weak var contentDelegate: ContentDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        showLoadingView()
        getContentList { result in
            self.hideLoadingView()
            
            switch result {
            case .success(let contentList):
                self.contentListItems = contentList.items
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showErrorPopoverView(errorTitle: "Something went wrong", errorMessage: error.localizedDescription)
                }
            }
        }
    }
    
    func getContentList(completion: @escaping (Result<ContentList, Error>) -> ()) {
       
        let listUrlString = "http://dynamic.pulselive.com/test/native/contentList.json"
        guard let url = URL(string: listUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let downloadError = error {
                completion(.failure(downloadError))
                return
            }
            
            do {
                let contentList = try JSONDecoder().decode(ContentList.self, from: data!)
                completion(.success(contentList))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }.resume()
    }
}
