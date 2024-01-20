//
//  ViewController.swift
//  pizza-local
//
//  Created by Artur Igberdin on 20.01.2024.
//

import UIKit
import SnapKit

final class MenuVC: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .yellow
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseId)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
}

//MARK: - Layout
private extension MenuVC {
    private func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

//MARK: - TableView Datasource
extension MenuVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseId, for: indexPath) as? ProductCell else { return UITableViewCell() }
        
        return cell
    }
}

//MARK: - TableView Delegate
extension MenuVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#line)
    }
}
