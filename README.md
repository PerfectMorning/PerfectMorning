# PerfectMorning
An iOS app for breakfast recipes.


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


### Add your Food2Fork API key

- Sign in and get your Food2Fork API key
https://food2fork.com/about/api[https://food2fork.com/about/api]

- Make  APIKeys.swift under PerfectMorning/PerfectMorning/
```
$ cd PerfectMorning
$ touch APIKeys.swift
```

- Add the below codes on the APIKeys.swift
```swift
struct APIKeys {
    static let Food2ForkApiKey = "YOUR API KEY"
}
```
then, build it!

