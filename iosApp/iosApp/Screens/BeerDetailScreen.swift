//
//  BeerDetailScreen.swift
//  SwiftUI-Custon-Nav-An-Api
//
//  Created by Evgheni Lisita on 06.07.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import SwiftUI
import shared

struct BeerDetailScreen: View {
    let beer: Beer?
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                BeerDetail_GeneralInfo(beer: beer)
                .padding(.bottom)
                Spacer()
            }
            .padding()
        }
    }
}

struct BeerDetail_GeneralInfo: View {
    let beer: Beer?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tagline: \(beer?.tagline ?? "")")
            Text("First brewed: \(beer?.firstBrewed ?? "")")
            Text("Description: \(beer?.description ?? "")")
        }
    }
}

struct BeerDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        BeerDetailScreen(beer: DataUtils.beerExample)
    }
}
