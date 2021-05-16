//
// Created by Andre Napitupulu on 21/03/21.
// Copyright (c) 2021 Andre. All rights reserved.
//

import Foundation
import PromiseKit

open class Usecase {

    typealias PromiseFunction<T> = () -> Promise<T?>

    func retrieveNetwork<T>(networkCall: @escaping PromiseFunction<T>) -> Promise<Result<T?>> {

        let (promise, seal) = Promise<Result<T?>>.pending()

        firstly {
            networkCall()
        }.done { (t: T?) in
            if (t == nil) {
                seal.fulfill(Result.error(message: "No data retrieved"))
            } else {
                seal.fulfill(Result.success(data: t!))
            }
        }.catch { error in
            seal.reject(error)
        }

        return promise
    }
}
