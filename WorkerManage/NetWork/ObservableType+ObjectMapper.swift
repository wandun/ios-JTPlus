//
//  ObservableType+ObjectMapper.swift
//  REWallet
//
//  Created by zhangj on 2019/5/21.
//  Copyright © 2019 ruiec. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import ObjectMapper

/// Extension for processing Responses into Mappable objects through ObjectMapper
extension ObservableType where Element == Response {
    
    /// Maps data received from the signal into an object
    /// which implements the Mappable protocol and returns the result back
    /// If the conversion fails, the signal errors.
    func mapObject<T: BaseMappable>(_ type: T.Type, context: MapContext? = nil) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            return Observable.just(try response.mapObject(type, context: context))
        }
    }
    
    /// Maps data received from the signal into an array of objects
    /// which implement the Mappable protocol and returns the result back
    /// If the conversion fails, the signal errors.
    func mapArray<T: BaseMappable>(_ type: T.Type, context: MapContext? = nil) -> Observable<[T]> {
        return flatMap { response -> Observable<[T]> in
            return Observable.just(try response.mapArray(type, context: context))
        }
    }
    
    /// Maps data received from the signal into an object
    /// which implements the Mappable protocol and returns the result back
    /// If the conversion fails, the signal errors.
    func mapObject<T: BaseMappable>(_ type: T.Type, atKeyPath keyPath: String, context: MapContext? = nil) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            return Observable.just(try response.mapObject(T.self, atKeyPath: keyPath, context: context))
        }
    }
    
    /// Maps data received from the signal into an array of objects
    /// which implement the Mappable protocol and returns the result back
    /// If the conversion fails, the signal errors.
    func mapArray<T: BaseMappable>(_ type: T.Type, atKeyPath keyPath: String, context: MapContext? = nil) -> Observable<[T]> {
        return flatMap { response -> Observable<[T]> in
            return Observable.just(try response.mapArray(T.self, atKeyPath: keyPath, context: context))
        }
    }
}


// MARK: - ImmutableMappable
extension ObservableType where Element == Response {
    
    /// Maps data received from the signal into an object
    /// which implements the ImmutableMappable protocol and returns the result back
    /// If the conversion fails, the signal errors.
    func mapObject<T: ImmutableMappable>(_ type: T.Type, context: MapContext? = nil) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            return Observable.just(try response.mapObject(type, context: context))
        }
    }
    
    /// Maps data received from the signal into an array of objects
    /// which implement the ImmutableMappable protocol and returns the result back
    /// If the conversion fails, the signal errors.
    func mapArray<T: ImmutableMappable>(_ type: T.Type, context: MapContext? = nil) -> Observable<[T]> {
        return flatMap { response -> Observable<[T]> in
            return Observable.just(try response.mapArray(type, context: context))
        }
    }
    
    /// Maps data received from the signal into an object
    /// which implements the ImmutableMappable protocol and returns the result back
    /// If the conversion fails, the signal errors.
    func mapObject<T: ImmutableMappable>(_ type: T.Type, atKeyPath keyPath: String, context: MapContext? = nil) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            return Observable.just(try response.mapObject(T.self, atKeyPath: keyPath, context: context))
        }
    }
    
    /// Maps data received from the signal into an array of objects
    /// which implement the ImmutableMappable protocol and returns the result back
    /// If the conversion fails, the signal errors.
    func mapArray<T: ImmutableMappable>(_ type: T.Type, atKeyPath keyPath: String, context: MapContext? = nil) -> Observable<[T]> {
        return flatMap { response -> Observable<[T]> in
            return Observable.just(try response.mapArray(T.self, atKeyPath: keyPath, context: context))
        }
    }
}

