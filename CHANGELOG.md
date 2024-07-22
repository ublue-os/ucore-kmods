# Changelog

## 1.0.0 (2024-07-22)


### Features

* add nvidia kmod builds and ublue nvidia support RPM ([#3](https://github.com/ublue-os/ucore-kmods/issues/3)) ([2cff166](https://github.com/ublue-os/ucore-kmods/commit/2cff166a93b3f321e8fea5e41511fc7006580bf1))
* auto-generate CDI yaml for nvidia ([#7](https://github.com/ublue-os/ucore-kmods/issues/7)) ([35f8478](https://github.com/ublue-os/ucore-kmods/commit/35f8478b8195fbd0ebfe91f2bfd716e1bef7abdd))
* first attempt to build zfs kmods into scratch image ([590d845](https://github.com/ublue-os/ucore-kmods/commit/590d8459180e7da3d41a05c1305e2aed9f9fd9b9))
* pin ZFS to 2.1.x release series ([#8](https://github.com/ublue-os/ucore-kmods/issues/8)) ([a4c083f](https://github.com/ublue-os/ucore-kmods/commit/a4c083fc617218a314428f461d490f189407d615))
* provide package with public secure boot signing key ([#10](https://github.com/ublue-os/ucore-kmods/issues/10)) ([aa44e42](https://github.com/ublue-os/ucore-kmods/commit/aa44e420bc7ed627c382a7609dc8096ade32cd4e))
* sign zfs kmods ([b91838b](https://github.com/ublue-os/ucore-kmods/commit/b91838b3c93d8bfb0c04bfea45d7ba9829e306a5)), closes [#16](https://github.com/ublue-os/ucore-kmods/issues/16)
* switch to negativo17 for nvidia ([#5](https://github.com/ublue-os/ucore-kmods/issues/5)) ([62026b4](https://github.com/ublue-os/ucore-kmods/commit/62026b498b12ffa2ff8203b99b4cd33843689a3b))
* update to new repo for nvidia-container-toolkit ([#6](https://github.com/ublue-os/ucore-kmods/issues/6)) ([014d687](https://github.com/ublue-os/ucore-kmods/commit/014d687c353fa838e1c7227e5085788dfdf6537b))
* upgrade to zfs 2.2+ ([c827701](https://github.com/ublue-os/ucore-kmods/commit/c827701b36c98875ba797ca27e480f511d4e448a)), closes [#88](https://github.com/ublue-os/ucore-kmods/issues/88)


### Bug Fixes

* add coreos-pool repo to resolve kernel-devel packages ([#18](https://github.com/ublue-os/ucore-kmods/issues/18)) ([835f3e4](https://github.com/ublue-os/ucore-kmods/commit/835f3e456f88f34eed63eb586febdb88454c53ca))
* use tag_name (not name) to find zfs tagged versions ([014c05f](https://github.com/ublue-os/ucore-kmods/commit/014c05ff55fdcd55586b31d53ad408cc046425f9))
* use tar options to enable extraction on F40 based source ([#15](https://github.com/ublue-os/ucore-kmods/issues/15)) ([f2cd6e1](https://github.com/ublue-os/ucore-kmods/commit/f2cd6e174582174a313066d808fac00e17dd16ac))
