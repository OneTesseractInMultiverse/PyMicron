import os
import glob

# We load any .py ended file into __all__ so they become discoverable by our application
__all__ = [os.path.basename(
    f)[:-3] for f in glob.glob(os.path.dirname(__file__) + "/*.py")]