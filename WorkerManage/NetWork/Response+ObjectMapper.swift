//
//  Response+ObjectMapper.swift
//  REWallet
//
//  Created by zhangj on 2019/5/21.
//  Copyright © 2019 ruiec. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper

extension Response {
    
    /// Maps data received from the signal into an object which implements the Mappable protocol.
    /// If the conversion fails, the signal errors.
    func mapObject<T: BaseMappable>(_ type: T.Type, context: MapContext? = nil) throws -> T {
        guard let object = Mapper<T>(context: context).map(JSONObject: try mapJSON()) else {
            throw MoyaError.jsonMapping(self)
        }
        return object
    }
    
    /// Maps data received from the signal into an array of objects which implement the Mappable
    /// protocol.
    /// If the conversion fails, the signal errors.
    func mapArray<T: BaseMappable>(_ type: T.Type, context: MapContext? = nil) throws -> [T] {
        guard let array = try mapJSON() as? [[String : Any]] else {
            throw MoyaError.jsonMapping(self)
        }
        return Mapper<T>(context: context).mapArray(JSONArray: array)
    }
    
    /// Maps data received from the signal into an object which implements the Mappable protocol.
    /// If the conversion fails, the signal errors.
    func mapObject<T: BaseMappable>(_ type: T.Type, atKeyPath keyPath: String, context: MapContext? = nil) throws -> T {
        guard let object = Mapper<T>(context: context).map(JSONObject: (try mapJSON() as? NSDictionary)?.value(forKeyPath: keyPath)) else {
            throw MoyaError.jsonMapping(self)
        }
        return object
    }
    
    /// Maps data received from the signal into an array of objects which implement the Mappable
    /// protocol.
    /// If the conversion fails, the signal errors.
    func mapArray<T: BaseMappable>(_ type: T.Type, atKeyPath keyPath: String, context: MapContext? = nil) throws -> [T] {
        guard let array = (try mapJSON() as? NSDictionary)?.value(forKeyPath: keyPath) as? [[String : Any]] else {
            throw MoyaError.jsonMapping(self)
        }
        return Mapper<T>(context: context).mapArray(JSONArray: array)
    }
}


// MARK: - ImmutableMappable

public extension Response {
    
    /// Maps data received from the signal into an object which implements the ImmutableMappable
    /// protocol.
    /// If the conversion fails, the signal errors.
    func mapObject<T: ImmutableMappable>(_ type: T.Type, context: MapContext? = nil) throws -> T {
        return try Mapper<T>(context: context).map(JSONObject: try mapJSON())
    }
    
    /// Maps data received from the signal into an array of objects which implement the ImmutableMappable
    /// protocol.
    /// If the conversion fails, the signal errors.
    func mapArray<T: ImmutableMappable>(_ type: T.Type, context: MapContext? = nil) throws -> [T] {
        guard let array = try mapJSON() as? [[String : Any]] else {
            throw MoyaError.jsonMapping(self)
        }
        return try Mapper<T>(context: context).mapArray(JSONArray: array)
    }
    
    /// Maps data received from the signal into an object which implements the ImmutableMappable
    /// protocol.
    /// If the conversion fails, the signal errors.
    func mapObject<T: ImmutableMappable>(_ type: T.Type, atKeyPath keyPath: String, context: MapContext? = nil) throws -> T {
        guard let object = Mapper<T>(context: context).map(JSONObject: (try mapJSON() as? NSDictionary)?.value(forKeyPath: keyPath)) else {
            throw MoyaError.jsonMapping(self)
        }
        return object
    }
    
    /// Maps data received from the signal into an array of objects which implement the ImmutableMappable
    /// protocol.
    /// If the conversion fails, the signal errors.
    func mapArray<T: ImmutableMappable>(_ type: T.Type, atKeyPath keyPath: String, context: MapContext? = nil) throws -> [T] {
        guard let array = (try mapJSON() as? NSDictionary)?.value(forKeyPath: keyPath) as? [[String : Any]] else {
            throw MoyaError.jsonMapping(self)
        }
        return try Mapper<T>(context: context).mapArray(JSONArray: array)
    }
    
}
