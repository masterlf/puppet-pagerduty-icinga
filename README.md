# pager_duty_icinga


#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with pager_duty_icinga](#setup)
    * [What pager_duty_icinga affects](#what-pager_duty_icinga-affects)
    * [Setup requirements](#setup-requirements)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference](#Reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This Module automatise the deployment of pd-nag-connector API for Pagerduty

pd-nag-connector is available at https://github.com/jeffwalter/pd-nag-connector
The origin of this module is available at https://github.com/KrisBuytaert/puppet-pagerduty-icinga

## Setup

### What pager_duty_icinga affects

The module will deploy the perl and cgi files needed and will configure them. It will also deploy the packages needed by perl.

### Setup requirements

* This module require puppetlabs/stdlib
* A Pagerduty API key is needed.

## Usage

It is possible to configure the class with the following parameter:

class { 'pagerduty':
  servicekey                   => 'pagerduty API key',
  service_notification_period  => '24x7',
  host_notification_period     => '24x7',
  service_notification_options => 'w,u,c,r,f',
  host_notification_options    => 'd,u,r,f',
  monitoring_cfg_path          => '/path',
  monitoring_user              => 'icinga_user',
  monitoring_group             => 'icinga_group',
  command_file                 => '/path/command_file',
  status_file                  => '/path/status_file',
  manage_packages              => 'yes',
  use_proxy                    => 'no',
  proxy_proto                  => 'https',
  proxy                        => 'https://yourproxy:port',
}

## Reference

You can find additional information [about pd-nag-connector](https://github.com/jeffwalter/pd-nag-connector)
You will complete your information with [Pagerduty support](https://www.pagerduty.com/docs/guides/icinga-integration-guide/) and the [Pagerduty webhook behavior](https://v2.developer.pagerduty.com/docs/webhook-behavior)

## Limitations

* Should work only on debian/ubuntu (tested on ubuntu 16.04)
* Tested only with icinga 1.x but should work with nagios too
* Webserver configuration is not included in this module

## Development

* TODO: apache conf.d section to configure apache and allow /cgi-bin/pagerduty.cgi
Feel free to contribute
