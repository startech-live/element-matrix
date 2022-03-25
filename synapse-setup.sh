export SYNAPSE_FOLDER=

docker run -v "$SYNAPSE_FOLDER:/data" --rm -e SYNAPSE_SERVER_NAME=$MY_DOMAIN_ALT -e SYNAPSE_REPORT_STATS=yes matrixdotorg/synapse generate
sudo chmod 777 $SYNAPSE_FOLDER/homeserver.yaml
echo """server_name: \"$MY_DOMAIN_ALT\"
use_presence: true
report_stats: false
media_store_path: \"/data/media_store\"
uploads_path: \"/data/uploads\"
listeners:
  - port: 8008
    tls: false
    bind_addresses: ['0.0.0.0']
    type: http
    x_forwarded: true

    resources:
      - names: [client, federation]
        compress: false

database:
  name: psycopg2
  args:
    user: $POSTGRES_USER
    password: $POSTGRES_PASSWORD
    database: matrix
    host: postgres

enable_registration: true

max_upload_size: \"100M\"
""" > synapse/homeserver.yaml
cd $SYNAPSE_FOLDER
mkdir {media_store,uploads,logs}
sudo chown 991:991 media_store/ uploads/ logs/