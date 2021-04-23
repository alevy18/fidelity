//
//  SearchViewController.swift
//  fidelity
//
//  Created by Aaron Levy on 4/23/21.
//

import UIKit

class SearchViewController: UIViewController, APIHandler{

    let vm = SearchViewModel()
    
    @IBOutlet weak var searchTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getImageData(url: vm.backgroundImageURL) { (data) in
            if let image = UIImage.init(data: data){
                view.backgroundColor = UIColor(patternImage: image)
            }
        }
        
    }
    
    @IBAction func searchClicked(_ sender: UIButton) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        guard let vc = st.instantiateViewController(identifier: Constants.ViewControllers.searchResultsViewController) as? SearchResultsViewController else{
            return
        }
        vc.searchedUrl = Constants.URLS.searchURL + (searchTF.text ?? "")
        navigationController?.pushViewController(vc, animated: true)
    
    }
    
    
    
}
