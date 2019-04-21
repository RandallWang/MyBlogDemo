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
    
    var vm: BehaviorRelay<NewsFeedViewModel> = BehaviorRelay(value: NewsFeedViewModel.empty)
    
    var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        setUpTableView()
        loadNewsItems()
        observeViewModel()
    }

    deinit {
        print("RxSwift VC Deinit")
    }
    
    func loadNewsItems() {
        NewsDataManager.shared.requestNewsData()
            .map{NewsFeedViewModel(newsFeed: $0.articles)}
            .bind(to: self.vm)
            .disposed(by: bag)
    }
    
    func observeViewModel() {
        vm.subscribe(onCompleted:{
            self.tableView.reloadData()
        }).disposed(by: bag)
    }

    func setNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Settings", style: .plain, target: self, action: #selector(gotoSetting))
    }
    
    func setUpTableView() {
        tableView.register(UINib.init(nibName: "RxNewsTableViewCell", bundle: nil), forCellReuseIdentifier: "RxNewsTableViewCell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
        return vm.value.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RxNewsTableViewCell", for: indexPath) as? RxNewsTableViewCell else {return UITableViewCell()}
        
        let newsViewModel = vm.value.viewModel(for: indexPath.row)
        cell.configure(with: newsViewModel)
        
        return cell
    }
}

extension RxSwiftViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsViewModel = vm.value.viewModel(for: indexPath.row)
        performSegue(withIdentifier: "ToWebNews", sender: newsViewModel)
    }
}
