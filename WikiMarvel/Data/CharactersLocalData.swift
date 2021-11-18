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
        let sample = [
            MarvelCharacter(name: "Abomination",
                            imageURL: "https://i.pinimg.com/564x/e8/da/c1/e8dac13b48ff7d3ec60bdef2ad17eb3b.jpg",
                            description: "Formerly known as Emil Blonsky, a spy of Soviet Yugoslavian origin working for the KGB, the Abomination gained his powers after receiving a dose of gamma radiation similar to that which transformed Bruce Banner into the incredible Hulk."),
            
            MarvelCharacter(name: "Avengers",
                            imageURL: //"https://s1.gaming-cdn.com/images/products/4836/orig/gioco-steam-marvels-avengers-cover.jpg",
                            "https://m.media-amazon.com/images/I/71FjI+8ewWL._SY606_.jpg",
                            description: "Earth's Mightiest Heroes joined forces to take on threats that were too big for any one hero to tackle. With a roster that has included Captain America, Iron Man, Ant-Man, Hulk, Thor, Wasp and dozens more over the years, the Avengers have come to be regarded as Earth's No. 1 team."),
            
            MarvelCharacter(name: "The Hulk",
                            imageURL: "https://m.media-amazon.com/images/I/61uVz5LOwOL._AC_SL1000_.jpg",
                            description: ""),
            
            MarvelCharacter(name: "SpiderMan",
                            imageURL: "https://i.pinimg.com/564x/2b/8d/34/2b8d34ab9bca22a40317221b991d29ac.jpg",
                            description: ""),
            
            MarvelCharacter(name: "WonderWoman",
                            imageURL: "https://pad.mymovies.it/filmclub/2015/11/167/locandina.jpg",
                            description: ""),
            
            MarvelCharacter(name: "Vision",
                            imageURL: "https://www.toyslife.it/sito/wp-content/uploads/queen-studios-marvel-infinity-war-vision-lifesize-bust-toyslife-icon.jpg",
                            description: "")
        ]
        
        return sample + sample + sample + sample + sample + sample + sample + sample + sample + sample + sample + sample + sample + sample
    }
}
