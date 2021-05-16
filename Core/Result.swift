//
// Created by Andre Napitupulu on 21/03/21.
// Copyright (c) 2021 Andre. All rights reserved.
//

import Foundation

class Result<T> {

    enum Status {
//        case loading
        case success
        case error
    }

    var status: Status
    var data: T?
    var message: String?

    init(status: Status, data: T? = nil, message: String? = nil) {
        self.status = status
        self.data = data
        self.message = message
    }


    static func success(data: T) -> Result {
        Result(
                status: Status.success,
                data: data,
                message: nil
        )
    }

    static func error(message: String, data: T? = nil) -> Result {
        Result(
                status: Status.error,
                data: data,
                message: message
        )
    }

//    static func loading() -> Result {
//        Result(
//                status: Status.loading,
//                data: nil,
//                message: nil
//        )
//    }
}
