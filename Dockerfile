FROM ruby:3.1.3

RUN apt-get update -qq && apt-get install -y postgresql-client
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN groupadd -r --gid 1000 rails && \
    useradd -m -r --uid 1000 --gid 1000 rails && \
    usermod -aG sudo rails

WORKDIR /apps
RUN chown -R rails:rails /apps

USER rails

#COPY --chown=rails:rails ./apps/Gemfile /apps/Gemfile
#COPY --chown=rails:rails ./apps/Gemfile.lock /apps/Gemfile.lock
COPY --chown=rails:rails ./apps /apps
RUN bundle install

COPY --chown=rails:rails ./apps/entrypoint.sh /apps/entrypoint.sh
RUN chmod +x /apps/entrypoint.sh

ENTRYPOINT ["sh", "/apps/entrypoint.sh"]
EXPOSE 3000
CMD ["rails", "s", "-b", "0.0.0.0", "-p", "80"]