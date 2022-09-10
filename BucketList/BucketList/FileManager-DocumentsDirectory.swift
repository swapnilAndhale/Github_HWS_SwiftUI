//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by Swapnil on 10/09/22.
//

import Foundation

extension FileManager {
    static var documentDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
