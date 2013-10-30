class gb::user ($name=undef) {
  user { $name:
    ensure     => present,
    home       => "/home/$name",
    shell      => '/bin/bash',
    managehome => true,
  }
}
