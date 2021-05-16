//
// Created by Andre Napitupulu on 21/03/21.
// Copyright (c) 2021 Andre. All rights reserved.
//

import Foundation
import PromiseKit
import Cleanse

class FactRepositoryImpl: FactRepository {

    let client: FactClient

    init(client: FactClient) {
        self.client = client
    }

    func getFact(lang: String) -> Promise<Fact?> {
        client.getRandomFact(lang: lang).map { response -> Fact? in
            if (response == nil) {
                return nil
            }

            return Fact.init(text: response!.text, source: response!.source)
        }
    }
}

// DI section
extension FactRepositoryImpl {

    struct DiModule: Module {
        static func configure(binder: Binder<Unscoped>) {
            binder.bind(FactRepository.self).to(factory: FactRepositoryImpl.init)
        }
    }
}