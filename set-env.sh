#/bin/bash
echo """export MY_DOMAIN=\\\`matrix.domain.com\\\`
export MY_DOMAIN_ALT=matrix.domain.com
export MY_DOMAIN_SYN_ALT=synapse.matrix.domain.com
export MY_DOMAIN_SYN=\\\`\$MY_DOMAIN_SYN_ALT\\\`
export MY_DOMAIN_RIO=\\\`element.matrix.domain.com\\\`
export MY_DOMAIN_COT=\\\`turn.matrix.domain.com\\\`
export HOSTS=\"Host(\$MY_DOMAIN) || Host(\$MY_DOMAIN_RIO) || Host(\\\`domain.com\\\`)\"
export SSL_MAIL=sslmail@domain.com
export POSTGRES_USER=synapse
export POSTGRES_PASSWORD=SomeMassivelyLongPassword
""" >> ~/.bash_profile
# run command in shell: source ~/.bash_profile
