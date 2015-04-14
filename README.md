# Dev LDAP server for the Landcare Research New Zealand CKAN extension

To run the server:

1. [Install docker](http://docs.docker.com/installation/)

2. Run:

        docker run --name ldap -p 389:389 -d openknowledge/openldap-lcrnz

The first time it runs it will download all necessary images. Successive calls
will run much faster.

To check the container is running, type:

    docker ps

It should show something like:

    CONTAINER ID        IMAGE                                 COMMAND             CREATED             STATUS              PORTS                  NAMES
    cf60b49154f3        openknowledge/openldap-lcrnz:latest   "/sbin/my_init"     40 seconds ago      Up 39 seconds       0.0.0.0:389->389/tcp   ldap

The OpenLDAP server is exposed on localhost's port 389.

## Updating the directory

1. Pull this repo

2. Update `files/data.ldif`

3. Build the image:

        docker build --no-cache -t openknowledge/openldap-lcrnz .

4. Add the new entries:

        docker exec ldap ldapadd -h 127.0.0.1 -c -x -D cn=admin,dc=landcareresearch,dc=co,dc=nz -w pass -f /ldap/data.ldif

5. Commit and push the changes to the Docker Hub:

        docker commit -a "You <you@example.com>" -m "Update directory" ldap openknowledge/openldap-lcrnz
        docker push openknowledge/openldap-lcrnz

