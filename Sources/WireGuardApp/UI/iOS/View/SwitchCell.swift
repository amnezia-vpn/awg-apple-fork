// SPDX-License-Identifier: MIT
// Copyright © 2018-2023 WireGuard LLC. All Rights Reserved.

import UIKit

class SwitchCell: UITableViewCell {
    var message: String {
        get { return textLabel?.text ?? "" }
        set(value) { textLabel?.text = value }
    }
    var isOn: Bool {
        get { return segmentedControl.selectedSegmentIndex == 0 }
        set(value) { segmentedControl.selectedSegmentIndex = value ? 0 : 1 }
    }
    var isEnabled: Bool {
        get { return segmentedControl.isEnabled }
        set(value) {
            segmentedControl.isEnabled = value
            textLabel?.textColor = value ? .label : .secondaryLabel
        }
    }

    var onSwitchToggled: ((Bool) -> Void)?

    var statusObservationToken: AnyObject?
    var isOnDemandEnabledObservationToken: AnyObject?
    var hasOnDemandRulesObservationToken: AnyObject?

    let segmentedControl: UISegmentedControl = {
        let segmentedControl: UISegmentedControl = .init()
        segmentedControl.insertSegment(withTitle: "Off", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "On", at: 0, animated: false)
        return segmentedControl
    }()
//    let switchView = UISwitch()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)

        accessoryView = segmentedControl
        segmentedControl.addTarget(self, action: #selector(switchToggled), for: .valueChanged)

//        accessoryView = switchView
//        switchView.addTarget(self, action: #selector(switchToggled), for: .valueChanged)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func switchToggled() {
        onSwitchToggled?(segmentedControl.selectedSegmentIndex == 0)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        onSwitchToggled = nil
        isEnabled = true
        message = ""
        isOn = false
        statusObservationToken = nil
        isOnDemandEnabledObservationToken = nil
        hasOnDemandRulesObservationToken = nil
    }
}
