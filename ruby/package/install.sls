# -*- coding: utf-8 -*-
# vim: ft=sls

saltstack-gnupg-prerequisites:
  pip.installed:
    - name: python-gnupg

rvm-prerequisites:
  pkg.installed:
    - pkgs:
      - curl
      - gcc
      - gcc-c++
      - make
      - patch
      - autoconf
      - automake
      - bison
      - libffi-devel
      - libtool
      - patch
      - readline-devel
      - sqlite-devel
      - zlib-devel
      - openssl-devel

/opt/rvm-installer.sh:
  file.managed:
    - source: {{ pillar['ruby']['rvm']['url'] }}
    - skip_verify: true
    - mode: 555
    - force: true

/root/.gnupg:
  file.directory:
    - mode: 600
    - force: true

rvm-gpg-present:
  gpg.present:
    - keys: {{ pillar['ruby']['gpg']['keys'] }}
    - keyserver: {{ pillar['ruby']['gpg']['server'] }}
    - require:
      - file: /root/.gnupg

install-rvm:
  cmd.run:
    - name: /opt/rvm-installer.sh stable
    - require:
      - gpg: rvm-gpg-present

install-ruby-{{ pillar['ruby']['version'] }}:
  cmd.run:
    - name: |
        source {{ pillar['ruby']['rvm']['profile'] }}
        rvm install {{ pillar['ruby']['version'] }}
        rvm alias create default ruby-{{ pillar['ruby']['version'] }}
    - require:
      - cmd: install-rvm
