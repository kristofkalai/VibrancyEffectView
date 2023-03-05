# VibrancyEffectView
UIKit's vibrancy effect became straightforward to use! 😌

### How to use

You can use `VibrancyEffectView` like so:

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

### Example

<p style="text-align:center;"><img src="https://github.com/stateman92/VibrancyEffectView/blob/main/Resources/screenshot.png?raw=true" width="50%" alt="Example"></p>
