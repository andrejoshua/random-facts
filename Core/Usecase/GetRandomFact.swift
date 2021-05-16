//
// Created by Andre Napitupulu on 21/03/21.
// Copyright (c) 2021 Andre. All rights reserved.
//

import Foundation
import PromiseKit
import Cleanse

class GetRandomFact: Usecase {

    let repository: FactRepository

    init(repository: FactRepository) {
        self.repository = repository
    }

    func execute(lang: String) -> Promise<Result<Fact?>> {
        retrieveNetwork(networkCall: { self.repository.getFact(lang: lang) })
    }
}

// DI section
extension GetRandomFact {

    struct DiModule: Module {
        static func configure(binder: Binder<Unscoped>) {
            binder.bind(GetRandomFact.self).to(factory: GetRandomFact.init)
        }
    }
}
