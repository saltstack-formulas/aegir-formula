=============
aegir-formula
=============

A SaltStack formula to install and configure the `Ægir Hosting System<https://www.aegirproject.org>`_.
Ægir let's you easily manage and deploy multiple Drupal sites.

This formula follows the instructions on `the install page<http://docs.aegirproject.org/en/3.x/install/>`_

This initial version works on Debian's family as it installs the deb package from AEgir's repo.

``Prerequisites``
-----------------

AEgir has a few `prerequisites<http://docs.aegirproject.org/en/3.x/install/#system-requirements>`- to install
and work properly. You can install them with `other SaltStack formulas<https://github.com/saltstack-formulas/>`_.
The `examples` dir contains minimun pillars for a few of these dependencies. Check also the `.kitchen.yml` file
used for testing this formula, the `provisioner.dependencies` and `suites` section, to see how to use them.

**NOTE**

See the full `Salt Formulas installation and usage instructions
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``aegir``
---------

Installs and does a basic configuration of the aegir server packages.

``aegir.repo``
--------------

Installs and configures the AEgir Debian repo (currently, the only one provided upstream) and keyring.

It also sets a preferences file, as suggested in `the documentation<http://docs.aegirproject.org/en/3.x/install/>`_.

``aegir.user``
--------------

Creates and configures the `aegir` user and group.

``aegir.install``
-----------------

Installs the `aegir3` packages (currently, only Debian's).

``aegir.modules``
-----------------

Installs extra modules for `aegir`.

See ``pillar.example`` file for details.

Salt Compatibility
==================

Tested with:

* 2018.3.x

OS Compatibility
================

Tested with:

* Debian-9

