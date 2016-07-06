require 'mkmf'
require 'rbconfig'

LIBDIR      = RbConfig::CONFIG['libdir']
INCLUDEDIR  = RbConfig::CONFIG['includedir']

HEADER_DIRS = [
  # First search /opt/local for macports
  '/opt/local/include',

  # Then search /usr/local for people that installed from source
  '/usr/local/include',

  # Check the ruby install locations
  INCLUDEDIR,

  # Where libpostal is installed in the Heroku buildback
  '/app/vendor/include',

  # Finally fall back to /usr
  '/usr/include',
]

LIB_DIRS = [
  # First search /opt/local for macports
  '/opt/local/lib',

  # Then search /usr/local for people that installed from source
  '/usr/local/lib',

  # Check the ruby install locations
  LIBDIR,

  # Where libpostal is installed in the Heroku buildback
  '/app/vendor/lib',

  # Finally fall back to /usr
  '/usr/lib',
]

dir_config('libpostal', HEADER_DIRS, LIB_DIRS)

$CFLAGS << " -std=gnu99"
$LIBS << " -lpostal"

create_makefile('ruby_postal/cpostal/expand')
