# make sure to install Pathlib library
from pathlib import Path

path_to_script = Path(__file__).parent.parent.parent

print("Hello")
print(path_to_script)