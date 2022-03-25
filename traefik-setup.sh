echo """#TRAEFIK V2

[log]
  level = \"DEBUG\"

[entryPoints]
  [entryPoints.web]
    address = \":80\"

    [entryPoints.web.http]
      [entryPoints.web.http.redirections]
        [entryPoints.web.http.redirections.entryPoint]
          to = \"websecure\"
          scheme = \"https\"

  [entryPoints.websecure]
    address = \":443\"

[providers.docker]
  exposedbydefault = \"false\"

[certificatesResolvers.letsencrypt.acme]
  email = \"$SSL_MAIL\"
  caServer = \"https://acme-v02.api.letsencrypt.org/directory\"
  storage = \"acme.json\"
  [certificatesResolvers.letsencrypt.acme.tlsChallenge]
""" > ./traefik/traefik.toml