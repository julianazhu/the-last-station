![Heroku](https://pyheroku-badge.herokuapp.com/?app=the-last-station)

# The Last Station

This is a choose-your-own adventure game I began writing for [National Novel Writing Month](https://nanowrimo.org/) 2014 designed to run on [StoryNexus](www.storynexus.com).

Once that month ended I realised that StoryNexus was no longer actively supported :scream:, so I started writing a game engine and then became a Software Engineer.

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
#### 1. In the main app directory, run `bundle install`.

#### 2. Configure your Postgres credentials:
> :warning: Your Rails db user should be configured as the db owner or Rails may not run be able to run migrations.
```
$ EDITOR=<your-text-editor-of-choice> rails credentials:edit --environment development
```
Ensure the following block is included in said config:
```
postgres:
  db_name: <your_dev_db_name>
  username: <your_dev_db_user>
  password: <your_dev_db_password>
```
Alternatively modify `config/database.yml` for a more specific Postgres or other DB setup.

#### 3. In `config/environments/development.rb` tell Rails to fallback to locally precompiled images & stylesheets for now.

```
config.assets.compile = true
```
#### 4. Run the following shell commands:
```
 $ export RAILS_ENV=development
 $ rails db:environment:set
 $ rake db:schema:load
 $ rails assets:precompile
 $ bundle exec rails s
```
You should now be able to navigate to the application at `localhost:3000` :tada:

## Testing
#### 1. Make sure you've set up a test postgres database and credentials.
```
$ EDITOR=<your-text-editor-of-choice> rails credentials:edit --environment test
$ bin/rails db:migrate RAILS_ENV=test
```
#### 2. Run all existing tests using `Rspec`
```
$ bundle exec rspec
```
# Deployment & Hosting

I recommend [Heroku](https://www.heroku.com/) or AWS [EC2](https://aws.amazon.com/ec2) / [Lightsail](https://aws.amazon.com/lightsail/) for deployment and AWS s3 for asset hosting.

The following instructions are for Heroku, they will require adjustment if you're using a different tools/services.

## Credentials
```
# Production Credentials
EDITOR=vim rails credentials:edit --environment production

# Add your credentials to Heroku
heroku config:set RAILS_MASTER_KEY=<your-master-key>
```

## Assets

The current configuration expects you to host your assets on AWS S3 using a Cloudfront CDN, precompile assets locally and upload them directly using the AWS CLI.

> :warning: By default in this appliction, precompilation is disabled in production and local precompilation compiles assets in PRODUCTION mode. If you want to change this behaviour to match Rails defaults, delete or modify the `lib/tasks/asset.rake` file.

To follow suit, include the following block in your development/staging/production credentials:
```
aws:
  access_key_id: <your-aws-access-key-id>
  secret_access_key: <your-aws-secret-access-key>
  s3_region: <your-s3-region>
  s3_bucket_name: <your-s3-bucket-name>
  cdn_url: <your-cloudfront-or-cdn-url-root>
```
In `config/environments/development.rb`, tell Rails not to fallback to locally precompiled images & stylesheets if you would prefer to see broken links on remote host failure/misconfiguration:
```
config.assets.compile = false
```
When your local assets are ready to be compiled to your staging/production s3 bucket/s, authenticate to the AWS CLI then run:
```
$ export RAILS_ENV=production
$ rails assets:precompile LOCAL_PRECOMPILE=true
$ rake sync_assets
```


# Author
* [Juliana Zhu](https://github.com/julianazhu)

# Acknowledgments

- *Justin Lambert* - for the code reviews and the support.
- *Jake Scott* - for enduring approximately one million NaNoWriMos together.
- [*Stephen Sherratt*](https://www.gridbugs.org/) - Tried to run this in pre-alpha....:scream: :pray:
- *Kurtis Crisafulli* - for being an excellent rubber duck :baby_chick:
- *[StoryNexus](http://www.storynexus.com/) & [Failbetter Games](https://www.failbettergames.com/)* - for the inspiration.
