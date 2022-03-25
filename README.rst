Element Matrix messenger (Traffic+Nginx proxy and coTURN webrtc routing)
========================================================================
Secure fully functional messenger with end-to-end encryption.

**Warning!** Using Let's Encrypt certificate will result in calls not working on IOS and Android.

**Warning! x2** Microphone may not work with this client due to pretty random error. If you face this issue try to update or choose another browser.

* `link 1 <https://github.com/vector-im/element-web/issues/19533>`_
* `link 2 <https://github.com/vector-im/element-web/issues/5552>`_
Preparation
___________________
For the basic setup you need public IP and a domain name.
Also you need to register these subdomains:

* matrix.domain.com
* synapse.matrix.domain.com
* element.matrix.domain.com
* turn.matrix.domain.com

where domain.com is your domain

Installation Guide
------------------

1
_

Edit set-env.sh, you probably want to:

* replace domain.com with your domain
* add your subdomains, which you want to route with nginx presented within this container bundle, to HOSTS variable
* change postgres user and pass
* change SSL_MAIL to your certificate login mail

.. code-block:: bash

    bash set-env.sh
    source ~/.bash_profile

2
_
Add additional routes to nginx if needed. Keep in mind that SSL-thing is done by traefik,
so you do not need to specify ssl certs and key, and to route 443 port.
3
_
Edit env variables in coturn-setup.sh
You will need to specify certificate chain and private key for coTURN,
and change public ip and password.
Do not forget to add a folder with certificate to docker-compose.yml at the coturn container.

4
_
At synapse-setup.sh change SYNAPSE_FOLDER to full path to synapse folder within this bundle.

5
_
Run rest of the setup scripts:

.. code-block:: bash

    bash traefik-setup.sh
    bash postgres-setup.sh
    bash nginx-setup.sh
    bash synapse-setup.sh
    bash coturn-setup.sh

6
_
Run the bundle!

.. code-block:: bash

    docker-compose up -d

DONE!.. Almost.
_______________
You may encounter an error due to typo or somewhat else.
Consider checking logs of all containers and posing an issue to this repository.

If everything is ok, you should find a web interface on elements.matrix.domain.com

CHANGE ELEMENT VERSION
______________________
Paste the source code of element web in nginx/riot-web

If you want to return old version - it is stored under nginx/versions/ folder