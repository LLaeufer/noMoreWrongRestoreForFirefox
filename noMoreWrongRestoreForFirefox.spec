Name:           noMoreWrongRestoreForFirefox
Version:        0.0.1
Release:        1%{?dist}
Summary:        Prevents Firefox from restoring after an OS restart, if automatic restoring is disabled
BuildArch:      noarch

License:        MIT
URL:            https://github.com/llaeufer/noMoreWrongRestoreForFirefox
Source0:        %{name}-%{version}.tar.gz

BuildRequires:  bash
Requires:       bash

%description
Prevents Firefox from restoring after an OS restart, if automatic restoring is disabled

%prep
%setup -q

%install
mkdir -p $RPM_BUILD_ROOT/usr/share/noMoreWrongRestoreForFirefox
mkdir -p $RPM_BUILD_ROOT/etc/systemd/system/
cp noMoreWrongRestoreForFirefox.sh $RPM_BUILD_ROOT/usr/share/noMoreWrongRestoreForFirefox/noMoreWrongRestoreForFirefox.sh
cp sessionCheckpoints.json $RPM_BUILD_ROOT/usr/share/noMoreWrongRestoreForFirefox/sessionCheckpoints.json
cp noMoreWrongRestoreForFirefox.service $RPM_BUILD_ROOT/etc/systemd/system/noMoreWrongRestoreForFirefox.service
# chmod -r 644 $RPM_BUILD_ROOT/usr/share/noMoreWrongRestoreForFirefox/
# chmod 755 $RPM_BUILD_ROOT/usr/share/noMoreWrongRestoreForFirefox
# chmod 644 $RPM_BUILD_ROOT/etc/systemd/system/noMoreWrongRestoreForFirefox.service

#%post
#%systemd_post noMoreWrongRestoreForFirefox.service

#%preun
#%systemd_preun noMoreWrongRestoreForFirefox.service

%files
/usr/share/noMoreWrongRestoreForFirefox/
/etc/systemd/system/noMoreWrongRestoreForFirefox.service


%changelog
* Fri Jun 10 2022 L. Läufer
- initial release as an RPM
