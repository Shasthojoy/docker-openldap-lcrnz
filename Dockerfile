FROM openknowledge/openldap
MAINTAINER Open Knowledge <services@okfn.org>

ADD files /ldap

ENV LDAP_ADMIN_PASSWORD pass
ENV LDAP_ORGANISATION Landcare Research Test LDAP
ENV LDAP_DOMAIN landcareresearch.co.nz
