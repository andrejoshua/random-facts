//
// Created by Andre Napitupulu on 15/03/21.
// Copyright (c) 2021 Andre. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit
import ObjectMapper
import Cleanse

struct AFClient {
    let BaseUrl = "https://uselessfacts.jsph.pl/";

    func get<T: Mappable>(url: String, params: Dictionary<String, Any>) -> Promise<T?> {
        Promise<T?> { resolver in
            AF.request(BaseUrl + url, method: .get, parameters: params).responseJSON { response in
                switch (response.result) {
                case .success(let json):
                    let mapped = Mapper<T>().map(JSONObject: json)
                    resolver.fulfill(mapped)
                    break
                case .failure(let error):
                    resolver.reject(error)
                    break
                }
            }
        }
    }
}

// DI section
extension AFClient {

    struct DiModule: Module {
        static func configure(binder: Binder<Unscoped>) {
            binder.bind(AFClient.self).to(factory: AFClient.init)
        }
    }
}
