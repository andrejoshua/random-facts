//
// Created by Andre Napitupulu on 21/03/21.
// Copyright (c) 2021 Andre. All rights reserved.
//

import Foundation
import ObjectMapper

struct FactResponse: Mappable {

    var id: String!
    var text: String!
    var source: String?
    var sourceUrl: String?
    var language: String!
    var permalink: String!

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        id <- map["id"]
        text <- map["text"]
        source <- map["source"]
        sourceUrl <- map["source_url"]
        language <- map["language"]
        permalink <- map["permalink"]
    }
}
