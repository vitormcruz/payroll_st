FROM vitormcruz/pharo:9

COPY Pharo.image /opt/pharo/Pharo.image
EXPOSE 8080

CMD ["startPayroll"]


