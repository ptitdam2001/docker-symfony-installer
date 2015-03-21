# Symfony Installer Command with Docker


### Requirement

You need to have a Docker installation

### Command

```
docker run -i -v \`pwd\`:/src ptitdam2001/docker-symfony-command [command]
```

### Installation

To create an alias for symfony command into your .bash_profile file

```
alias symfony="docker run -i -t -u 1000 -v \`pwd\`:/src ptitdam2001/docker-symfony-command"
```

Don't forget execute
```
source .bash_profile
```
### Usage

```
symfony new myproject
```
