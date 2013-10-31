include gb

class { gb::rvm_install:
  ruby_version => 'ruby-2.0.0-p247',
}

gb::rails_app { 'gb-blog':
  port    => 3001,
  db_pass => 'password',
}

gb::rails_app { 'test.gb-blog':
  port    => 3002,
  db_pass => 'password',
}
