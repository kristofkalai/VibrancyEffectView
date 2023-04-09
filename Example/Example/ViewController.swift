//
//  ViewController.swift
//  Example
//
//  Created by Kristof Kalai on 2023. 03. 05..
//

import UIKit
import VibrancyEffectView

final class ViewController: UIViewController {
    final class VibrantBackgroundView: UIView {
        override func tintColorDidChange() {
            super.tintColorDidChange()
            backgroundColor = tintColor
        }
    }

    private let vibrancyEffectyView = VibrancyEffectView(style: .dark)
    private var heightConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateBackgroundHeight()
    }
}

extension ViewController {
    private func setupView() {
        view.backgroundColor = .yellow

        let backgroundView = UIView()
        backgroundView.backgroundColor = .black
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        heightConstraint = backgroundView.heightAnchor.constraint(equalToConstant: .zero)
        heightConstraint?.isActive = true

        vibrancyEffectyView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vibrancyEffectyView)
        vibrancyEffectyView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        vibrancyEffectyView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        vibrancyEffectyView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        vibrancyEffectyView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        func label(text: String) -> UILabel {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = text
            return label
        }

        let notVibrancyLabel = label(text: "Not vibrancy view")
        vibrancyEffectyView.addSubview(notVibrancyLabel)
        notVibrancyLabel.centerXAnchor.constraint(equalTo: vibrancyEffectyView.centerXAnchor).isActive = true
        notVibrancyLabel.bottomAnchor.constraint(equalTo: vibrancyEffectyView.centerYAnchor).isActive = true

        let vibrancyLabel = label(text: "Vibrancy view")
        vibrancyEffectyView.addSubview { view in
            view.addSubview(vibrancyLabel)
            vibrancyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            vibrancyLabel.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }

        let notVibrancyView = UIView()
        notVibrancyView.backgroundColor = .black
        notVibrancyView.translatesAutoresizingMaskIntoConstraints = false
        vibrancyEffectyView.addSubview(notVibrancyView)
        notVibrancyView.leadingAnchor.constraint(equalTo: vibrancyEffectyView.leadingAnchor).isActive = true
        notVibrancyView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        notVibrancyView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        notVibrancyView.bottomAnchor.constraint(equalTo: vibrancyEffectyView.centerYAnchor).isActive = true

        // example for custom view that is able to be used in vibrancy effect
        let vibrancyView = VibrantBackgroundView()
        vibrancyView.backgroundColor = .black
        vibrancyView.translatesAutoresizingMaskIntoConstraints = false
        vibrancyEffectyView.addSubview { view in
            view.addSubview(vibrancyView)
            vibrancyView.leadingAnchor.constraint(equalTo: vibrancyEffectyView.leadingAnchor).isActive = true
            vibrancyView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            vibrancyView.widthAnchor.constraint(equalToConstant: 100).isActive = true
            vibrancyView.topAnchor.constraint(equalTo: vibrancyEffectyView.centerYAnchor).isActive = true
        }
    }

    private func animateBackgroundHeight() {
        heightConstraint?.constant = view.bounds.height / 2 + 15
        UIView.animate(withDuration: 5) { [self] in
            view.layoutIfNeeded()
        }
    }
}
