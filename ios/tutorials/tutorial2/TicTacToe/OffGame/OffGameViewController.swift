//
//  OffGameViewController.swift
//  TicTacToe
//
//  Created by 汤天明 on 6/18/20.
//  Copyright © 2020 Uber. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import SnapKit
protocol OffGamePresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func startGame()
    
}

final class OffGameViewController: UIViewController, OffGamePresentable, OffGameViewControllable {
    var uiviewController: UIViewController {
        return self
    }
    weak var listener: OffGamePresentableListener?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        buildStartButton()
    }
    
    
    private func buildStartButton(){
        
        let startButton = UIButton()
        view.addSubview(startButton)
        startButton.setTitle("Start Game", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.backgroundColor = .black
        
        startButton.snp.makeConstraints { (maker) in
            maker.center.equalTo(self.view.snp.center)
            maker.leading.trailing.equalTo(self.view).inset(40)
            maker.height.equalTo(100)
        }
        startButton.rx.tap.subscribe(onNext:{
            [weak self] in
            self?.listener?.startGame()
            
        }).disposed(by: DisposeBag())
        
    
    }
    
         
    
}
