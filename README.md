## Chifoumi Games

[![CI Status](https://travis-ci.org/exyte/Macaw.svg?style=flat)](https://travis-ci.org/exyte/Macaw)
[![Version](https://img.shields.io/cocoapods/v/Macaw.svg?style=flat)](http://cocoapods.org/pods/Macaw)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-0473B3.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/Macaw.svg?style=flat)](http://cocoapods.org/pods/Macaw)
[![Platform](https://img.shields.io/cocoapods/p/Macaw.svg?style=flat)](http://cocoapods.org/pods/Macaw)

Chifoumi Games on ios.

## Installation

Use import AVFoundation for sound!!

```
import AVFoundation
```

## Usage

```Swift
Button Outlet

    @IBOutlet weak var resultatLabel: UILabel!
    @IBOutlet weak var resultatImageView: UIImageView!
    @IBOutlet weak var pierreBouton: UIButton!
    @IBOutlet weak var feuilleBouton: UIButton!
    @IBOutlet weak var ciseauxBouton: UIButton!
```
Button Action

```
    @IBAction func pierreBonAppuye(_ sender: Any) {
        lancerChronometre(choix: "pierre")
        disponibiliteDesBoutons(dispo: false, boutonChoisis: pierreBouton)
    }
    
    
    @IBAction func feuilleBoutonAppuye(_ sender: Any) {
        lancerChronometre(choix: "feuille")
        disponibiliteDesBoutons(dispo: false, boutonChoisis: feuilleBouton)
    }
    
    
    @IBAction func ciseauxBoutonAppuye(_ sender: Any) {
        lancerChronometre(choix: "ciseaux")
        disponibiliteDesBoutons(dispo: false, boutonChoisis: ciseauxBouton)
        
    }
    
## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
