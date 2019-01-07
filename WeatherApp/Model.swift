//
//  Model.swift
//  WeatherApp
//
//  Created by Nikolay on 20/12/2018.
//  Copyright © 2018 Rubs and CO. All rights reserved.
//

import Foundation

class Network {
    
    func getData(urlString: String, completion: @escaping (Data) ->()){// -> URLSessionDataTask?{
        
        let url = URL(string:urlString)
        
        DispatchQueue.global().async {
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil, data != nil else{
                print(error!.localizedDescription)
                return
            }
            
            DispatchQueue.main.async{completion(data!)}
            
        }
        task.resume()
            
            
        }
    }
}
