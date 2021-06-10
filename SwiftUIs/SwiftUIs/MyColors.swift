//
//  MyColors.swift
//  SwiftUIs
//
//  Created by Cédric Bahirwe on 10/06/2021.
//  Copyright © 2021 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

public enum Green {
    static let green1 = Color(#colorLiteral(red: 0.011, green: 0.37, blue: 0.351, alpha: 1))
    
    static let darkGreen1 = Color(#colorLiteral(red: 0.003921568627, green: 0.1960784314, blue: 0.1254901961, alpha: 1))
}

public enum Violet {
    static let purple1 = Color(#colorLiteral(red: 0.332, green: 0.269, blue: 0.608, alpha: 1))

    static let darkPurple1 = Color(#colorLiteral(red: 0.201, green: 0.238, blue: 0.58, alpha: 1))
    static let darkPurple5 = Color(#colorLiteral(red: 0.05, green: 0.062, blue: 0.118, alpha: 1))
}


extension Color {
    init(color: Green){
        color
        self.init("color")
    }
}
