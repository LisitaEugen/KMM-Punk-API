//
//  BeersViewModel.swift
//  SwiftUI-Custon-Nav-An-Api
//
//  Created by Evgheni Lisita on 27.06.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import Foundation
import shared

extension Beer: Identifiable {        
}

class BeersViewModel: ObservableObject {
    @Published private(set) var beers = [Beer]()
    
    @Published private(set) var isPageLoading = false
    @Published private(set) var page: Int = 0
    let punkAPI = PunkAPI()
    
    func fetchPage() {
        guard isPageLoading == false else {
            return
        }
        page += 1
        isPageLoading = true
        
        punkAPI.client.beersGet(page: page as? KotlinInt, perPage: 20, completionHandler: handleResult(_:_:))
    }

    private func handleResult(_ data: [Beer]?,_ error: Error?) -> Void {
        self.isPageLoading = false
        if let beersList = data {
            self.beers.append(contentsOf: beersList)
        } else {
            print(error ?? "no error")
        }
    }
}
