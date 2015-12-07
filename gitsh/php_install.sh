#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

        yum install libxml2 libxml2-devel curl curl-devel libpng libpng-devel net-snmp-devel -y
        cd /usr/local/src/
        wget http://docs.linuxtone.org/soft/lemp/packages/libiconv-1.13.1.tar.gz
        wget http://docs.linuxtone.org/soft/lemp/packages/libmcrypt-2.5.8.tar.gz
        wget http://docs.linuxtone.org/soft/lemp/packages/mcrypt-2.6.8.tar.gz
        wget http://docs.linuxtone.org/soft/lemp/packages/mhash-0.9.9.9.tar.gz

        tar zxvf libiconv-1.13.1.tar.gz
        cd libiconv-1.13.1
        ./configure --prefix=/usr/local && make && make install
        cd ..

        tar zxvf libmcrypt-2.5.8.tar.gz
        cd libmcrypt-2.5.8/
        ./configure --prefix=/usr && make && make install
        cd libltdl/
        ./configure --enable-ltdl-install
        make && make install
        cd ../..

        tar zxvf mhash-0.9.9.9.tar.gz
        cd mhash-0.9.9.9
        ./configure --prefix=/usr && make && make install
        ldconfig
        cd ..

        ln -s /usr/local/lib/libmcrypt.la /usr/lib/libmcrypt.la
        ln -s /usr/local/lib/libmcrypt.so /usr/lib/libmcrypt.so
        ln -s /usr/local/lib/libmcrypt.so.4 /usr/lib/libmcrypt.so.4
        ln -s /usr/local/lib/libmcrypt.so.4.4.8 /usr/lib/libmcrypt.so.4.4.8
        ln -s /usr/local/lib/libmhash.a /usr/lib/libmhash.a
        ln -s /usr/local/lib/libmhash.la /usr/lib/libmhash.la
        ln -s /usr/local/lib/libmhash.so /usr/lib/libmhash.so
        ln -s /usr/local/lib/libmhash.so.2 /usr/lib/libmhash.so.2
        ln -s /usr/local/lib/libmhash.so.2.0.1 /usr/lib/libmhash.so.2.0.1
        /sbin/ldconfig
        /sbin/ldconfig

        tar zxvf mcrypt-2.6.8.tar.gz
        cd mcrypt-2.6.8
        ./configure --prefix=/usr && make&& make install
        cd ..

        cp -frp /usr/lib64/libldap* /usr/lib/

        echo "/usr/lib" >> /etc/ld.so.conf
        echo "/usr/local/lib" >> /etc/ld.so.conf
        /sbin/ldconfig

        cd /usr/local/src
        wget --user=VXxM2Gzm --password="M+=qvEG@2=SfFa75" -N http://smtool.opstack.cc:5280/tools/php/php-5.4.7.tar.gz
        tar zxvf php-5.4.7.tar.gz
        cd php-5.4.7

        #ln -s /usr/local/mysql/lib/libmysqlclient.so.18  /usr/lib64/
        #--with-mysql=/usr/local/mysql-5.6.15 --with-mysqli=/usr/local/mysql-5.6.15/bin/mysql_config --with-pdo-mysql=/usr/local/mysql-5.6.15/
        ./configure --prefix=/usr/local/php-5.4.7 --with-config-file-path=/usr/local/php-5.4.7/etc --enable-mysqlnd --with-mysql=/usr/local/mysql-5.6.15 --with-mysqli=/usr/local/mysql-5.6.15/bin/mysql_config --with-pdo-mysql=/usr/local/mysql-5.6.15/ --with-iconv-dir=/usr/local --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-pdo-sqlite --enable-pdo --with-bz2 --with-gettext --with-snmp --with-libxml-dir --enable-xml --disable-rpath --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --with-curl --with-curlwrappers --enable-mbregex --enable-fpm --enable-mbstring --with-mcrypt --with-gd --enable-gd-native-ttf --with-openssl --with-mhash --enable-pcntl --enable-sockets --with-ldap --with-ldap-sasl --with-xmlrpc --enable-zip --enable-soap --without-pear  --with-pcre-regex
        make ZEND_EXTRA_LIBS='-liconv'
        make install
        cp /usr/local/php-5.4.7/etc/php-fpm.conf.default /usr/local/php-5.4.7/etc/php-fpm.conf
        cp /usr/local/src/php-5.4.7/php.ini-production /usr/local/php-5.4.7/etc/php.ini
        sed -i "/php-fpm.pid/ {s/.*/pid = run\/php-fpm.pid/}" /usr/local/php-5.4.7/etc/php-fpm.conf
        sed -i "/^pm.max_children/ {s/.*/pm.max_children = 100/}" /usr/local/php-5.4.7/etc/php-fpm.conf
        sed -i "/^pm.start_servers/ {s/.*/pm.start_servers = 20/}" /usr/local/php-5.4.7/etc/php-fpm.conf
        sed -i "/^pm.min_spare_servers/ {s/.*/pm.min_spare_servers = 20/}" /usr/local/php-5.4.7/etc/php-fpm.conf
        sed -i "/^pm.max_spare_servers/ {s/.*/pm.max_spare_servers = 100/}" /usr/local/php-5.4.7/etc/php-fpm.conf
        sed -i "/^user = nobody/ {s/.*/user = daemon/}" /usr/local/php-5.4.7/etc/php-fpm.conf
        sed -i "/^group = nobody/ {s/.*/group = daemon/}" /usr/local/php-5.4.7/etc/php-fpm.conf
    sed -i "/expose_php/ {s/On/Off/g}" /usr/local/php-5.4.7/etc/php.ini
        #expose_php Off         //防止暴露你的服务器上正在使用PHP。
        sed -i "/upload_max_filesize/ {s/.*/upload_max_filesize = 100M/}" /usr/local/php-5.4.7/etc/php.ini
        #upload_max_filesize = 100M             //允许上传的最大文件为10M
    sed -i "s#;error_log = php_errors.log#error_log = /usr/local/php-5.4.7/var/log/php_errors.log#" /usr/local/php-5.4.7/etc/php.ini
        #error_log = /tmp/php-error.log         //将错误记录到指定文件
    sed -i "s#;always_populate_raw_post_data = On#always_populate_raw_post_data = On#g" /usr/local/php-5.4.7/etc/php.ini
        #always_populate_raw_post_data = On             //总是填充 $HTTP_RAW_POST_DATA 变量
        sed -i "s#;open_basedir =#open_basedir = /data/www/wwwroot:/tmp#" /usr/local/php-5.4.7/etc/php.ini

        cp sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm
        chmod +x /etc/init.d/php-fpm
        /etc/init.d/php-fpm start
