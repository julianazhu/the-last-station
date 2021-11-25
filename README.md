![Heroku](https://pyheroku-badge.herokuapp.com/?app=the-last-station)

# The Last Station

This is a choose-your-own adventure game I began writing for [National Novel Writing Month](https://nanowrimo.org/) 2014 designed to run on [StoryNexus](www.storynexus.com).

Once it was completed I realised that StoryNexus was no longer actively supported :scream:, so I started writing a game engine and then became a Software Engineer.

Talk about [yak shaving](http://www.catb.org/~esr/jargon/html/Y/yak-shaving.html).

# Getting Started

## Local Development

### Prerequisites
- [Ruby](https://www.ruby-lang.org/en/documentation/installation/): v3.0.0
- [Bundler](https://bundler.io/): v2.2.31
- [Yarn](https://yarnpkg.com/getting-started/install/): v3.1.0
- [Node.js](https://nodejs.org/en/download/): v16.13.0
- [PostgreSQL](https://www.postgresql.org/): v14

### Setup
Edit the `config/database.yml` to match your local Postgres connection details, then run:

```
 bundle install
 export RAILS_ENV=development
 bin/rails db:environment:set
 rake db:schema:load
 bin/rails assets:precompile
 bundle exec rails s
```

You should now be able to navigate to the application at `localhost:3000`.

# Deployment

I recommend [Heroku](https://www.heroku.com/) or AWS [EC2](https://aws.amazon.com/ec2) / [Lightsail](https://aws.amazon.com/lightsail/) for deployment and AWS s3 for asset hosting.

## Credentials
```
# Global credentials used as fallback - I use these for dev/staging
EDITOR=vim rails credentials:edit
# Production Credentials
EDITOR=vim rails credentials:edit --environment production
```

## Assets
```
EDITOR=vim rails credentials:edit
# Production Credentials
rake sync_assets
```

# Authors
* [Juliana Zhu](https://github.com/julianazhu)

# Acknowledgments

- *Justin Lambert* - for the code reviews and the support.
- *Jake Scott* - for enduring approximately one million NaNoWriMos together.
- *[StoryNexus](http://www.storynexus.com/) & [Failbetter Games](https://www.failbettergames.com/)* - for the inspiration.
