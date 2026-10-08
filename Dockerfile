FROM busybox:1.37-musl

COPY index.html /www/index.html
COPY dataset_1008/personify_leaderboard.csv /www/personify_leaderboard.csv
COPY dataset_1008/ /www/dataset_1008/

EXPOSE 80

HEALTHCHECK --interval=10s --timeout=3s --start-period=3s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://127.0.0.1/ || exit 1

CMD ["httpd", "-f", "-p", "80", "-h", "/www"]
