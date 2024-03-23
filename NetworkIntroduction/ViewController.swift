import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let manager = NetworkManager.shared
    
    var currencies = [Currency]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.getCurrencies { response in
            self.currencies = response.data
        }
        setUI()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let name = currencies[indexPath.row].name
        let rank = currencies[indexPath.row].rank
        let symbol = currencies[indexPath.row].symbol
        let price = currencies[indexPath.row].priceUsd
//        let price2 = price.split(separator: ".")
        cell.textLabel?.text = "\(rank) \(symbol) \(price)"
        return cell
    }
}

