//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Quentin Cornu on 22/03/2023.
//

import SwiftUI

@main
struct MovieAppApp: App {
    var body: some Scene {
        WindowGroup {
            PopularMovies()
                .preferredColorScheme(.dark)
        }
    }
}
