include gb

class { gb::rvm_install:
  ruby_version => 'ruby-2.0.0-p247',
}

gb::app::rails { 'gb-blog':
  port      => 8080,
  db_pass   => 'password',
  url       => 'blog.groupbuddies.com',
}

gb::app::rails { 'test.gb-blog':
  port      => 8080,
  db_pass   => 'password',
  url       => 'test.blog.groupbuddies.com',
}
