//
//  SearchResultsViewModel.swift
//  fidelity
//
//  Created by Aaron Levy on 4/23/21.
//

import Foundation

class SearchResultsViewModel{
    var searchedArray: [AnimeModel] = []
    
    func getSearchedArrayCount() -> Int{
        return searchedArray.count
    }
    
    func getAnimeModel(index: Int) -> AnimeModel? {
        if index >= 0 && index < getSearchedArrayCount(){
            return searchedArray[index]
        }else{
            return nil
        }
    }
}
