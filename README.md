# VibrancyEffectView
UIKit's vibrancy effect became straightforward to use! 😌

## Setup

Add the following to `Package.swift`:

```swift
.package(url: "https://github.com/stateman92/VibrancyEffectView", exact: .init(0, 0, 1))
```

[Or add the package in Xcode.](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app)

## Usage

```swift
let vibrancyView = VibrancyView(style: .dark)
vibrancyView.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(vibrancyView)
vibrancyView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
vibrancyView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
vibrancyView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
vibrancyView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true

let label = UILabel()
label.translatesAutoresizingMaskIntoConstraints = false
label.text = "Vibrancy view"

vibrancyView.addVibrancySubview { view in
    view.addSubview(label)
    label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    label.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
}
```

For details see the Example app.

## Example

<p style="text-align:center;"><img src="https://github.com/stateman92/VibrancyEffectView/blob/main/Resources/screenshot.png?raw=true" width="50%" alt="Example"></p>
