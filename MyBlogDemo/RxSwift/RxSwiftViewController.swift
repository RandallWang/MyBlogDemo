//
//  RxSwiftViewController.swift
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/1/22.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RxSwiftViewController: UIViewController {

    let firstNameTextFielde: UITextField = UITextField.init(frame: CGRect.init(x: 20, y: 10, width: 100, height: 40))
    let lastNameTextFielde: UITextField = UITextField.init(frame: CGRect.init(x: 20, y: 70, width: 100, height: 40))
    
    let nameLabel: UILabel = UILabel.init(frame: CGRect.init(x: 20, y: 130, width: 200, height: 40))
    
//    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(firstNameTextFielde)
        view.addSubview(lastNameTextFielde)
        view.addSubview(nameLabel)
        
        firstNameTextFielde.borderStyle = .roundedRect
        lastNameTextFielde.borderStyle = .roundedRect
        
        view.backgroundColor = UIColor.white

        Observable<String>.combineLatest(firstNameTextFielde.rx.text, lastNameTextFielde.rx.text) { "\($0 ?? "") \($1 ?? "")" }
            .map{"Greetings , \($0)"}
            .bind(to: nameLabel.rx.text)
            .dispose()
//            .disposed(by: disposeBag)
    }

    deinit {
        print("RxSwift VC Deinit")
    }

}

