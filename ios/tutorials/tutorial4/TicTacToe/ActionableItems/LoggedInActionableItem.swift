//
//  LoggedInActionableItem.swift
//  TicTacToe
//
//  Created by 汤天明 on 6/22/20.
//  Copyright © 2020 Uber. All rights reserved.
//

import RxSwift

 public protocol LoggedInActionableItem: class {
    func launchGame(with id: String?) -> Observable<(LoggedInActionableItem, ())>
}
