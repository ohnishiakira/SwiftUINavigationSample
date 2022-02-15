#  SwiftUINavigationSample

based on https://obscuredpixels.com/abstracting-navigation-in-swiftui

## 画面遷移の定義

### 例：FirstViewからSecondViewにpushする


https://user-images.githubusercontent.com/252991/153970827-2c4f9e40-02d7-48ae-a396-d7f8c9694eeb.mp4


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

- `@State var direction: NavigationDirection?`を定義する
- view modifier `.handleNavigation($direction)`を追加する
- `direction = .push(destination: .second)`で遷移する


### 例：ナビゲーションバーからシートを表示、戻ってきてからpush


https://user-images.githubusercontent.com/252991/153970958-2f1e1649-ffc1-4224-92ae-9c390fc61503.mp4


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
        }.navigationBarItems($direction)
            .handleNavigation($direction)
    }
}
```

- `.navigationBarItems($direction)`でナビゲーションバーのアイテムを表示する
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

### 例：トップに戻る


https://user-images.githubusercontent.com/252991/153971146-030238c5-78d8-480b-8025-8896ba99843e.mp4


```CompleteView.swift

struct CompleteView: View {
    @State var direction: NavigationDirection?

    var body: some View {
        VStack {
            Text("Complete View")
            Button("Back to Top") {
                direction = .backToRoot
            }
        }.navigationBarBackButtonHidden(true)
            .handleNavigation($direction)
    }
}
```

- `direction = .backToRoot`


## 画面を追加する

- `NavigationDestination`([link](https://github.com/wamazing/SwiftUINavigationSample/blob/main/SwiftUINavigationSample/Navigation/NavigationHandler.swift#L30))と`ViewFactory`にそれぞれ画面の定義を追加する

