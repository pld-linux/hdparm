Summary:	Utility for setting (E)IDE performance parameters
Summary(es):	Utilitario para ajustar parАmetros de desempeЯo (E)IDE
Summary(de):	Dienstprogramm zum Einstellen von (E)IDE-Parametern
Summary(fr):	Utilitaire pour ajuster les paramИtres de performances des unitИs (E)IDE
Summary(pl):	NarzЙdzie do ustawiania parametrow (E)IDE
Summary(pt_BR):	UtilitАrio para ajustar parБmetros de performance (E)IDE
Summary(ru):	Утилита для показа/настройки параметров жестких дисков
Summary(tr):	(E)IDE sabit disklerle ilgili bazЩ parametreleri deПiЧtirir
Summary(uk):	Утил╕та для показу/установки параметр╕в жорстких диск╕в
Name:		hdparm
Version:	5.5
Release:	1
License:	BSD
Group:		Applications/System
Source0:	ftp://sunsite.unc.edu/pub/Linux/system/hardware/%{name}-%{version}.tar.gz
# Source0-md5:	b3d65aa96d93fc08bc807fd1d9497c21
Source1:	%{name}.init
Source2:	%{name}.sysconfig
Source3:	%{name}.8.pl
Patch0:		%{name}-man-patch
Patch1:		%{name}-readahead.patch
URL:		http://www.ibiblio.org/pub/Linux/system/hardware/
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%define		_sbindir	/sbin

%description
This is a utility for setting Hard Drive parameters. It is useful for
tweaking performance and for doing things like spinning down hard
drives to conserve power.

%description -l de
Dies ist ein Utility zum Einstellen der Festplatten-Parameter,
nЭtzlich zum Feintunen der Leistung und zum Verlangsamen der
Drehgeschwindigkeit, wenn Strom gespart werden soll.

%description -l es
Este es un utilitario para ajustar parАmetros del disco duro. Es Зtil
para mejorar el desempeЯo y para hacer cosas como diminuir la rotaciСn
del disco para conservar energМa.

%description -l fr
Utilitaire pour configurer les paramЙtres du disque dur. Utile pour
amИliorer les performances et pour ralentir les disques durs afin
d'Иconomiser l'Иnergie.

%description -l pl
Pakiet ten zawiera program pozwalaj╠cy manipulowaФ rС©nymi parametrami
dyskСw (E)IDE i SCSI. Przydaje siЙ, gdy chcemy polepszyФ wydajno╤Ф
naszego dysku (E)IDE (na przyklad opcje -u, -d), zatrzymaФ aby nie
zu©ywaЁ pr╠du na laptopie, itd. ProszЙ zapoznaФ siЙ ze stron╠ manuala
przed u©yciem hdparma.

%description -l pt_BR
Este И um utilitАrio para ajustar parБmetros do disco rМgido. Ele И
Зtil para melhorar a performance e para fazer coisas como diminuir a
rotaГЦo do disco para conservar energia.

%description -l ru
Это полезная системная утилита для установки параметров жестких дисков
(E)IDE. Например, hdparm можно использовать для настройки
производительности и для остановки вращения дисков с целью экономии
энергии.

%description -l tr
Bu program ile sabit disk parametrelerini deПiЧtirebilirsiniz.
Sistemin performansЩnЩ arttЩrmak ya da ЖrneПin disk hЩzЩnЩ azaltarak
daha az gЭГ harcamak iГin kullanabilirsiniz.

%description -l uk
Це корисна системна утил╕та для установки параметр╕в жорстких диск╕в
(E)IDE. Наприклад, hdparm можна використовувати для настройки
швидкост╕ обм╕ну даними ╕ для зупинки обертання диск╕в з метою
збереження енерг╕╖.

%prep
%setup  -q
%patch0 -p1
%patch1 -p1

%build
%{__make} \
	CC="%{__cc}" \
	CFLAGS="%{rpmcflags}" \
	LDFLAGS="%{rpmldflags}"

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT{%{_sbindir},%{_mandir}/{man8,pl/man8}} \
	$RPM_BUILD_ROOT%{_sysconfdir}/{sysconfig,rc.d/init.d}

install hdparm $RPM_BUILD_ROOT%{_sbindir}
install hdparm.8 $RPM_BUILD_ROOT%{_mandir}/man8
install contrib/idectl $RPM_BUILD_ROOT%{_sbindir}
install contrib/ultrabayd $RPM_BUILD_ROOT%{_sbindir}

install %{SOURCE1} $RPM_BUILD_ROOT/etc/rc.d/rc.hdparm
install %{SOURCE2} $RPM_BUILD_ROOT/etc/sysconfig/hdparm
install %{SOURCE3} $RPM_BUILD_ROOT%{_mandir}/pl/man8/hdparm.8

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%doc contrib/README Changelog README.acoustic
%attr(755,root,root) %{_sbindir}/hdparm
%attr(755,root,root) %{_sbindir}/idectl
%attr(755,root,root) %{_sbindir}/ultrabayd
%attr(754,root,root) /etc/rc.d/rc.hdparm
%config(noreplace) %verify(not size mtime md5) /etc/sysconfig/hdparm
%{_mandir}/man8/*
%lang(pl) %{_mandir}/pl/man8/*
