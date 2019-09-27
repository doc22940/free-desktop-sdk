import sys
import site
import os

try:
    # FIXME move brackets
    GET_USER_SITE_PACKAGES = site.getusersitepackages
except AttributeError:
    # Probably virtualenv. Don't do anything
    pass
else:
    OLD_USER_SITE = GET_USER_SITE_PACKAGES()
    site.USER_BASE = os.environ.get("PYTHONUSERBASE", "/var/data/python")
    site.USER_SITE = None
    site.USER_SITE = GET_USER_SITE_PACKAGES()
    sys.path = [item for item in sys.path if not item.startswith(OLD_USER_SITE)]
    site.addusersitepackages(site.removeduppaths())
