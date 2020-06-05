FROM kazakov/base

MAINTAINER Artem Kazakov <kazakov@gmail.com>

# default to being in the user's home directory
WORKDIR /home/powerless

USER powerless

RUN git clone --depth 1 https://github.com/grpc/grpc-java.git

WORKDIR /home/powerless/grpc-java

USER root
RUN bazel sync
RUN cp -r $(bazel info output_base)/external /bazel_dist_dir
RUN echo "common --distdir=/bazel_dist_dir" >> /etc/bazel.bazelrc

USER powerless
