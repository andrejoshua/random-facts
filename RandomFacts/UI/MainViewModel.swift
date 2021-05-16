//
// Created by Andre Napitupulu on 14/05/21.
// Copyright (c) 2021 Andre. All rights reserved.
//

import Foundation
import Cleanse

class MainViewModel: ObservableObject {

    private var getRandomFact: GetRandomFact!

    @Published private(set) var text: String = ""

    required init() {
        let propertyInjector = try? ComponentFactory.of(RandomFactComponent.self).build(())
        propertyInjector?.injectProperties(into: self)
        precondition(getRandomFact != nil)
    }

    func fetch() {
        text = "Loading..."
        getRandomFact.execute(lang: "en").done { result in
            switch (result.status) {
            case .success:
                if (result.data != nil) {
                    self.text = result.data!!.text
                }
                break
            case .error:
                self.text = "Error fetching, haha!!"
                break
            }
        }.catch { error in
            self.text = "Error fetching, haha!!"
        }
    }
}

extension MainViewModel {
    func injectProperties(_ getRandomFact: GetRandomFact) {
        self.getRandomFact = getRandomFact
    }
}
