# Makefile-python
Advanced makefile for python project with virtual env (venv)


Thanks to https://github.com/sio/Makefile.venv

# Usage
```shell
foo@bar:~$ make help
default              set up the virtual environment
lint                 check style with flake8
test                 run all tests with pytest
run                  run python main project file (configure in MAIN value)
clean                remove all build, test, coverage and Python artifacts
clean-pyc            remove Python file artifacts
clean-test           remove test and coverage artifacts
reallyclean          clean all python artifacts and delete .venv

foo@bar:~$ make test
./.venv/bin/pytest
======================================= test session starts ========================================
platform linux -- Python 3.7.7, pytest-5.4.3, py-1.9.0, pluggy-0.13.1
rootdir: /home/serge/Dev/Makefile-python-local
collected 1 item                                                                                   

tests/test_hello.py .                                                                        [100%]

======================================== 1 passed in 0.01s =========================================
```
