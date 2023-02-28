//
//  Extension.swift
//  MovieApp
//
//  Created by Dian Noery on 31/01/23.
//

import Foundation

extension String {
    func containsIgnoringCase(_ anotherString: String) -> Bool {
        return self.range(of: anotherString, options: NSString.CompareOptions.caseInsensitive) != nil
    }
}
