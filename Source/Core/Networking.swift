//
//  Networking.swift
//
//  Copyright (c) 2016-2017 Luciano Polit <lucianopolit@gmail.com>
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

import PromiseKit

// MARK: - Main
/// It is needed to be considered a *Networking Recipe* by a *Repository*.
public protocol Networking {
    
    /// The url of the server.
    var url: String { get }
    
    /**
     Creates a promise with the response of a request for the specified method, url, parameters and headers.
     
     - Parameter method: The HTTP method.
     - Parameter path: The path of the URL.
     - Parameter parameters: The parameters.
     - Parameter headers: The HTTP headers.
     
     - Returns: A promise of `Any`.
     */
    func request(method: HTTPMethod, path: String, parameters: Dictionary<String, Any>?, headers: Dictionary<String, String>?) -> Promise<Any>
    
}

// MARK: - Util
extension Networking {
    
    /**
     Creates a promise with the response of a request for the specified method, url, parameters and headers.
     
     - Parameter method: The HTTP method.
     - Parameter path: The path of the URL.
     - Parameter parameters: The parameters (nil by default).
     - Parameter headers: The HTTP headers (nil by default).
     
     - Returns: A promise of `DictionaryEntity`.
     */
    public func request(method: HTTPMethod, path: String, parameters: Dictionary<String, Any>? = nil, headers: Dictionary<String, String>? = nil) -> Promise<DictionaryEntity> {
        
        return request(method: method, path: path, parameters: parameters, headers: headers)
            .then { (result: Any) in
                Promise { success, failure in
                    guard let value = result as? DictionaryEntity else {
                        failure(RKError.casting)
                        return
                    }
                    success(value)
                }
        }
        
    }
    
    
    /**
     Creates a promise with the response of a request for the specified method, url, parameters and headers.
     
     - Parameter method: The HTTP method.
     - Parameter path: The path of the URL.
     - Parameter parameters: The parameters (nil by default).
     - Parameter headers: The HTTP headers (nil by default).
     
     - Returns: A promise of an `Array` of `DictionaryEntity`.
     */
    public func request(method: HTTPMethod, path: String, parameters: Dictionary<String, Any>? = nil, headers: Dictionary<String, String>? = nil) -> Promise<[DictionaryEntity]> {
        
        return request(method: method, path: path, parameters: parameters, headers: headers)
            .then { (result: Any) in
                Promise { success, failure in
                    guard let value = result as? [DictionaryEntity] else {
                        failure(RKError.casting)
                        return
                    }
                    success(value)
                }
        }
        
    }
    
    /**
     Creates a promise with the response of a request for the specified method, url, parameters and headers.
     
     - Parameter method: The HTTP method.
     - Parameter path: The path of the URL.
     - Parameter parameters: The parameters (nil by default).
     - Parameter headers: The HTTP headers (nil by default).
     
     - Returns: A promise of `Void`.
     */
    public func request(method: HTTPMethod, path: String, parameters: Dictionary<String, Any>? = nil, headers: Dictionary<String, String>? = nil) -> Promise<Void> {
        
        return request(method: method, path: path, parameters: parameters, headers: headers)
            .then { (result: Any) -> Void in }
        
    }
    
}
