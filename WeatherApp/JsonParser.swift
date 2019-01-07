//
//  JsonParser.swift
//  WeatherApp
//
//  Created by Nikolay on 26/12/2018.
//  Copyright © 2018 Rubs and CO. All rights reserved.
//

import Foundation

class JsonParser <T: Decodable> {
    
    private var inpputJson : Data  //variale for input data
    private var outputType : T.Type // type of structure to parse data
    private (set) var output: T? = nil //variale for output data
    
    init(inpputJson: Data, outputType: T.Type) {
        self.inpputJson = inpputJson
        self.outputType = outputType
        self.output = decodeJson()
    }
    
    private func decodeJson () -> T?{
        let decoder = JSONDecoder()
        let mydata = try? decoder.decode(T.self, from: inpputJson)
        return mydata
    }
}

//import Foundation
//
//class JsonParser {
//
//    func decodeJson <T: Decodable> (outputType: T.Type, inpputJson: Data) -> T{
//
//        let decoder = JSONDecoder()
//
//        let mydata = try? decoder.decode(T.self, from: inpputJson)
//
//        return mydata!
//    }
//
//
//    func getData <T: Decodable> (type: T.Type, inpputJson: Data) -> T {
//
//        let outputData = decodeJson(outputType: T.self, inpputJson: inpputJson)
//
//        return outputData
//    }
//}
