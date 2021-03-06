//
//  CRUDRepository.swift
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

/// It is needed to be considered a *CRUD Repository* and includes **C**reate, **R**ead, **U**pdate and **D**elete methods.
public protocol CRUDRepository: Repository {
    
    // MARK: - Create
    /**
     Creates an entity in the repository.
     
     - Parameter entity: A `Dictionary` that will initialize the entity.
     
     - Returns: A promise of `Entity`.
     */
    func create(_ entity: Dictionary<String, Any>) -> Promise<Entity>
    
    // MARK: - Read
    /**
     Searches all entities in the repository.
     
     - Returns: A promise of an `Array` of `Entity`.
     */
    func search() -> Promise<[Entity]>
    
    // MARK: - Update
    /**
     Updates an entity in the repository.
     
     - Parameter entity: A reference of the entity to be updated.
     
     - Returns: A promise of `Entity`.
     */
    func update(_ entity: Entity) -> Promise<Entity>
    
    // MARK: - Delete
    /**
     Deletes an entity in the repository.
     
     - Parameter entity: A reference of the entity to be deleted.
     
     - Returns: A promise of `Void`.
     */
    func delete(_ entity: Entity) -> Promise<Void>
    
}
