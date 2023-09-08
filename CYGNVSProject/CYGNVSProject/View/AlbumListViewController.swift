//
//  AlbumListViewController.swift
//  CYGNVSProject
//
//  Created by Vinitha Rao A on 08/09/23.
//

import UIKit

class AlbumListViewController: UIViewController {
    
    var viewModel = AlbumViewModel()
    
    //MARK: - View Related
    private var searchBar = UISearchBar()
    private var tableView = UITableView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        tableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
        tableView.backgroundColor = UIColor.white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.register(AblumListTableViewCell.self, forCellReuseIdentifier: "TableCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)

        let views = ["tableView": tableView]
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|[tableView]|", options: [], metrics: nil, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|[tableView]|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(constraints)
        
        self.viewModel.getData() {
            [weak self] isCompleted in
            if isCompleted {
                self?.tableView.reloadData()
            }
        }
    }
}

extension AlbumListViewController: UITableViewDelegate {
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = self.viewModel.dataModel.albumList[indexPath.row]
        let detailViewController = AlbumDetailViewController()
        detailViewController.viewModel.setDataFromListView(albumDataFromList: data)
        detailViewController.textFieldTappedClosure = { [weak self] (title) in
                guard let self = self else { return }
            self.viewModel.dataModel.albumList[indexPath.row].title = title
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        self.navigationController?.pushViewController(detailViewController, animated: true)

    }
}

extension AlbumListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataModel.albumList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = self.viewModel.dataModel.albumList[indexPath.row]
        let cell = AblumListTableViewCell(style: .default, reuseIdentifier: "ListCell")
        cell.setDataInCellContent(data: data)
        cell.layoutSubviews()
        return cell
    }
    
}

