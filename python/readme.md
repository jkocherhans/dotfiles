# Python

## Installing and Managing Python

## [pyenv](https://github.com/pyenv/pyenv)

I use pyenv to install multiple versions of python and to witch between them. Even if you don't think you _need_ multiple versions of python, it's helpful to be able to install a _specific_ version.

### Install

    brew install pyenv

## Installing and Managing Python Tools

## [pipx](https://pipxproject.github.io/pipx/)

I use pipx to install python command line tools globally. Things like awscli, pipenv, or poetry.

### Install

    python -m pip install --user pipx
    python -m pipx ensurepath
    python -m pipx completions

### Usage

    pipx install awscli

## Managing Individual Python Projects

- [pipenv](https://pipenv.kennethreitz.org)
- [poetry](https://poetry.eustace.io)
- [pipenv-virtualenvwrapper](https://github.com/pyenv/pyenv-virtualenvwrapper)

## References

[My Python Development Environment, 2020 Edition - Jacob Kaplan-Moss](https://jacobian.org/2019/nov/11/python-environment-2020/)
