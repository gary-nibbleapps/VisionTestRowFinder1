//
//  RowFinder.swift
//  VisionTest2
//
//  Created by gary on 03/10/2020.
//

import Foundation

protocol Item {
    var bottomY: CGFloat { get }
}

protocol RowFinder {
    func rows(from results: [Item]) -> [[Item]]
}