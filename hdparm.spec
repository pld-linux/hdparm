Summary:	Utility for setting (E)IDE performance parameters
Summary(de):	Dienstprogramm zum Einstellen von (E)IDE-Parametern
Summary(fr):	Utilitaire pour ajuster les paramétres de performances des unités (E)IDE.
Summary(pl):	Narzêdzie do ustawiania parametrow (E)IDE
Summary(tr):	(E)IDE sabit disklerle ilgili bazý parametreleri deðiþtirir
Name:		hdparm
Version:	3.9
Release:	2
Copyright:	distributable
Group:		Utilities/System
Group(pl):	Narzêdzia/System
Source0:	ftp://sunsite.unc.edu/pub/Linux/system/hardware/%{name}-%{version}.tar.gz
Source1:	hdparm.init
Source2:	hdparm.sysconfig
Patch0:		hdparm-optflags.patch
Patch1:		hdparm-sparc.patch
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%description
This is a utility for setting Hard Drive parameters.  It is useful for
tweaking performance and for doing things like spinning down hard drives to
conserve power.

%description -l de
Dies ist ein Utility zum Einstellen der Festplatten-Parameter, nützlich zum
Feintunen der Leistung und zum Verlangsamen der Drehgeschwindigkeit, wenn
Strom gespart werden soll.

%description -l fr
Utilitaire pour configurer les paramêtres du disque dur. Utile pour
améliorer les performances et pour ralentir les disques durs afin
d'économiser l'énergie.

%description -l pl
Pakiet ten zawiera program pozwalaj±cy manipulowaæ ró¿nymi parametrami
dysków (E)IDE i SCSI. Przydaje siê, gdy chcemy polepszyæ wydajno¶æ naszego
dysku (E)IDE (na przyklad opcje -u, -d), zatrzymaæ aby nie zu¿ywa³ pr±du na
laptopie, itd. Proszê zapoznaæ siê ze stron± manuala przed u¿yciem hdparma.

%description -l tr
Bu program ile sabit disk parametrelerini deðiþtirebilirsiniz. Sistemin
performansýný arttýrmak ya da örneðin disk hýzýný azaltarak daha az güç
harcamak için kullanabilirsiniz.

%prep
%setup  -q
%patch0 -p1
%patch1 -p1

%build
make OPTFLAGS="$RPM_OPT_FLAGS"

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT{{/sbin,%{_mandir}/man8},/etc/{sysconfig,rc.d/init.d}}

install -s hdparm $RPM_BUILD_ROOT/sbin
install hdparm.8 $RPM_BUILD_ROOT%{_mandir}/man8

install %{SOURCE1} $RPM_BUILD_ROOT/etc/rc.d/rc.hdparm
install %{SOURCE2} $RPM_BUILD_ROOT/etc/sysconfig/hdparm

gzip -9nf $RPM_BUILD_ROOT%{_mandir}/man*/* \
	Changelog

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%doc *.gz
%attr(755,root,root) /sbin/hdparm
%attr(754,root,root) /etc/rc.d/rc.hdparm
%config(noreplace) %verify(not size mtime md5) /etc/sysconfig/hdparm
%{_mandir}/man8/*
