//
//  RKRepository.swift
//
//  Copyright (c) 2016 Luciano Polit <lucianopolit@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

/// It is needed to be considered a *Repository*.
public protocol RKRepository {
    
    /// The associated entity type.
    associatedtype Entity
    
}

/// It is needed to be considered a *Networking Repository*.
public protocol RKNetworkingRepository: RKRepository {
    
    /// The object that will make the HTTP requests.
    var networking: RKNetworking { get }
    
    /// The url of the server.
    var url: String { get }
    
}

/// It is needed to be considered a *Storage Repository*.
public protocol RKStorageRepository: RKRepository {
    
    /// The object that will manage the local storage.
    var storage: RKStorage { get }
    
    /// The name of the entity of the model.
    var name: String { get }
    
}