This is my generic personal configuration for a Linux system.

**No authentication.** This configuration uses only publicly available Git
remote repositories, so I can use this without setting up authentication.

**One-way.** Given that it does not authenticate, it is effectfully a one-way
pull of the latest configuration.

## Usage

For the initial installation, clone the repository:

```shell
$ git clone https://github.com/spl/linux-config.git "$HOME/._config"
```

For both installing and updating, run the script:

```shell
$ cd "$HOME/._config"
$ ./update.sh
```
