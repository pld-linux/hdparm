Summary:	Utility for setting (E)IDE performance parameters
Summary(de):	Dienstprogramm zum Einstellen von (E)IDE-Parametern
Summary(fr):	Utilitaire pour ajuster les paramétres de performances des unités (E)IDE.
Summary(pl):	Narzêdzie do ustawiania parametrow (E)IDE
Summary(tr):	(E)IDE sabit disklerle ilgili bazý parametreleri deðiþtirir
Name:		hdparm
Version:	3.5
Release:	2
Copyright:	distributable
Group:		Utilities/System
Group(pl):	Narzêdzia/System
Source:		ftp://sunsite.unc.edu/pub/Linux/system/hardware/%{name}-%{version}.tar.gz
Patch0:		hdparm-optflags.diff
Buildroot:	/tmp/%{name}-%{version}-root

%description
This is a utility for setting Hard Drive parameters.  It is useful for
tweaking performance and for doing things like spinning down hard drives
to conserve power.

%description -l de
Dies ist ein Utility zum Einstellen der Festplatten-Parameter, nützlich zum 
Feintunen der Leistung und zum Verlangsamen der Drehgeschwindigkeit, wenn 
Strom gespart werden soll. 

%description -l fr
Utilitaire pour configurer les paramêtres du disque dur. Utile pour
améliorer les performances et pour ralentir les disques durs afin
d'économiser l'énergie.

description -l pl
Pakiet ten zawiera program pozwalaj±cy manipulowaæ ró¿nymi parametrami
dysków (E)IDE i SCSI. Przydaje siê, gdy chcemy polepszyæ wydajno¶æ naszego
dysku (E)IDE (na przyklad opcje -u, -d), zatrzymaæ aby nie zu¿ywa³ pr±du na
laptopie, itd. Proszê zapoznaæ siê ze stron± manuala przed u¿yciem hdparma.

%description -l tr
Bu program ile sabit disk parametrelerini deðiþtirebilirsiniz. Sistemin
performansýný arttýrmak ya da örneðin disk hýzýný azaltarak daha az güç
harcamak için kullanabilirsiniz.

%prep
%setup -q
%patch0 -p1

%build
make OPTFLAGS="$RPM_OPT_FLAGS"

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT/{sbin,usr/man/man8}

install -s hdparm $RPM_BUILD_ROOT/sbin
install hdparm.8 $RPM_BUILD_ROOT/usr/man/man8

gzip -9nf $RPM_BUILD_ROOT/usr/man/man*/* \
	Changelog

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(0644,root,root,0755)
%doc *.gz
%attr(755,root,root) /sbin/hdparm
/usr/man/man8/*

%changelog
* Thu Sep 24 1998 Krzysztof G. Baranowski <kgb@knm.org.pl>
  [3.3-3]
- added pl transpation,
- added patch (hdparm-optflags.diff) for using $RPM_OPT_FLAGS during
  compile,
- changed Buildroot to /tmp/%%{name}-%%{version}-root,
- added using %%{name} and %%{version} in Source,
- spec rewrited for building package from non-root account.

* Fri Apr 24 1998 Prospector System <bugs@redhat.com>
- translations modified for de, fr, tr

* Wed Apr 08 1998 Erik Troan <ewt@redhat.com>
- updated to 3.3
- build rooted

* Fri Oct 31 1997 Donnie Barnes <djb@redhat.com>
- fixed spelling error in summary

* Mon Jun 02 1997 Erik Troan <ewt@redhat.com>
- built against glibc
