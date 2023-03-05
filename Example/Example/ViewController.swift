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

    private let vibrancEffectyView = VibrancyEffectView(style: .dark)
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

        vibrancEffectyView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vibrancEffectyView)
        vibrancEffectyView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        vibrancEffectyView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        vibrancEffectyView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        vibrancEffectyView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        func label(text: String) -> UILabel {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = text
            return label
        }

        let notVibrancyLabel = label(text: "Not vibrancy view")
        vibrancEffectyView.addSubview(notVibrancyLabel)
        notVibrancyLabel.centerXAnchor.constraint(equalTo: vibrancEffectyView.centerXAnchor).isActive = true
        notVibrancyLabel.bottomAnchor.constraint(equalTo: vibrancEffectyView.centerYAnchor).isActive = true

        let vibrancyLabel = label(text: "Vibrancy view")
        vibrancEffectyView.addVibrancySubview { view in
            view.addSubview(vibrancyLabel)
            vibrancyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            vibrancyLabel.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }

        let notVibrancyView = UIView()
        notVibrancyView.backgroundColor = .black
        notVibrancyView.translatesAutoresizingMaskIntoConstraints = false
        vibrancEffectyView.addSubview(notVibrancyView)
        notVibrancyView.leadingAnchor.constraint(equalTo: vibrancEffectyView.leadingAnchor).isActive = true
        notVibrancyView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        notVibrancyView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        notVibrancyView.bottomAnchor.constraint(equalTo: vibrancEffectyView.centerYAnchor).isActive = true

        // example for custom view that is able to use in vibrancy effect
        let vibrancyView = VibrantBackgroundView()
        vibrancyView.backgroundColor = .black
        vibrancyView.translatesAutoresizingMaskIntoConstraints = false
        vibrancEffectyView.addVibrancySubview { view in
            view.addSubview(vibrancyView)
            vibrancyView.leadingAnchor.constraint(equalTo: vibrancEffectyView.leadingAnchor).isActive = true
            vibrancyView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            vibrancyView.widthAnchor.constraint(equalToConstant: 100).isActive = true
            vibrancyView.topAnchor.constraint(equalTo: vibrancEffectyView.centerYAnchor).isActive = true
        }
    }

    private func animateBackgroundHeight() {
        heightConstraint?.constant = view.bounds.height / 2 + 15
        UIView.animate(withDuration: 5) { [self] in
            view.layoutIfNeeded()
        }
    }
}
