//
//  NoViewFound.swift
//  Animations
//
//  Created by Chintan Maisuriya on 26/04/24.
//

import SwiftUI

struct NoViewFound: View {
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Spacer()
            Text("Oops!\nNo view found")
                .font(.title)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            Spacer()
            Spacer()
            Spacer()
        }
    }
}

struct NoViewFound_Previews: PreviewProvider {
    static var previews: some View {
        NoViewFound()
    }
}
