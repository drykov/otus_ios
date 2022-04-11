//
//  InjectWrapper.swift
//  
//
//  Created by Dmitry Rykov on 10.04.2022.
//

import Foundation

@propertyWrapper
public struct Inject<T> {
    
    private var service: T?
    
    public init() {
        service = ServiceLocator.shared.resolve()
    }
    
    public var wrappedValue: T? {
        get { return service }
        mutating set { service = newValue }
    }
}
