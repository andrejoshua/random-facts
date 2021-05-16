//
// Created by Andre Napitupulu on 21/03/21.
// Copyright (c) 2021 Andre. All rights reserved.
//

import Foundation
import PromiseKit

protocol FactRepository {

    func getFact(lang: String) -> Promise<Fact?>
}
