//
//  DetailViewController.swift
//  Pulselive
//
//  Created by Aaron Thomas on 30/04/2019.
//  Copyright © 2019 InteractiveCode. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var detailItem: ContentDetailItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func updateUI(contentDetail: ContentDetail) {
        
    }
    
    func getDetailView(itemId: String, completion: @escaping (Result<ContentDetail, Error>) -> ()) {
        
        let listUrlString = "http://dynamic.pulselive.com/test/native/content\(itemId).json"
        
        guard let url = URL(string: listUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let downloadError = error {
                completion(.failure(downloadError))
                return
            }
            
            do {
                let contentDetail = try JSONDecoder().decode(ContentDetail.self, from: data!)
                completion(.success(contentDetail))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }.resume()
    }
}

extension DetailViewController: ContentDelegate {
   
    func contentSelectedFromList(listItem: ContentListItem) {
        getDetailView(itemId: listItem.id) { result in
            switch result {
            case .success(let contentDetail):
                self.updateUI(contentDetail: contentDetail)
            case .failure(let error):
                self.showErrorPopoverView(errorTitle: "Something went wrong", errorMessage: error.localizedDescription)
            }
        }
    }
}
