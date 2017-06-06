FROM ruby:2.1.10
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs \
      imagemagick libmagickcore-dev libmagickwand-dev vim

RUN mkdir /myapp
WORKDIR /myapp

ADD ./pref-shimane-cms/Gemfile /myapp
ADD ./pref-shimane-cms/Gemfile.lock /myapp
ADD ./pref-shimane-cms/vendor /myapp/vendor/

RUN bundle config git.allow_insecure true
RUN bundle install

ADD ./pref-shimane-cms /myapp

RUN ln -s vendor/engines/site_design/app/assets/images/susanoo/visitors public/images
RUN ln -s vendor/engines/site_design/app/assets/javascripts/susanoo/visitors public/javascripts
RUN ln -s vendor/engines/site_design/app/assets/stylesheets/susanoo/visitors public/stylesheets

RUN cp config/database.yml.docker_sample config/database.yml
RUN cp config/settings.local.yml.docker_sample config/settings.local.yml

ADD ./docker_conf/web_conf/appinit.sh /myapp

