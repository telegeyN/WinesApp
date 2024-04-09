//
//  ViewController.swift
//  WinesApp
//
//  Created by Telegey Nurbekova on 09/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let wineService = WineService.shared
    
    private var wines: [Wine] = []
    private var ratings: [Rating] = []
    
    private lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "Search"
        view.backgroundImage = UIImage()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.searchTextField.addTarget(self, action: #selector(searchBarEditingChanged), for: .editingChanged)
        return view
    }()
    
    private lazy var winesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.register(WineCell.self, forCellWithReuseIdentifier: WineCell.reuseId)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavItem()
        setupConstraints()
        wineService.getWines { wineList in
            self.wines = wineList
            self.winesCollectionView.reloadData()
        }
    }
    
    private func setupNavItem() {
        navigationItem.title = "Wine list"
        let menuBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: #selector(menuBarButtonItemTapped))
        menuBarButtonItem.tintColor = .black
        navigationItem.leftBarButtonItem = menuBarButtonItem
        
        let userLogoImage = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(userImageTapped))
        userLogoImage.tintColor = .black
        navigationItem.rightBarButtonItem = userLogoImage
        
    }
    
    private func setupConstraints() {
        view.backgroundColor = .init(hex: "#fefeff")
        
        view.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            searchBar.heightAnchor.constraint(equalToConstant: 36)
        ])
        
        view.addSubview(winesCollectionView)
        winesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            winesCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 25),
            winesCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            winesCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            winesCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    @objc func menuBarButtonItemTapped(){
        
    }
    @objc func userImageTapped(){
        
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wines.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WineCell.reuseId, for: indexPath) as! WineCell
        
        cell.setup(wine: wines[indexPath.row])
//        cell.setup2(rating: ratings[indexPath.row])
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 40, height: view.frame.width / 3)
    }
}
