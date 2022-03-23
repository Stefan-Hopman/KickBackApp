//
//  DropDownButtonViewModel.swift
//  KickbackApp
//
//  Created by Joga Singh on 23/03/22.
//

import Foundation

final class DropDownButtonViewModel: ObservableObject {
    var item: DropDownItem?
    
    init() { }
    
    init(_ item: DropDownItem?) {
        self.item = item
    }
}
