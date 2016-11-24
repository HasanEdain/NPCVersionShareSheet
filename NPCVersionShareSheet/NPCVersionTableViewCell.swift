//
//  NPCVersionTableViewCell.swift
//  NPCVersionShareSheet
//
//  Created by Hasan D Edain on 11/23/16.
//  Copyright © 2016 NPC Unlimited. All rights reserved.
//

import UIKit

class NPCVersionTableViewCell: UITableViewCell {

    public var bundle: Bundle?
    @IBOutlet weak var bundleIdentifierLabel: UILabel?
    @IBOutlet weak var versionLabel: UILabel?
    @IBOutlet weak var nameLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //https://developer.apple.com/library/content/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
    func configureCell(with bundle: Bundle) {
        self.bundle = bundle

        self.bundleIdentifierLabel?.text = bundle.bundleIdentifier

        if let shortVersionString = (bundle.object(forInfoDictionaryKey: "CFBundleShortVersionString")) as? String {
            self.versionLabel?.text = shortVersionString

            if let versionString = (bundle.object(forInfoDictionaryKey: "CFBundleVersion")) as? String {
                self.versionLabel?.text = "\(shortVersionString) (\(versionString))"
            }
        }


        if let nameString = (bundle.object(forInfoDictionaryKey: "CFBundleName")) as? String {
            self.nameLabel?.text = nameString
        }
    }

}
