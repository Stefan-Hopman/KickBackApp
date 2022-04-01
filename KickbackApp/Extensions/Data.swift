//
//  ClassBooking.swift
//  KickbackApp
//
//  Created by Joga Singh on 01/04/22.
//

import UIKit

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

extension Data {
    
    var json: JSONDictionary? {
        return try? JSONSerialization.jsonObject(with: self, options: .fragmentsAllowed) as? JSONDictionary
    }
    
    // Generic function to convert data into codable model class
    func decode<T: Codable>() -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: self)
        } catch {
            print(error)
        }
        return nil
    }
    
    
    func model<T: Codable>() -> T? {
        do {
            return try newJSONDecoder().decode(T.self, from: self)
        } catch {
            print(error)
        }
        return nil
    }
   
}
