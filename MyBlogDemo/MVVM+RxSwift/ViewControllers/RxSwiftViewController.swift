//
//  RxSwiftViewController.swift
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/1/22.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

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
//       let newData = NewsDataManager.shared.requestNewsData()
//            .map{NewsFeedViewModel(newsFeed: $0.articles)}

//        newData.map(<#T##transform: (NewsFeedViewModel) throws -> R##(NewsFeedViewModel) throws -> R#>).subscribe(onNext:{
//            
//        })
    }

    func observeViewModel() {
//        vm.map(NewsFeedViewModel(newsFeed: $0))(
//            onNext:{
//                self.tableView.reloadData()
//        }).disposed(by: bag)
    }

    func setNavigationBar() {
//        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Settings", style: .plain, target: self, action: #selector(gotoSetting))
    }

    func setUpTableView() {
        tableView.register(UINib(nibName: "RxNewsTableViewCell", bundle: nil), forCellReuseIdentifier: "RxNewsTableViewCell")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vm = sender as? NewsViewModel else { return }
        if let webNewsVC = segue.destination as? WebNewsViewController {
            webNewsVC.vm = vm
        }
    }

    @objc private func presentUserInfo() {
    }

    @objc private func login() {
    }
}

extension RxSwiftViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.value.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RxNewsTableViewCell", for: indexPath) as? RxNewsTableViewCell else { return UITableViewCell() }

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
