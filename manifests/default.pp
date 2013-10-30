class { 'gb::user':
  name => 'deploy',
}


class { 'gb::public_keys':
  user    => 'deploy',
}


class { 'gb::rvminstall':
  ruby_version => 'ruby-2.0.0-p247',
}


class { 'gb::nginx': }
