FROM vitormcruz/pharo:9 as Generate_Pharo_Image

COPY pharo pharo

RUN pharo /opt/pharo/Pharo.image eval --save "Metacello new repository: 'tonel://pharo'; baseline: 'Payroll'; onConflictUseIncoming; load: #(core)"; \
    pharo /opt/pharo/Pharo.image clean --production --save;

FROM vitormcruz/pharo:9

COPY --from=Generate_Pharo_Image /opt/pharo/Pharo.image /opt/pharo/Pharo.image
EXPOSE 8080

CMD ["startPayroll"]


