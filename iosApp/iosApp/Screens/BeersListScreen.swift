//
//  BeersListScreen.swift
//  SwiftUI-Custon-Nav-An-Api
//
//  Created by Evgheni Lisita on 27.06.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import SwiftUI
import shared

struct BeersListScreen: View {

    @EnvironmentObject var viewModel: BeersViewModel
    
    var body: some View {
        VStack {
            BeersListScreen_List()
        }.onAppear() {
            self.viewModel.fetchPage()
        }
    }
}

struct BeersListScreen_List: View {
    @EnvironmentObject var viewModel: BeersViewModel
     
    var body: some View {
        VStack {
            List(self.viewModel.beers) { beer in
                BeersListScreen_Cell(beer: beer).onAppear() {
                    if self.viewModel.beers.isLast(beer) {
                        self.viewModel.fetchPage()
                    }
                }
            }
        }
    }
}

struct BeersListScreen_Cell: View {
    var beer: Beer?
    var body: some View {
        NavigationLink(destination:
                        BeerDetailScreen(beer: beer)
                        .navigationBarTitle(beer?.name ?? "")
        ) {
            Text("\(self.beer?.name ?? "")")
        }
    }
}



struct BeersListScreen_Previews: PreviewProvider {
    static var previews: some View {
        BeersListScreen()
    }
}
