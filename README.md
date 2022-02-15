#  SwiftUINavigationSample

based on https://obscuredpixels.com/abstracting-navigation-in-swiftui

## 画面遷移の定義

### 例：FirstViewからSecondViewにpushする

```FirstView.swift
struct FirstView: View {
    @State var direction: NavigationDirection?

    var body: some View {
        VStack {
            Text("First View")
                .accessibilityIdentifier("heading")

            Button("Next") {
                direction = .push(destination: .second)
            }.accessibilityIdentifier("next")
        }.handleNavigation($direction)
    }
}
```

- `@State var direction: NavigationDirection?`の定義
- view modidfier `.handleNavigation($direction)`
- `direction = .push(destination: .second)`


### 例：ナビゲーションバーからシートを表示、戻ってきてからpush

```FirstView.swift
struct FirstView: View {
    @State var direction: NavigationDirection?

    var body: some View {
        VStack {
            Text("First View")
                .accessibilityIdentifier("heading")

            Button("Next") {
                direction = .push(destination: .second)
            }.accessibilityIdentifier("next")
        }.navItemsInjected($direction)
            .handleNavigation($direction)
    }
}
```

- `.navItemsInjected($direction)`でナビゲーションバーのアイテムを表示する
- その後に`.handleNavigation($direction)`する


```CartView.swift
struct CartView: View {
    var dismissAction: NavigationHandler.DismissAction?

    @State var direction: NavigationDirection?
    
    var body: some View {
        VStack {
            Text("cart")
            Button("Go Order") {
                direction = .dismiss(direction: .push(destination: .order))
            }
        }.handleNavigation($direction, dismissAction: dismissAction)
    }
}
```

- `var dismissAction: NavigationHandler.DismissAction?`を定義する
- `.handleNavigation($direction, dismissAction: dismissAction)`
