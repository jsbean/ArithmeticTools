//
//  Equatable.swift
//  ArrayTools
//
//  Created by James Bean on 2/19/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    
    /**
    - parameter element: Element for which to check frequency

    - returns: Frequency of Element in Array
    */
    public func amountOf(element: Element) -> Int {
        
        func amountOf(element: Element, inArray array: [Element], var accum: Int) -> Int {
            guard let (head, tail) = array.destructured else { return accum }
            if head == element { accum += 1 }
            return amountOf(element, inArray: tail, accum: accum)
        }
        
        return amountOf(element, inArray: self, accum: 0)
    }
    
    /**
    Extract all instances of Element in Array

    - parameter element: Element to extract

    - returns: 2-tuple of extracted elements, and leftovers
    */
    public func extractAllOf(element: Element) -> ([Element], [Element]) {
        
        func remove(element: Element,
            fromArray array: [Element],
            var leftovers: [Element],
            var extracted: [Element]
        ) -> ([Element], [Element])
        {
            guard let (head, tail) = array.destructured else { return (extracted, leftovers) }
            if head == element { extracted = extracted + head }
            else { leftovers = leftovers + head }
            return remove(element, fromArray: tail, leftovers: leftovers, extracted: extracted)
        }
        
        return remove(element, fromArray: self, leftovers: [], extracted: [])
    }
    
    /**
    Sort the contents of an Array with the order of contents in another Array

    - parameter array: Array containing the desired order of Elements

    - returns: Array of elements sorted with the desired order
    */
    public func sortWithOrderOfContentsIn(array: [Element]) -> [Element] {
        
        func appendMatchesOf(element: Element,
            fromArray array: [Element],
            toArray result: [Element]
        ) -> ([Element],[Element])
        {
            let (leftovers, matches) = array.extractAllOf(element)
            return (result + matches, leftovers)
        }
        
        func sortArray(array: [Element],
            withOrderOfContentsInArray reference: [Element],
            intoArray result: [Element]
        ) -> [Element]
        {
            guard let (head, tail) = reference.destructured else { return result + array }
            let (sorted, source) = appendMatchesOf(head, fromArray: array, toArray: result)
            return sortArray(source, withOrderOfContentsInArray: tail, intoArray: sorted)
        }
        
        return sortArray(self, withOrderOfContentsInArray: array, intoArray: [])
    }
    
    /**
    Create a 2-tuple containing duplicates extracted from the array, and the leftover Elements

    - returns: (extracted duplicates, leftovers)
    */
    public func extractDuplicates() -> ([Element], [Element]) {
        
        func extractDuplicatesFrom(array: [Element],
            var duplicates: [Element],
            var leftovers: [Element]
        ) -> ([Element], [Element])
        {
            guard let (head, tail) = array.destructured else { return (duplicates, leftovers) }
            if leftovers.contains(head) { duplicates.append(head) }
            else { leftovers.append(head) }
            return extractDuplicatesFrom(tail, duplicates: duplicates, leftovers: leftovers)
        }
        
        return extractDuplicatesFrom(self, duplicates: [], leftovers: [])
    }
    
    /// Array of Elements containing only single instances of any Element
    public var unique: [Element] {
        
        func extractUniqueValuesFrom(array: [Element], var to result: [Element]) -> [Element] {
            guard let (head, tail) = array.destructured else { return result }
            if !result.contains(head) { result.append(head) }
            return extractUniqueValuesFrom(tail, to: result)
        }
        
        return extractUniqueValuesFrom(self, to: [])
    }
    
    /**
    Get index of equatable value type in Array

    - parameter value: Value for index to be found

    - returns: Index of value, if present
    */
    func indexOf(value: Element) -> Int? {
        for (index, el) in self.enumerate() { if el == value { return index } }
        return nil
    }
    
    /**
    Replace element with new element

    - parameter element:    Element to be replaced, if present in Array
    - parameter newElement: New element to replace given element
    */
    mutating func replace(element: Element, withElement newElement: Element) {
        if let index = indexOf(element) {
            removeAtIndex(index)
            insert(element, atIndex: index)
        }
    }
}
