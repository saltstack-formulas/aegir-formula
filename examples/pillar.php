### PHP
php:
  ng:
    lookup:
      fpm:
        conf: /etc/php/7.0/fpm/php-fpm.conf
        ini: /etc/php/7.0/fpm/php.ini
        service: php7.0-fpm
        pools: /etc/php/7.0/fpm/pool.d
        defaults:
          include: '/etc/php/7.0/fpm/pool.d/*.conf'
    fpm:
      config:
        ini:
          settings:
            PHP:
              upload_max_filesize: 50M
              post_max_size: 50M
      pools:
        www.conf:
          enabled: true
          settings:
            www:
              user: www-data
              group: www-data
              listen: /var/run/php/php7.0-fpm.sock
              listen.owner: www-data
              listen.group: www-data
              pm: dynamic
              pm.max_children: 5
              pm.start_servers: 2
              pm.min_spare_servers: 1
              pm.max_spare_servers: 3
              chdir: /

