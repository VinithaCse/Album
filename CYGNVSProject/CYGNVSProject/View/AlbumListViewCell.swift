//
//  AlbumListViewCell.swift
//  CYGNVSProject
//
//  Created by Vinitha Rao A on 08/09/23.
//

import UIKit

class AblumListTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "\(AblumListTableViewCell.self)"
    
    private lazy var labelWithText: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var verticlStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.addArrangedSubview(labelWithText)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var holderView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(verticlStackView)
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.black.cgColor
        let viewDict: [String : Any] = ["view": verticlStackView]
        var constraints = [NSLayoutConstraint]()
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[view]-10-|", options: [], metrics: nil, views: viewDict))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[view]-10-|", options: [], metrics: nil, views: viewDict))
        NSLayoutConstraint.activate(constraints)
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        backgroundColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
    func setDataInCellContent(data: AlbumModel) {
        
        self.labelWithText.text = data.title
        self.addViewsToCell()
    }
    
    func addViewsToCell() {
        
        self.contentView.addSubview(holderView)

        let viewDict: [String : Any] = ["view": holderView]
        var constraints = [NSLayoutConstraint]()
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[view]-10-|", options: [], metrics: nil, views: viewDict))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[view]-10-|", options: [], metrics: nil, views: viewDict))
        NSLayoutConstraint.activate(constraints)

    }
    
}



