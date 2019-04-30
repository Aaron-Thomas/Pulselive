//
//  ContentDetail.swift
//  Pulselive
//
//  Created by Aaron Thomas on 30/04/2019.
//  Copyright © 2019 InteractiveCode. All rights reserved.
//

import Foundation

class ContentDetail: Codable {
    
    var item: ContentDetailItem
    
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        
//        //item = try container.decodeIfPresent(ContentDetailItem.self, forKey: .item) ?? nil
//    }
}

class ContentDetailItem: Codable {

    var id: String
    var title: String
    var subtitle: String
    var body: String
    var date: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        subtitle = try container.decodeIfPresent(String.self, forKey: .subtitle) ?? ""
        body = try container.decodeIfPresent(String.self, forKey: .body) ?? ""
        date = try container.decodeIfPresent(String.self, forKey: .date) ?? ""
    }
}
