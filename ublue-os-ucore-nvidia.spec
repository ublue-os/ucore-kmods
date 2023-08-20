Name:           ublue-os-ucore-nvidia
Version:        0.1
Release:        1%{?dist}
Summary:        Additional files for nvidia driver support on CoreOS

License:        MIT
URL:            https://github.com/ublue-os/ucore-kmods

BuildArch:      noarch
Supplements:    mokutil policycoreutils

Source0:        nvidia-container-runtime.repo
Source1:        config-rootless.toml
Source2:        nvidia-container.pp

%description
Adds various runtime files for nvidia support on Fedora CoreOS.

%prep
%setup -q -c -T


%build
install -Dm0644 %{SOURCE0} %{buildroot}%{_datadir}/ublue-os/%{_sysconfdir}/yum.repos.d/nvidia-container-runtime.repo
install -Dm0644 %{SOURCE1} %{buildroot}%{_datadir}/ublue-os/%{_sysconfdir}/nvidia-container-runtime/config-rootless.toml
install -Dm0644 %{SOURCE2} %{buildroot}%{_datadir}/ublue-os/%{_datadir}/selinux/packages/nvidia-container.pp

sed -i 's@enabled=1@enabled=0@g' %{buildroot}%{_datadir}/ublue-os/%{_sysconfdir}/yum.repos.d/nvidia-container-runtime.repo

install -Dm0644 %{buildroot}%{_datadir}/ublue-os/%{_sysconfdir}/yum.repos.d/nvidia-container-runtime.repo     %{buildroot}%{_sysconfdir}/yum.repos.d/nvidia-container-runtime.repo
install -Dm0644 %{buildroot}%{_datadir}/ublue-os/%{_sysconfdir}/nvidia-container-runtime/config-rootless.toml %{buildroot}%{_sysconfdir}/nvidia-container-runtime/config-rootless.toml
install -Dm0644 %{buildroot}%{_datadir}/ublue-os/%{_datadir}/selinux/packages/nvidia-container.pp             %{buildroot}%{_datadir}/selinux/packages/nvidia-container.pp

%files
%attr(0644,root,root) %{_datadir}/ublue-os/%{_sysconfdir}/yum.repos.d/nvidia-container-runtime.repo
%attr(0644,root,root) %{_datadir}/ublue-os/%{_sysconfdir}/nvidia-container-runtime/config-rootless.toml
%attr(0644,root,root) %{_datadir}/ublue-os/%{_datadir}/selinux/packages/nvidia-container.pp
%attr(0644,root,root) %{_sysconfdir}/yum.repos.d/nvidia-container-runtime.repo
%attr(0644,root,root) %{_sysconfdir}/nvidia-container-runtime/config-rootless.toml
%attr(0644,root,root) %{_datadir}/selinux/packages/nvidia-container.pp

%changelog
* Sat Aug 19 2023 Benjamin Sherman <benjamin@holyarmy.org> - 0.1
First release for Fedora CoreOS based on ublue-os-nvidia-addons includes:
- nvidia-container-runtime repo
- nvidia-container-runtime rootless config
- nvidia-container-runtime selinux policy file
