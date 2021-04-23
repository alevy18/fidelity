//
//  SearchResultsViewController.swift
//  fidelity
//
//  Created by Aaron Levy on 4/23/21.
//

import UIKit

class SearchResultsViewController: UIViewController, APIHandler {

    @IBOutlet weak var searchResults: UITableView!
    
    
    let vm = SearchResultsViewModel()
    var searchedUrl: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sets array with AnimeModel objects
        vm.searchedArray = fetchAnimeFromUrl(url: searchedUrl ?? "") ?? []
        
        searchResults.delegate = self
        searchResults.dataSource = self
        
        //custom cell integration
        let nib = UINib.init(nibName: Constants.TableViewCells.animeTableViewCell, bundle: nil)
        searchResults.register(nib, forCellReuseIdentifier: "animeCell")
        
    }
    

    

}

extension SearchResultsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.getSearchedArrayCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animeCell") as? AnimeTableViewCell
        guard let animeModel = vm.getAnimeModel(index: indexPath.row) else {
            return UITableViewCell()
        }
        cell?.setUpCell(animObj: animeModel)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        guard let vc = st.instantiateViewController(identifier: Constants.ViewControllers.webViewController) as? WebViewController else {return}
        guard let url = vm.getAnimeModel(index: indexPath.row)?.url else {return}
        vc.websiteURL = url
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
