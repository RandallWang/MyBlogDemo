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
import Alamofire

class RxSwiftViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var newItems = Variable<[NewsModel]>([])
    var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNewsItems()

    }

    deinit {
        print("RxSwift VC Deinit")
    }
    
    func loadNewsItems() {
        
        tableView.reloadData()
    }

}

extension RxSwiftViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newItems.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
}
