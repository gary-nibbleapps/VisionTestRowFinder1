//
//  Clusters.swift
//  VisionTest2
//
//  Created by gary on 03/10/2020.
//

import Foundation


/// Cluster helper for KMeans.
struct Clusters {
    enum Label: CaseIterable {
        case one
        case two
    }

    private let largeLabel: Label


    static var labels: [Label] {
        Label.allCases
    }


    init(kMeans: KMeans<Clusters.Label>) {
        let l0 = kMeans.labels[0]
        let l1 = kMeans.labels[1]
        let c0 = kMeans.centroids[0]
        let c1 = kMeans.centroids[1]
        if c0.y > c1.y {
            largeLabel = l0
        } else {
            largeLabel = l1
        }
    }


    func isNewRow(_ label: Label) -> Bool {
        label == largeLabel
    }
}
