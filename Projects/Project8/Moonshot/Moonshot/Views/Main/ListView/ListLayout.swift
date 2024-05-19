//
//  ListLayout.swift
//  Moonshot
//
//  Created by Chintan Maisuriya on 16/05/24.
//

import SwiftUI

// MARK: - Do Navigation: Using Simple NavigationLink

/*
struct ListLayout: View {
    let missions: [Mission]

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12, content: {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission)
                    } label: {
                        ListItemView(image: mission.image, name: mission.displayName, date: mission.formattedLaunchDate)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                }
            })
            .padding([.horizontal, .bottom])
            .preferredColorScheme(.dark)
        }
    }
}
*/


// MARK: - Do Navigation: Using NavigationLink(value:) and navigationDestination()

struct ListLayout: View {
    let missions: [Mission]

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12, content: {
                ForEach(missions) { mission in
                    NavigationLink(value: mission) {
                        ListItemView(image: mission.image, name: mission.displayName, date: mission.formattedLaunchDate)
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
            })
            .padding([.horizontal, .bottom])
            .preferredColorScheme(.dark)
        }
    }
}

struct ListLayout_Previews: PreviewProvider {
    static var previews: some View {
        let missions: [Mission] = Bundle.main.decode("missions.json")
        ListLayout(missions: missions)
    }
}
