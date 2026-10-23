FROM httpd:2.4-alpine

# The dot (.) copies everything in your current folder (index, css, js, and the img folder)
COPY . /usr/local/apache2/htdocs/

EXPOSE 80
