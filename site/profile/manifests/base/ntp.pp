# profile::ntp - Sets up ntp
class profile::base::ntp {

  class { '::time':
    servers => ['time.nist.gov', 'north-america.pool.ntp.org'],
  }

}
