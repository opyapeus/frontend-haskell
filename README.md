# frontend-haskell

An example of modern frontend development with haskell using EDSL.

![demo](https://camo.qiitausercontent.com/bd552e32dd1a4b818e743ab09c68dcd333c06eef/68747470733a2f2f71696974612d696d6167652d73746f72652e73332e616d617a6f6e6177732e636f6d2f302f3239373933302f64316261636335662d323835362d373665612d383365612d6335313033376339396164642e676966)

- [Haskellのフロントエンド開発をEDSLでモダンにする](https://qiita.com/peus/items/8badef3e6e0b03b1e790)

## Feature

- Use Lucid, Clay, Sunroof (※temp) for EDSL
- Unified management of Ids and Classes by union type
- Fast auto rebuild with ghcid
- Browser auto reload with browser-sync

## ghcid (fast and auto relaod)

once

```sh
stack install ghcid
```

execute

```sh
ghcid --command "stack ghci" --test "DevelMain.update"
```

access: http://localhost:3000

## ghci (fast but manual relaod)

run ghci

```sh
stack ghci
```

load once

```sh
:l app/DevelMain.hs
```

1. restart app
    ```sh
    DevelMain.update
    ```

2. reload
    ```sh
    :r
    ```
3. back to 1.

down app

```sh
DevelMain.shutdown
```

access: http://localhost:3000

## yesod devel (slow)

once

```sh
stack build yesod-bin
```

execute

```sh
stack exec -- yesod devel --extra-stack-arg --pedantic
```

※ pedantic option to detect warning.

access: http://localhost:3000

## browser-sync

once

```sh
npm install browser-sync -g
```

### for ghcid

```sh
browser-sync start --files src/ --proxy 'localhost:3000'
```

※ it will be better to watch some build file.

access: http://localhost:3001

### for yesod devel

```sh
browser-sync start --files yesod-devel/rebuild --proxy 'localhost:3000'
```

access: http://localhost:3001
