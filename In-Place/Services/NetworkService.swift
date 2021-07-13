//
//  NetworkService.swift
//  In-Place
//
//  Created by Иван Карамазов on 10.07.2021.
//

import Foundation

class NetworkService {
    
    // Я хочу чтобы NetworkService был доступен из любого участка кода
    // эта переменная содержит один экземпляр класса NetworkService
    // у меня будет один объект NetworkService для всех View Controller.
    static let shared = NetworkService()
    
    let placesURL = "https://gist.githubusercontent.com/alex-zykov/1d649549408ad875250d2789ca72e937/raw/c3a8437e47f0d8ba365ef426a0fa7502cd873248/posts.json"
    
    func getPlaces(completionHandler: (([Places]?) -> Void)?) {
        httpGet(placesURL, completionHandler: completionHandler)
    }
   
    
    private func httpGet<T: Decodable>(_ url:String, completionHandler : ((T?) -> Void)?)  {
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { [self]
            (data, response, error) in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard let data = data else { return }
            //print(String(decoding: data, as: UTF8.self))
            
            let place: T? = self.parseJSON(data: data)
            //print(place[0].placeName)
            completionHandler?(place)

        })
        task.resume()
    }
    
    
   private func parseJSON<T: Decodable>(data: Data) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let type = T.self
        do {
            return try decoder.decode(type, from: data)
        } catch let error as NSError {
            print(String(describing: error))
        }
        
        return nil
    }
    
    private init() {}
}
