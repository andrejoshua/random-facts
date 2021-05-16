//
// Created by Andre Napitupulu on 21/03/21.
// Copyright (c) 2021 Andre. All rights reserved.
//

import Foundation
import Cleanse

struct RandomFactComponent: RootComponent {

    typealias Root = PropertyInjector<MainViewModel>

    static func configure(binder: Binder<Unscoped>) {
        binder.include(module: AFClient.DiModule.self)
        binder.include(module: FactClient.DiModule.self)
        binder.include(module: FactRepositoryImpl.DiModule.self)
        binder.include(module: GetRandomFact.DiModule.self)
    }

    static func configureRoot(binder bind: ReceiptBinder<Root>) -> BindingReceipt<Root> {
        bind.propertyInjector { (bind) in
            bind.to(injector: MainViewModel.injectProperties)
        }
    }
}
