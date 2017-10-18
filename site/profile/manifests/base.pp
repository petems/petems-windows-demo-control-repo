# Base profile: to be included everywhere
class profile::base {

  include ::profile::base::ntp

  # OS Specific configuration
  include "::profile::base::osfamily::${::osfamily}"

}
