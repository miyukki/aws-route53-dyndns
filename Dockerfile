FROM python:2.7-alpine

RUN apk --update add curl
RUN pip install awscli
ADD update-route53 /usr/local/bin
ADD https://github.com/miyukki/mantra/releases/download/v0.0.2/mantra /usr/local/bin
RUN chmod a+x /usr/local/bin/mantra

CMD mantra "0 */10 * * * *" update-route53
