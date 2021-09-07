FROM vitormcruz/pharo:9

COPY bin/Pharo.image /opt/pharo/Pharo.image
EXPOSE 8080

CMD ["startPayroll"]


