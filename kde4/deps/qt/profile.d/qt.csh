#!/bin/csh
# Environment path variables for the Qt package:
if ( ! $?QTDIR ) then
    # It's best to use the generic directory to avoid
    # compiling in a version-containing path:
    if ( -d /usr/lib/qt ) then
        setenv QTDIR /usr/lib/qt
    else
        # Find the newest Qt directory and set $QTDIR to that:
        foreach qtd ( /usr/lib/qt-* )
            if ( -d $qtd ) then
                setenv QTDIR $qtd
            endif
        end
    endif
endif
set path = ( $path $QTDIR/bin )
if ( $?CPLUS_INCLUDE_PATH ) then
    setenv CPLUS_INCLUDE_PATH $QTDIR/include:$CPLUS_INCLUDE_PATH
else
    setenv CPLUS_INCLUDE_PATH $QTDIR/include
endif
