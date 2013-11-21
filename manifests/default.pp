class { gb:
  ruby_version => 'ruby-2.0.0-p247',
}

gb::app::rails { 'production':
  port    => 8443,
  db_pass => 'password',
  url     => 'blog.groupbuddies.com',
}

gb::app::rails { 'staging':
  port      => 8080,
  db_pass   => 'password',
  url       => 'test.blog.groupbuddies.com',
  rails_env => 'staging',
}
