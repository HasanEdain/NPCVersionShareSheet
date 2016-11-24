//
//  NPCVersionShareSheetViewController.swift
//  NPCVersionShareSheet
//
//  Created by Hasan D Edain on 11/23/16.
//  Copyright © 2016 NPC Unlimited. All rights reserved.
//

import UIKit

class NPCVersionShareSheetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var bundleTableView: UITableView!

    var bundles = [Bundle]()
    var filteredBundles = [Bundle]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.bundles = NPCBundleHelper.allBundles()
        self.filteredBundles = self.bundles
    }

    // MARK: UITableView

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredBundles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VersionCell", for: indexPath) as! NPCVersionTableViewCell

        let bundle = self.filteredBundles[indexPath.row]
        cell.configureCell(with: bundle)

        return cell
    }

    // MARK: SearchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.filteredBundles = self.bundles
        } else {
            self.filteredBundles = NPCBundleHelper.filterBundleList(bundleList: self.bundles, filterString: searchText);
        }

        self.bundleTableView.reloadData()
    }

    @IBAction func sharePressed(_ sender: Any) {
        let textToShare = NPCBundleHelper.bundleListString(bundleList: self.filteredBundles)

        let objectsToShare = [textToShare]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)

        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    
    
}
