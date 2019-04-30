//
//  ContentList.swift
//  Pulselive
//
//  Created by Aaron Thomas on 30/04/2019.
//  Copyright © 2019 InteractiveCode. All rights reserved.
//

import Foundation

class ContentList: Codable {
    
    var items: [ContentListItem]
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        items = try container.decodeIfPresent([ContentListItem].self, forKey: .items) ?? [ContentListItem]()
    }
}

class ContentListItem: Codable {
    
    var id: String
    var title: String
    var subtitle: String
    var date: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        subtitle = try container.decodeIfPresent(String.self, forKey: .subtitle) ?? ""
        date = try container.decodeIfPresent(String.self, forKey: .date) ?? ""
    }
}
