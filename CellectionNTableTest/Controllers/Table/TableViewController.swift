
import UIKit

final class TableViewController: UIViewController {
    
    private lazy var tableWidth = table.frame.width
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .customGray
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.text = "Таблица с котиками"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var table: UITableView = {
        let table = UITableView()
        table.register(TableCell.self,
                       forCellReuseIdentifier: TableCell.identifier)
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.delegate = self
        table.dataSource = self
        table.layer.cornerRadius = 16
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        view.backgroundColor = .light
        view.addSubview(titleLabel)
        view.addSubview(table)
        
        [titleLabel, table].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: table.topAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension TableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool { false }
}

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Constants.cats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.identifier) as? TableCell
        else {
            return UITableViewCell()
        }
        cell.configure(with: Constants.cats[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { tableWidth }
}
