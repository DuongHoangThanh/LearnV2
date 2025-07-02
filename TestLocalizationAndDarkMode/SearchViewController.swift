import UIKit

class HomeViewController: UIViewController {

    let searchContainer = UIView()
    let searchBar = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupSearchBar()
    }

    func setupSearchBar() {
        searchContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchContainer)

        NSLayoutConstraint.activate([
            searchContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            searchContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchContainer.heightAnchor.constraint(equalToConstant: 40)
        ])

        searchContainer.backgroundColor = .red
        searchContainer.layer.cornerRadius = 10

        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.setTitle("Search something...", for: .normal)
        searchBar.setTitleColor(.gray, for: .normal)
        searchBar.contentHorizontalAlignment = .left
        searchBar.addTarget(self, action: #selector(openSearch), for: .touchUpInside)

        searchContainer.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: searchContainer.leadingAnchor, constant: 8),
            searchBar.trailingAnchor.constraint(equalTo: searchContainer.trailingAnchor, constant: -8),
            searchBar.topAnchor.constraint(equalTo: searchContainer.topAnchor),
            searchBar.bottomAnchor.constraint(equalTo: searchContainer.bottomAnchor)
        ])
    }

    @objc func openSearch() {
        let searchVC = SearchViewController()
        searchVC.modalPresentationStyle = .fullScreen
        searchVC.startingFrame = searchContainer.convert(searchContainer.bounds, to: nil)
        present(searchVC, animated: false, completion: nil)
    }
}


// MARK: - SearchViewController

class SearchViewController: UIViewController {

    var startingFrame: CGRect = .zero

    let backgroundView = UIView()
    let searchContainer = UIView()
    let searchBar = UISearchBar()
    let cancelButton = UIButton(type: .system)
    var hasAnimated = false

    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundView.frame = view.bounds
        backgroundView.backgroundColor = .systemBackground
        view.addSubview(backgroundView)

        setupSearchBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundView.backgroundColor = .white
            
            self.searchContainer.frame = CGRect(x: 16, y: 60, width: self.view.bounds.width - 100, height: 40)
            
            
            NSLayoutConstraint.activate([
                self.searchBar.leadingAnchor.constraint(equalTo: self.searchContainer.leadingAnchor, constant: 8),
                self.searchBar.trailingAnchor.constraint(equalTo: self.searchContainer.trailingAnchor, constant: -8),
                self.searchBar.topAnchor.constraint(equalTo: self.searchContainer.topAnchor),
                self.searchBar.bottomAnchor.constraint(equalTo: self.searchContainer.bottomAnchor)
            ])
        }) { _ in
            UIView.animate(withDuration: 0.15) {
                
                self.cancelButton.alpha = 1
            }
        }
        
    }

    func setupSearchBar() {
        searchContainer.frame = startingFrame
        searchContainer.backgroundColor = .red
        searchContainer.layer.cornerRadius = 10
        view.addSubview(searchContainer)

        searchBar.placeholder = "Search something..."
        searchBar.searchBarStyle = .minimal
        searchBar.translatesAutoresizingMaskIntoConstraints = false

        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.systemBlue, for: .normal)
        cancelButton.alpha = 0
        self.cancelButton.frame = CGRect(x: self.view.bounds.width - 80, y: 60, width: 64, height: 40)
        cancelButton.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)

        searchContainer.addSubview(searchBar)
        view.addSubview(cancelButton)
    }

    @objc func dismissSelf() {
        UIView.animate(withDuration: 0.15, animations: {
            self.cancelButton.alpha = 0
        })
        
        UIView.animate(withDuration: 0.25, animations: {
            self.backgroundView.backgroundColor = .white
            self.searchContainer.frame = self.startingFrame
        }) { _ in
            self.dismiss(animated: false, completion: nil)
        }
    }
}
