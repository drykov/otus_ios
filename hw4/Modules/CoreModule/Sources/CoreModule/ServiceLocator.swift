//
//  ServiceLocator.swift
//  
//
//  Created by Dmitry Rykov on 10.04.2022.
//

import Foundation

public class ServiceLocator {
    
    public static let shared = ServiceLocator()
    
    private var services = [String: Any]()
    
    public func register<T>(service: T) {
        let key = String(describing: T.self)
        services[key] = service
    }
    
    public func resolve<T>() -> T? {
        let key = String(describing: T.self)
        return services[key] as? T
    }
}
