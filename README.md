# PerfectMorning
An iOS app for breakfast recipes.

![App_UI](https://raw.githubusercontent.com/PerfectMorning/PerfectMorning/master/readme_hero.jpg)


## How to build our App with Xcode

### Clone our repository in your local

- Make a new folder for PerfectMorning
```
$ mkdir PerfectMorning
```

- Go to your PerfectMorning directory
```
$ cd PerfectMorning
```

- Clone our repository
```
$ git clone https://github.com/PerfectMorning/PerfectMorning.git
```


### Install Carthage

- Install homebrew
```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

- Install Carthage
```
$ brew install carthage
```

- Build libraries in your PerfectMorning directory
```
$ carthage update --platform iOS
```


### Add your Yummly ID and API key

- Get your Yummly ID and API key
https://developer.yummly.com/

- Make APIKeys.swift under PerfectMorning/PerfectMorning/
```
$ cd PerfectMorning
$ touch APIKeys.swift
```

- Add the below codes on the APIKeys.swift
```swift
struct APIKeys {
    static let yummlyApiId = "YOUR YUMMLY ID"
    static let yummlyApiKey = "YOUR API KEY"
}
```
then, build it!

