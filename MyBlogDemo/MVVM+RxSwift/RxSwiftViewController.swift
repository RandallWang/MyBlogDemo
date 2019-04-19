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

    var newsItems = BehaviorRelay<[NewsModel]>(value: [])
    var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        setUpTableView()
        loadNewsItems()
    }

    deinit {
        print("RxSwift VC Deinit")
    }
    
    func loadNewsItems() {
        NewsDataManager.shared.requestNewsData { (result) in
            switch result {
            case .success(let items):
                self.newsItems.accept(items)
                self.tableView.reloadData()
            case .failure(let error):
                print("\(error)")
            }
        }
    }

    func setNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Settings", style: .plain, target: self, action: #selector(gotoSetting))
    }
    
    func setUpTableView() {
        tableView.register(UINib.init(nibName: "RxNewsTableViewCell", bundle: nil), forCellReuseIdentifier: "RxNewsTableViewCell")
    }
    
    @objc private func gotoSetting() {
        let settingVC = RxSettingViewController()
        navigationController?.pushViewController(settingVC, animated: true)
    }
}

extension RxSwiftViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RxNewsTableViewCell", for: indexPath) as? RxNewsTableViewCell else {return UITableViewCell()}
        
        let vm = NewsViewModel(newsData: newsItems.value[indexPath.row])
        
        cell.configure(with: vm)
        
        return cell
    }
}

extension RxSwiftViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
