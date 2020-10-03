//
//  Vector.swift
//  VisionTest2
//
//  Created by gary on 03/10/2020.
//

import Foundation


struct Vector {
    let x: Double
    let y: Double
    let length = 2


    func distanceTo(_ other: Vector) -> Double {
        let dx = x - other.x
        let dy = y - other.y
        return hypot(dx, dy)
    }


    static let zero = Vector(x: 0, y: 0)


    static func + (lhs: Vector, rhs: Vector) -> Vector {
        Vector(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }


    static func / (lhs: Vector, rhs: Double) -> Vector {
        Vector(x: lhs.x / rhs, y: lhs.y / rhs)
    }
}
