# profile::ntp - Sets up ntp
class profile::base::ntp {

  class { '::time':
    servers => ['0.uk.pool.ntp.org', 'north-america.pool.ntp.org'],
  }

}
