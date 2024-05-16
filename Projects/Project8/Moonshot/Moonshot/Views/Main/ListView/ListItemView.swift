//
//  ListItemView.swift
//  Moonshot
//
//  Created by Chintan Maisuriya on 16/05/24.
//

import SwiftUI

struct ListItemView: View {
    let image   : String
    let name    : String
    let date    : String
    
    var body: some View {
        HStack(alignment: .center, content: {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .padding()
                .background(.lightBackground)
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text(name)
                    .font(.title2)
                    .foregroundStyle(.white)
                Text(date)
                    .font(.headline)
                    .foregroundStyle(.white.opacity(0.5))
            })
            .padding(.horizontal)            
        })
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.darkBackground)
        .preferredColorScheme(.dark)
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let missions: [Mission] = Bundle.main.decode("missions.json")
        let mission = missions[0]
        ListItemView(image: mission.image, name: mission.displayName, date: mission.formattedLaunchDate)
    }
}
