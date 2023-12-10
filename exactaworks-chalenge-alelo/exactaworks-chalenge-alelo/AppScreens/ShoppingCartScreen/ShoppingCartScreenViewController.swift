//
//  ShoppingCartScreenViewController.swift
//  exactaworks-chalenge-alelo
//
//  Created by Ygor Nascimento on 08/12/23.
//

import UIKit

final class ShoppingCartScreenViewController: UIViewController {
    
    private let bottomView = ShoppingCartSumUpView()
    private var viewModel = HomeScreenViewModel()
    
    
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.cellReuseIdentifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Carrinho de Compras"
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        view.addSubview(bottomView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        let deviceScreenBounds = UIScreen.main.bounds
        let bottomViewHeightConstant = deviceScreenBounds.height * 0.200

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            bottomView.heightAnchor.constraint(equalToConstant: bottomViewHeightConstant),
            bottomView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension ShoppingCartScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.cellReuseIdentifier, for: indexPath)
            as? HomeTableViewCell else { return UITableViewCell() }
        
        viewModel.cellIndex = indexPath.row
        
        let imageUrl = viewModel.imageUrl
        cell.configureWith(viewModel: viewModel, imageUrl: imageUrl)
        
        return cell
    }
}
