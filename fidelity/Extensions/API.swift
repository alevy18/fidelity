//
//  API.swift
//  fidelity
//
//  Created by Aaron Levy on 4/23/21.
//

import Foundation



protocol APIHandler {
    func fetchAnimeFromUrl(url: String) -> [AnimeModel]?
    func getImageData(url: String, completionHandler: (Data)->())
    func getURLRequest(urlString: String) -> URLRequest?
}

extension APIHandler {
    
    func fetchAnimeFromUrl(url: String) -> [AnimeModel]?{
        
        if let url = URL.init(string: url){
            do{
                let data = try Data.init(contentsOf: url)
                let jd = JSONDecoder.init()
                let received = try jd.decode(ReceivedStuff.self, from: data)
                return received.results
            }catch{
                print(error)
            }
        }
        return nil
    }
    
    
    
    func getImageData(url: String, completionHandler: (Data)->()) {
        guard let url = URL.init(string: url) else {
            return
        }
        do {
            let data = try Data.init(contentsOf: url)
            completionHandler(data)
        }catch{
            print(error)
        }
    }
    
    func getURLRequest(urlString: String) -> URLRequest?{
        guard let url = URL.init(string: urlString) else {return nil}
        let request = URLRequest.init(url: url)
        return request
    }
    
}



