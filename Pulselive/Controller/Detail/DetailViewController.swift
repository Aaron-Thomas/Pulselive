//
//  DetailViewController.swift
//  Pulselive
//
//  Created by Aaron Thomas on 30/04/2019.
//  Copyright © 2019 InteractiveCode. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var contentListItem: ContentListItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let listItem = contentListItem else { return }
        
        showLoadingView()
        getDetailView(itemId: listItem.id) { result in
            self.hideLoadingView()
            
            switch result {
            case .success(let contentDetail):
                DispatchQueue.main.async {
                    self.updateUI(contentDetail: contentDetail)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showErrorPopoverView(errorTitle: "Something went wrong", errorMessage: error.localizedDescription)
                }
            }
        }
    }
    
    func updateUI(contentDetail: ContentDetail) {
        guard let detailItem = contentDetail.item else { return }
        
        titleLbl.text = detailItem.title
        subtitleLbl.text = detailItem.subtitle
        bodyTextView.text = detailItem.body
    }
    
    func getDetailView(itemId: Int, completion: @escaping (Result<ContentDetail, Error>) -> ()) {
        
        let listUrlString = "http://dynamic.pulselive.com/test/native/content/\(itemId).json"
        
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
    
    @IBAction func backBtnPrsd() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension DetailViewController: ContentDelegate {
    
    func contentSelectedFromList(listItem: ContentListItem) {
        contentListItem = listItem
    }
}
