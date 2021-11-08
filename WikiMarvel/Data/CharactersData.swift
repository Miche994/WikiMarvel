//
//  CharactersData.swift
//  WikiMarvel
//
//  Created by Betacom on 08/11/21.
//

import Foundation


struct MarvelCharacter {
    let name: String
    let imageURL: String
    let description: String
}

struct MarvelCharacterDataSource {
    var characters: [MarvelCharacter] {
        return [
            MarvelCharacter(name: "Abomination (Emil Blonsky)",
                            imageURL: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fjavidante%2Fabomination%2F&psig=AOvVaw1qmrWlzLHW8DTTFIHLoe7t&ust=1636487503842000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJjsv5fFifQCFQAAAAAdAAAAABAD",
                            description: "Formerly known as Emil Blonsky, a spy of Soviet Yugoslavian origin working for the KGB, the Abomination gained his powers after receiving a dose of gamma radiation similar to that which transformed Bruce Banner into the incredible Hulk."),
            
            MarvelCharacter(name: "Avengers",
                            imageURL: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.europosters.it%2Fposter%2Favengers-endgame-journey-s-end-v55388&psig=AOvVaw2rmNf84YvTP2MpwanRkPSO&ust=1636487557284000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCLjgoLTFifQCFQAAAAAdAAAAABAD",
                            description: "Earth's Mightiest Heroes joined forces to take on threats that were too big for any one hero to tackle. With a roster that has included Captain America, Iron Man, Ant-Man, Hulk, Thor, Wasp and dozens more over the years, the Avengers have come to be regarded as Earth's No. 1 team."),
            
            MarvelCharacter(name: "The Hulk",
                            imageURL: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.artstation.com%2Fartwork%2FXqveR&psig=AOvVaw1LHnGmXVSv-NG7YOEcl4jh&ust=1636487630194000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCIDJt9bFifQCFQAAAAAdAAAAABAJ",
                            description: ""),
            
            MarvelCharacter(name: "SpiderMan",
                            imageURL: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.cinematographe.it%2Fnews%2Fspider-man-disney-plus-film-tom-holland-spot%2F&psig=AOvVaw0vCl-L4zGbLej_S5QJvT-x&ust=1636487735207000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCPjajofGifQCFQAAAAAdAAAAABAT",
                            description: ""),
            
            MarvelCharacter(name: "WonderWoman",
                            imageURL: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.posterlounge.it%2Fp%2F728231.html&psig=AOvVaw3LhWJrIl_rUYQtqsTH2H7d&ust=1636487850112000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCOjVrbrGifQCFQAAAAAdAAAAABAJ",
                            description: ""),
            
            MarvelCharacter(name: "Vision",
                            imageURL: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fanimatedextras.com%2Fportfolio%2Favengers-age-ultron-vision-prosthetics%2F&psig=AOvVaw1wnyhcdR15MlRLqFMVuHDy&ust=1636487895912000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCICpktXGifQCFQAAAAAdAAAAABAE",
                            description: "")
        ]
    }
}
