//
//  GridItemView.swift
//  Moonshot
//
//  Created by Chintan Maisuriya on 16/05/24.
//

import SwiftUI

struct GridItemView: View {
    let image   : String
    let name    : String
    let date    : String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            
            VStack {
                Text(name)
                    .font(.headline)
                    .foregroundStyle(.white)
                Text(date)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.5))
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.lightBackground)
        }
        .background(.darkBackground)
        .preferredColorScheme(.dark)
    }
}

struct GridItemView_Previews: PreviewProvider {
    static var previews: some View {
        let missions: [Mission] = Bundle.main.decode("missions.json")
        let mission = missions[0]
        GridItemView(image: mission.image, name: mission.displayName, date: mission.formattedLaunchDate)
    }
}
