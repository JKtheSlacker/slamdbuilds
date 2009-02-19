#!/bin/sh

config() {
  NEW="$1"
  OLD="`dirname $NEW`/`basename $NEW .new`"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "`cat $OLD | md5sum`" = "`cat $NEW | md5sum`" ]; then # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}

config etc/postfix/access.new
config etc/postfix/aliases.new
config etc/postfix/canonical.new
config etc/postfix/generic.new
config etc/postfix/header_checks.new
config etc/postfix/main.cf.default.new
config etc/postfix/main.cf.new
config etc/postfix/makedefs.out.new
config etc/postfix/master.cf.new
config etc/postfix/postfix-files.new
config etc/postfix/relocated.new
config etc/postfix/transport.new
config etc/postfix/virtual.new
config etc/rc.d/rc.postfix.new

# This is an incompatability with the sendmail package
( cd usr/lib64; rm -f sendmail )
( cd usr/lib64; ln -s /usr/sbin/sendmail sendmail)

# This will set the permissions on all postfix files correctly
postfix set-permissions
