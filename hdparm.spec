Summary:	Utility to get/set (E)IDE/SATA/SAS device parameters
Summary(es.UTF-8):	Utilitario para ajustar parámetros de desempeño (E)IDE/SATA/SAS
Summary(de.UTF-8):	Dienstprogramm zum Einstellen von (E)IDE/SATA/SAS-Parametern
Summary(fr.UTF-8):	Utilitaire pour ajuster les paramétres de performances des unités (E)IDE/SATA/SAS
Summary(pl.UTF-8):	Narzędzie do odczytu i ustawiania parametrów urządzeń (E)IDE/SATA/SAS
Summary(pt_BR.UTF-8):	Utilitário para ajustar parâmetros de performance (E)IDE/SATA/SAS
Summary(ru.UTF-8):	Утилита для показа/настройки параметров жестких дисков
Summary(tr.UTF-8):	(E)IDE/SATA/SAS sabit disklerle ilgili bazı parametreleri değiştirir
Summary(uk.UTF-8):	Утиліта для показу/установки параметрів жорстких дисків
Name:		hdparm
Version:	8.2
Release:	1
License:	BSD
Group:		Applications/System
Source0:	http://dl.sourceforge.net/hdparm/%{name}-%{version}.tar.gz
# Source0-md5:	b00458fc9cfc20e9cf6fdfab4077e3f7
Source1:	%{name}.init
Source2:	%{name}.sysconfig
Source3:	%{name}.8.pl
Patch0:		%{name}-man-patch
URL:		http://sourceforge.net/projects/hdparm/
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%define		_sbindir	/sbin

%description
This is a utility for setting Hard Drive parameters. It is useful for
tweaking performance and for doing things like spinning down hard
drives to conserve power.

%description -l de.UTF-8
Dies ist ein Utility zum Einstellen der Festplatten-Parameter,
nützlich zum Feintunen der Leistung und zum Verlangsamen der
Drehgeschwindigkeit, wenn Strom gespart werden soll.

%description -l es.UTF-8
Este es un utilitario para ajustar parámetros del disco duro. Es útil
para mejorar el desempeño y para hacer cosas como diminuir la rotación
del disco para conservar energía.

%description -l fr.UTF-8
Utilitaire pour configurer les paramêtres du disque dur. Utile pour
améliorer les performances et pour ralentir les disques durs afin
d'économiser l'énergie.

%description -l pl.UTF-8
Pakiet ten zawiera program pozwalający manipulować różnymi parametrami
dysków (E)IDE, SATA i SAS. Przydaje się, gdy chcemy polepszyć wydajność
naszego dysku (E)IDE (na przykład opcje -u, -d), zatrzymać aby nie
zużywał prądu na laptopie, itd. Przed użyciem należy zapoznać się ze
stroną manuala.

%description -l pt_BR.UTF-8
Este é um utilitário para ajustar parâmetros do disco rígido. Ele é
útil para melhorar a performance e para fazer coisas como diminuir a
rotação do disco para conservar energia.

%description -l ru.UTF-8
Это полезная системная утилита для установки параметров жестких дисков
(E)IDE/SATA/SAS. Например, hdparm можно использовать для настройки
производительности и для остановки вращения дисков с целью экономии
энергии.

%description -l tr.UTF-8
Bu program ile sabit disk parametrelerini değiştirebilirsiniz.
Sistemin performansını arttırmak ya da örneğin disk hızını azaltarak
daha az güç harcamak için kullanabilirsiniz.

%description -l uk.UTF-8
Це корисна системна утиліта для установки параметрів жорстких дисків
(E)IDE/SATA/SAS. Наприклад, hdparm можна використовувати для настройки
швидкості обміну даними і для зупинки обертання дисків з метою
збереження енергії.

%prep
%setup -q
%patch0 -p1

# precompiled binary
rm contrib/fix_standby

%build
%{__make} \
	CC="%{__cc}" \
	CFLAGS="%{rpmcflags}" \
	LDFLAGS="%{rpmldflags}"

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT{%{_sbindir},%{_mandir}/{man8,pl/man8}} \
	$RPM_BUILD_ROOT/etc/{sysconfig,rc.d/init.d}

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
%doc contrib/README Changelog LICENSE.TXT README.acoustic TODO
%attr(755,root,root) %{_sbindir}/hdparm
%attr(755,root,root) %{_sbindir}/idectl
%attr(755,root,root) %{_sbindir}/ultrabayd
%attr(754,root,root) /etc/rc.d/rc.hdparm
%config(noreplace) %verify(not md5 mtime size) /etc/sysconfig/hdparm
%{_mandir}/man8/hdparm.8*
%lang(pl) %{_mandir}/pl/man8/hdparm.8*
