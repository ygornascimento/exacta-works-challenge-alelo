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
        tableView.tableFooterView = footerView
        return tableView
        }()
    
    private lazy var footerView: UIView = {
        let view = UIView()
        view.frame.size.height = 100
        view.backgroundColor = #colorLiteral(red: 0.9214109778, green: 0.9214110374, blue: 0.9214110374, alpha: 1)
        return view
    }()
    
    private let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.color = .green
        indicator.style = .large
        return indicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadingIndicator.startAnimating()
        getData()
        setupTableView()
    }
    
    private func getData() {
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

        let navigationLogoImage = UIImage(named: "NavigationControllerLogoImage")
        let imageView = UIImageView(image: navigationLogoImage)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
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

