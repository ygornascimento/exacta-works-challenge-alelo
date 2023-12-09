//
//  ViewController.swift
//  exactaworks-chalenge-alelo
//
//  Created by Ygor Nascimento on 07/12/23.
//

import UIKit

class HomeViewController: UIViewController {

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
    
    private let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.color = .gray
        indicator.style = .large
        return indicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        setupTableView()
        setupNavigationController()
        self.title = "Lista de Produtos"
    }
    
    private func getData() {
        loadingIndicator.startAnimating()
        let productsData = DataService.loadJson(filename: "mock")
        guard let products = productsData?.products else { return }
        viewModel.products.append(contentsOf: products)
        loadingIndicator.stopAnimating()
    }
    
    private func setupNavigationController() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let menuItems = UIMenu(title: " ", options: .displayInline, children: [
            UIAction(title: "Produtos em promoção",
                     handler: { _ in
                         self.viewModel.filterOnlyPromotionItems()
                         self.tableView.reloadData()
                     }),
            
            UIAction(title: "Todos os Produtos",
                     handler: { _ in
                         self.viewModel.products = []
                         self.getData()
                         self.tableView.reloadData()
                    })
        ])
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.decrease.circle"), menu: menuItems)
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        view.addSubview(loadingIndicator)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
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

