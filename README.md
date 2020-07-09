# ft_server

## Description

The Docker image bsed on `debian:buster` with mysql, phpMyAdmin and Wordpress services. Runs with Nginx.

It was made due to my studying in 21-school, Russia.

The main goal of project is learn how to Docker something and run my own server.

## Usage

1. Add some dependences to your `hosts` file.
```
$> cat /etc/hosts

# Something above 
127.0.0.1	localhost
127.0.0.1	phpmyadmin.com
127.0.0.1	mysitewp.com
# Something bellow
```

2. Check if no services take 80 port on your localhost

3. Run `docker build .`

4. Run `docker run -p 80:80 -p 443:443 -d _image_name_'

5. Go to [localhost](localhost "Container localhost site") or [phpmyadmin.com](phpmyadmin.com "Container phpMyAdmin site") or [mysitewp.com](mysitewp.com "Container wordpress site")
