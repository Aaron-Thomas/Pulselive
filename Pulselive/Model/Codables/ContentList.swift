//
//  ContentList.swift
//  Pulselive
//
//  Created by Aaron Thomas on 30/04/2019.
//  Copyright © 2019 InteractiveCode. All rights reserved.
//

import Foundation

struct ContentList: Codable {
    
    var items: [ContentListItem]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        items = try container.decodeIfPresent([ContentListItem].self, forKey: .items) ?? [ContentListItem]()
    }
}

struct ContentListItem: Codable {
    
    var id: Int
    var title: String
    var subtitle: String
    var date: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        subtitle = try container.decodeIfPresent(String.self, forKey: .subtitle) ?? ""
        date = try container.decodeIfPresent(String.self, forKey: .date) ?? ""
    }
}
