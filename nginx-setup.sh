echo """server {
    listen        80;
    server_name   $MY_DOMAIN;
    location /_matrix {
        proxy_pass http://synapse:8008;
        proxy_set_header X-Forwarded-For \$remote_addr;
        client_max_body_size 128m;
    }
    location /.well-known/matrix/ {
        root /var/www/;
        default_type application/json;
        add_header Access-Control-Allow-Origin  *;
  }
}
server {
    listen        80;
    server_name   $MY_DOMAIN_RIO;
    root  /usr/share/nginx/html/;
}""" > ./nginx/matrix.conf

echo """{
    \"default_server_config\": {
        \"m.homeserver\": {
            \"base_url\": \"https://$MY_DOMAIN_SYN_ALT\",
            \"server_name\": \"$MY_DOMAIN_ALT\"
        },
        \"m.identity_server\": {
            \"base_url\": \"https://vector.im\"
        }
    },
    \"disable_custom_urls\": false,
    \"disable_guests\": false,
    \"disable_login_language_selector\": false,
    \"disable_3pid_login\": false,
    \"brand\": \"Element\",
    \"integrations_ui_url\": \"https://scalar.vector.im/\",
    \"integrations_rest_url\": \"https://scalar.vector.im/api\",
    \"integrations_widgets_urls\": [
        \"https://scalar.vector.im/_matrix/integrations/v1\",
        \"https://scalar.vector.im/api\",
        \"https://scalar-staging.vector.im/_matrix/integrations/v1\",
        \"https://scalar-staging.vector.im/api\",
        \"https://scalar-staging.riot.im/scalar/api\"
    ],
    \"bug_report_endpoint_url\": \"https://element.io/bugreports/submit\",
    \"uisi_autorageshake_app\": \"element-auto-uisi\",
    \"defaultCountryCode\": \"GB\",
    \"showLabsSettings\": false,
    \"features\": { },
    \"default_federate\": true,
    \"default_theme\": \"light\",
    \"roomDirectory\": {
        \"servers\": [
            \"$MY_DOMAIN_SYN_ALT\"
        ]
    },
    \"piwik\": {
        \"url\": \"https://piwik.riot.im/\",
        \"whitelistedHSUrls\": [\"https://matrix.org\"],
        \"whitelistedISUrls\": [\"https://vector.im\", \"https://matrix.org\"],
        \"siteId\": 1
    },
    \"enable_presence_by_hs_url\": {
        \"https://matrix.org\": false,
        \"https://matrix-client.matrix.org\": false
    },
    \"settingDefaults\": {
        \"breadcrumbs\": true
    },
    \"jitsi\": {
        \"preferredDomain\": \"meet.element.io\"
    },
    \"map_style_url\": \"https://api.maptiler.com/maps/streets/style.json?key=fU3vlMsMn4Jb6dnEIFsx\"
}
""" > ./nginx/riot/config/config.json

echo """{
  \"m.homeserver\": {
    \"base_url\": \"https://$MY_DOMAIN_ALT\"
  }
}
""" > ./nginx/www/.well-known/matrix/client

echo """
{
  \"m.server\": \"$MY_DOMAIN_SYN_ALT:443\"
}
""" > ./nginx/www/.well-known/matrix/server