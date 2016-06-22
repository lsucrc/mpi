#Version 1.1
#add the base image
FROM lsucrc/crcbase

# Add a notebook profile.
RUN mkdir -p /root/mpi

# Add Tini. Tini operates as a process subreaper for jupyter to prevent crashes.
ENV TINI_VERSION v0.9.0
ADD  /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

EXPOSE 8888
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0"]
