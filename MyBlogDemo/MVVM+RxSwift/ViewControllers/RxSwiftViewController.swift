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
    
    @IBOutlet weak var tableView: UITableView!
    
    var vm: NewsFeedViewModel? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
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
                self.vm = NewsFeedViewModel(newsFeed: items)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("sss")
        guard let vm = sender as? NewsViewModel else { return }
        if let webNewsVC = segue.destination as? WebNewsViewController {
            webNewsVC.vm = vm
        }
    }
    
    @objc private func gotoSetting() {
        let settingVC = RxSettingViewController()
        navigationController?.pushViewController(settingVC, animated: true)
    }
}

extension RxSwiftViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RxNewsTableViewCell", for: indexPath) as? RxNewsTableViewCell else {return UITableViewCell()}
        
        if let newsViewModel = vm?.viewModel(for: indexPath.row) {
            cell.configure(with: newsViewModel)
        }
        
        return cell
    }
}

extension RxSwiftViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let newsViewModel = vm?.viewModel(for: indexPath.row) {
            performSegue(withIdentifier: "ToWebNews", sender: newsViewModel)
        }
    }
}
