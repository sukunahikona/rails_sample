FROM ruby:3.1.3

RUN apt-get update -qq && apt-get install -y postgresql-client
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN groupadd -r --gid 1000 rails && \
    useradd -m -r --uid 1000 --gid 1000 rails && \
    usermod -aG sudo rails

WORKDIR /apps
RUN chown -R rails:rails /apps

USER rails

COPY --chown=rails:rails ./apps /apps
RUN chmod +x /apps/entrypoint.sh

ARG RAILS_ENV=production
RUN RAILS_ENV=${RAILS_ENV} bundle install

ENTRYPOINT ["sh", "/apps/entrypoint.sh"]
EXPOSE 8080
CMD ["rails", "s", "-b", "0.0.0.0", "-p", "8080"]
