//
// Created by Andre Napitupulu on 21/03/21.
// Copyright (c) 2021 Andre. All rights reserved.
//

import Foundation
import PromiseKit
import Cleanse

class FactClient {

    let client: AFClient

    init(client: AFClient) {
        self.client = client
    }

    func getRandomFact(lang: String) -> Promise<FactResponse?> {
        client.get(url: "random.json", params: ["language": lang]) as Promise<FactResponse?>
    }
}

// DI section
extension FactClient {

    struct DiModule: Module {
        static func configure(binder: Binder<Unscoped>) {
            binder.bind(FactClient.self).to(factory: FactClient.init)
        }
    }
}
