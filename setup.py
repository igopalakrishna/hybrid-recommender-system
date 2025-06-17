from setuptools import setup,find_packages

with open("requirements.txt") as f:
    requirements = f.read().splitlines()

setup(
    name="hybrid-recommendation-system",
    version="0.1",
    author="GopalaKrishna",
    packages=find_packages(),
    install_requires = requirements,
)