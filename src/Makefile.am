## Process this file with automake to produce Makefile.in

## Created by Anjuta


uidir = $(pkgdatadir)/ui
ui_DATA = cambio.ui \
	cambio.png \
	about.ui


AM_CPPFLAGS = \
	-DPACKAGE_LOCALE_DIR=\""$(localedir)"\" \
	-DPACKAGE_SRC_DIR=\""$(srcdir)"\" \
	-DPACKAGE_DATA_DIR=\""$(pkgdatadir)"\" \
	$(CAMBIO_CFLAGS)

AM_CFLAGS =\
	 -Wall\
	 -g

bin_PROGRAMS = cambio

cambio_SOURCES = \
	cambio.vala config.vapi

cambio_VALAFLAGS =  \
	--pkg gtk+-3.0


cambio_LDFLAGS =

cambio_LDADD = $(CAMBIO_LIBS)


if PLATFORM_WIN32
cambio_LDFLAGS += -Wl,--export-all-symbols
else
cambio_LDFLAGS += -Wl,--export-dynamic
endif

if NATIVE_WIN32
cambio_LDFLAGS += -mwindows
endif


EXTRA_DIST = $(ui_DATA)

# Remove ui directory on uninstall
uninstall-local:
	-rm -r $(uidir)
	-rm -r $(pkgdatadir)

