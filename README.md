# RISC-V GNU Compiler Toolchain

## ルートレスコンテナの利用方法
[RHEL Product Documentation 1.6. ルートレスコンテナーの設定](https://access.redhat.com/documentation/ja-jp/red_hat_enterprise_linux/8/html/building_running_and_managing_containers/proc_setting-up-rootless-containers_assembly_starting-with-containers)
に記載の通りユーザ追加すると自動的に`/etc/subuid`へユーザIDが追加される。

## 使い方
```
export PATH=/opt/riscv/bin:$PATH
which riscv32-unknown-elf-objcopy
```

## Dockerfile
* texinfoのインストールにはPowerToolsリポジトリの有効化が必要

## RHEL8の場合
以下パッケージをインストール後にビルドを実施
```
subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms
dnf -y install texinfo diffutils expat-devel gmp-devel
```
