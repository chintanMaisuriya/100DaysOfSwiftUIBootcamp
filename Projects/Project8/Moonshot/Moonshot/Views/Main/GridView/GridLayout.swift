//
//  GridLayout.swift
//  Moonshot
//
//  Created by Chintan Maisuriya on 16/05/24.
//

import SwiftUI

// MARK: - Do Navigation: Using Simple NavigationLink

/*
struct GridLayout: View {
    let missions: [Mission]
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission)
                    } label: {
                        GridItemView(image: mission.image, name: mission.displayName, date: mission.formattedLaunchDate)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                }
            }
            .padding([.horizontal, .bottom])
            .preferredColorScheme(.dark)
        }
    }
}
*/


// MARK: - Do Navigation: Using NavigationLink(value:) and navigationDestination()

struct GridLayout: View {
    let missions: [Mission]
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink(value: mission) {
                        GridItemView(image: mission.image, name: mission.displayName, date: mission.formattedLaunchDate)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                    .navigationDestination(for: Mission.self) { mission in
                        MissionView(mission: mission)
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .preferredColorScheme(.dark)
        }
    }
}


struct GridLayout_Previews: PreviewProvider {
    static var previews: some View {
        let missions: [Mission] = Bundle.main.decode("missions.json")
        GridLayout(missions: missions)
    }
}
