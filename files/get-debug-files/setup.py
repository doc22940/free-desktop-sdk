from setuptools import setup, find_packages

setup(
    name='get_debug_files',
    version='0.1',
    packages=find_packages(),
    entry_points={
        'console_scripts': [
            'get_debug_files = get_debug_files.__main__:main',
        ]
    },
    install_requires=[
        'dbus-python',
        'PyGObject'
    ]
)
