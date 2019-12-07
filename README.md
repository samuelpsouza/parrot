# Parrot

## Script SwiftGem

"$PODS_ROOT"/SwiftGen/bin/swiftgen strings -t structured-swift4 "$PROJECT_DIR/$PROJECT_NAME/Application/Supporting Files/Generators/Localizable.strings" --output "$PROJECT_DIR/$PROJECT_NAME/Application/Supporting Files/Generated/Localizable.swift"

"$PODS_ROOT"/SwiftGen/bin/swiftgen xcassets -t swift4 "$PROJECT_DIR/$PROJECT_NAME/Application/Supporting Files/Generators/Assets.xcassets" --output "$PROJECT_DIR/$PROJECT_NAME/Application/Supporting Files/Generated/Assets.swift"

"$PODS_ROOT"/SwiftGen/bin/swiftgen colors -t swift4 "$PROJECT_DIR/$PROJECT_NAME/Application/Supporting Files/Generators/Colors.json" --output "$PROJECT_DIR/$PROJECT_NAME/Application/Supporting Files/Generated/Colors.swift"

"$PODS_ROOT"/SwiftGen/bin/swiftgen storyboards -t swift4 "$PROJECT_DIR/$PROJECT_NAME" --output "$PROJECT_DIR/$PROJECT_NAME/Application/Supporting Files/Generated/Storyboards.swift"

## Ferramentas:

Xcode: https://itunes.apple.com/br/app/xcode/id497799835?mt=12

Cocoapods: https://cocoapods.org

Postman: https://www.getpostman.com

Realm Studio: https://realm.io/products/realm-studio

## Bibliotecas

Realm: https://realm.io/docs/swift/latest

Alamofire: https://github.com/Alamofire/Alamofire

ObjectMapper: https://github.com/Hearst-DD/ObjectMapper

AlamofireObjectMapper: https://github.com/tristanhimmelman/AlamofireObjectMapper

SwiftGen: https://github.com/SwiftGen/SwiftGen

Reusable: https://github.com/AliSoftware/Reusable

Kingfisher: https://github.com/onevcat/Kingfisher
