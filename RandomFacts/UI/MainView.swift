//
//  ContentView.swift
//  RandomFacts
//
//  Created by Andre Napitupulu on 14/03/21.
//  Copyright © 2021 Andre. All rights reserved.
//

import SwiftUI
import PromiseKit
import Cleanse

struct MainView: View {

    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        Text(viewModel.text)
                .onAppear(perform: fetch)
    }
}

fileprivate extension MainView {
    func fetch() {
        viewModel.fetch()
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
