//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Quentin Cornu on 23/03/2023.
//

import SwiftUI
import Kingfisher

struct MovieDetailView: View {
    
    let movie: Movie
    @State private var actorList: [ActorMovie] = []
    
    // 1 - Créer une variable contenant les acteurs
    
    var body: some View {
        ScrollView{
            VStack {
                KFImage(movie.posterURL)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .overlay(alignment: .bottom) {
                        LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .bottom, endPoint: .top)
                       
                    }
                    .overlay(alignment: .bottom) {
                        VStack(){
                            HStack {
                                 Text(movie.title)
                                    .font(.title)
                                    .bold()
                                Spacer()
                                RatingView(rating: movie.rating)
                                    .frame(width: 40, height: 40)
                         
                            }
                           
                              
                            Text(movie.description)
                        }
                        .padding([.leading, .trailing], 10)
                    }
                    
                // Afficher la liste des acteurs OU une vue de chargement si les acteurs ne sont pas encore chargés
                ScrollView(.horizontal){
                    HStack{
                        ForEach(actorList){
                            apiActor in
                            VStack{
                                AsyncImage(url: URL(string: apiActor.profilePath)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                    
                                } placeholder: {
                                    Circle()
                                }.frame(width: 120, height: 120)
                                    .clipShape(Circle())
                            Text(apiActor.name)
                            Text(apiActor.character)
                                .foregroundColor(.gray)
                        }
                        
                    }
                }
                
                }.padding([.top], 20)
        }
        .onAppear {
            loadCasting(movie.id)
        }
    }.preferredColorScheme(.dark)
            .ignoresSafeArea()
    
}

private func loadCasting(_ id:Int) {
    Task {
        
        // 2 - Chargement des acteurs
        let actorsUrl = URL(string:
                                "https://api.themoviedb.org/3/movie/\(id)/credits?api_key=ee6b2b9e0970948e6741d6b7985191fb")!
        
        do{
            
            let (data, _) = try await URLSession.shared.data(from: actorsUrl)
            //print(String(data: data, encoding: .utf8))
            
            let actorsResult = try JSONDecoder().decode(ActorsResult.self, from: data)
            //actorList = actorsResult.cast
            for acteur in actorsResult.cast{
                actorList.append(ActorMovie(apiActor: acteur))
            }
            
            
        }catch{
            print(error.localizedDescription)
        }
    }
}
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: .preview)
    }
}
