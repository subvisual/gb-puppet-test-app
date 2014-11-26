/* class { gb: */
/*   ruby_version    => 'ruby-2.1.5', */
/*   deploy_password => "password", */
/* } */

# Vagrant stuff. allow vagrant user to sudo
/* sudo::conf { 'vagrant': */
/*   priority => 01, */
/*   content  => " */
/* %vagrant ALL = NOPASSWD: ALL", */
/* } */

/* $data = hiera('gb-provisioning') */

/* gb::app::rails { 'production': */
/*   port    => 8443, */
/*   db_pass => $data[production][db_pass], */
/*   url     => 'blog.groupbuddies.com', */
/* } */

/* gb::app::rails { 'staging': */
/*   port      => 8080, */
/*   db_pass   => $data[staging][db_pass], */
/*   url       => 'staging.blog.groupbuddies.com', */
/*   rails_env => 'staging', */
/* } */
