# Docker Examples

* Install of Verilator in CentOS7.
* This is for checking whether the Verilator binary can be executed in an offline environment.
* too old to use of installing yun's gcc. Then, Using tarball GCC.

* To run Verilator needed packages [here](https://verilator.org/guide/latest/install.html#install-prerequisites)
```sh
yum install -y help2man perl python3 make gcc libatomic
```
# Caution
* When setting ***LD_LIBRARY_PATH*** variable, Must be attached ***export***.
```sh
export LD_LIBRARY_PATH=/usr/local/gcc/lib:/usr/local/gcc/lib64:$LD_LIBRARY_PATH
```

# Reference
* Dockerfile Multistage Build
[https://matsuand.github.io/docs.docker.jp.onthefly/develop/develop-images/multistage-build/]()

* Gcc download mirror
[https://www.gnu.org/prep/ftp.html]()

# ビルドしたTCL/TkをPythonで利用する場合の環境変数の設定方法
* ビルドしたPythonを使用する場合、TCL内"init.tcl"の格納場所を特定できるよう環境変数の設定が必要
```bash
export PATH=/usr/local/tcl/bin:/usr/local/tk/bin:$
export LD_LIBRARY_PATH=/usr/local/tcl/lib:/usr/local/tk/lib:$LD_LIBRARY_PATH
export TCL_LIBRARY=/usr/local/tcl/lib/tcl8.6
export TK_LIBRARY=/usr/local/tk/lib/tk8.6
```
