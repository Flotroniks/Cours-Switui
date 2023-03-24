//
//  MoviesList.swift
//  MovieApp
//
//  Created by Quentin Cornu on 23/03/2023.
//

import Foundation

class MoviesList: ObservableObject {
    @Published var popularMovies: [Movie]
    
    init(popularMovies: [Movie]) {
        self.popularMovies = popularMovies
    }
}
