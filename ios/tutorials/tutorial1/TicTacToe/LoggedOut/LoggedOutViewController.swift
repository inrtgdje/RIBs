//
//  LoggedOutViewController.swift
//  TicTacToe
//
//  Created by 汤天明 on 6/18/20.
//  Copyright © 2020 Uber. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import  SnapKit
protocol LoggedOutPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func login(withPlayer1Name player1Name:String?,player2Name:String?)
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    
    weak var listener: LoggedOutPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let playerFields = buildPlayerFields()
        buildLoginButton(withPlayer1Field: playerFields.0, player2Field: playerFields.1)
    }
    
    // MARK: - private
    private var player1Field: UITextField?
    private var player2Field: UITextField?
    
    private func buildPlayerFields() -> (player1Field:UITextField,player2Field:UITextField){
        
        let player1Field = UITextField()
        self.player1Field = player1Field
        player1Field.borderStyle = .line
        view.addSubview(player1Field)
        player1Field.placeholder = "Player 1 name"
        
        player1Field.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.view).offset(100)
            maker.leading.trailing.equalTo(self.view).inset(40)
            maker.height.equalTo(44)
        }
        let player2Field = UITextField()
        self.player2Field = player2Field
        player2Field.borderStyle = .line
        player2Field.placeholder = "player 2 name"
        view.addSubview(player2Field)
        player2Field.snp.makeConstraints { (maker) in
            maker.top.equalTo(player1Field.snp.bottom).offset(20)
            maker.left.right.height.equalTo(player1Field)
               }
        return (player1Field,player2Field)
    }
    
    
    private func buildLoginButton(withPlayer1Field player1Field:UITextField,player2Field:UITextField){
        let loginButton = UIButton()
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(player2Field.snp.bottom).offset(20)
            maker.left.right.height.equalTo(player1Field)
        }
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setTitleColor(.darkGray, for: .highlighted)
        loginButton.backgroundColor = .black
        
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }
    
    
    @objc private func didTapLoginButton(){
        
        listener?.login(withPlayer1Name: player1Field?.text, player2Name: player2Field?.text)
    }
    
}
