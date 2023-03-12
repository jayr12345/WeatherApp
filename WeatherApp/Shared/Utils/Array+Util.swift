//
//  Array+Util.swift
//  WeatherApp
//
//  Created by JayR Atamosa on 3/12/23.
//

import Foundation

protocol ArrayProtocol: RandomAccessCollection where Index == BaseCollection.Index {
    associatedtype BaseCollection: RandomAccessCollection
    var list: BaseCollection { get set }
    subscript(index: Index) -> Element { get }
}

extension ArrayProtocol {
    var startIndex: Index { list.startIndex }
    var endIndex: Index { list.endIndex }
    func formIndex(after indextAfter: inout Index) { list.index(after: indextAfter) }
    func formIndex(before indexBefore: inout Index) { list.index(before: indexBefore) }
}
