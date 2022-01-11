//
//  FilmsAPI.swift
//  AlhanoufAlghayhab_MVCInIOS
//
//  Created by administrator on 18/10/2021.
//

import Foundation

class Filmsapi
{
    
static func getAllFilms(completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
    
    let url = URL(string: "https://swapi.dev/api/films/?format=json")
           
    let session = URLSession.shared
          
               
    
    let task = session.dataTask(with: url!, completionHandler: completionHandler)

          
           task.resume()
   }
}
