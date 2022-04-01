//
//  UserDefaults.swift
//  CallPortal
//
//  Created by Joga Singh on 28/02/22.
//

import Foundation

protocol ObjectSavable {
    func setObject<Object>(_ object: Object, forKey: UserDefaultKeys) throws where Object: Encodable
    func getObject<Object>(forKey: UserDefaultKeys, castTo type: Object.Type) throws -> Object where Object: Decodable
}

extension UserDefaults {
    
    /// Static global variable
    static let defaults = UserDefaults.standard
    
    /// Following method used to save values
    class func set(_ val: Any?, for key: UserDefaultKeys) {
        defaults.set(val, forKey: key.value)
        defaults.synchronize()
    }
    
    /// Following method used to get value from User default
    class func get<T>(for key: UserDefaultKeys) -> T? {
        return defaults.value(forKey: key.value) as? T
    }
}

extension UserDefaults: ObjectSavable {
    
    /// Custom Error enum
    enum ObjectSavableError: String, LocalizedError {
        case unableToEncode = "Unable to encode object into data"
        case noValue = "No data object found for the given key"
        case unableToDecode = "Unable to decode object into given type"
        
        var errorDescription: String? {
            rawValue
        }
    }
    
    /// Following method used to save object in user default
    func setObject<Object>(_ object: Object, forKey: UserDefaultKeys) throws where Object: Encodable {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            set(data, forKey: forKey.value)
        } catch {
            throw ObjectSavableError.unableToEncode
        }
    }
    
    /// Following method used to get object from User default
    func getObject<Object>(forKey: UserDefaultKeys, castTo type: Object.Type) throws -> Object where Object: Decodable {
        guard let data = data(forKey: forKey.value) else { throw ObjectSavableError.noValue }
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(type, from: data)
            return object
        } catch {
            throw ObjectSavableError.unableToDecode
        }
    }
}
