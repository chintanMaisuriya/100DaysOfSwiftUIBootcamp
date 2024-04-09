//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Chintan Maisuriya on 22/04/23.
//

import SwiftUI

struct FlagImage: View {
    var image: String
    
    var body: some View {
        Image(image)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct FlagImage_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage(image: "us")
    }
}
