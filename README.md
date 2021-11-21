# The Last Station

This is a choose-your-own adventure game I began writing for [National Novel Writing Month](https://nanowrimo.org/) 2014 designed to run on [StoryNexus](www.storynexus.com) which was completed before I realised that StoryNexus was no longer actively supported, so I ended up writing a game engine.

## Getting Started

At the moment, this app is only able to run on your local machine but I will eventually get it to the point where it can be distributed and used (at your own risk!).

Currently in order to create your own story, you need to use the backend story admin interface under localhost:3000/stories/ where you can add "stories" which link up to one another to create a narrative, and "qualities" which describe the character's progression, status, and inventory.

The intro sequence (character creation and beginning narrative steps) are hard-coded in various html views under "thelaststation\app\views\characters".

### Prerequisites
- Ruby: v3.0.0
- Bundler: v2.2.31
- Yarn: v3.1.0
- Node: v16.13.0
- PostgreSQL: v14
  - **Note to self**: If you're still on a Windows machine, you are using your Windows installation of Postgresql, **not** your WSL1/2 installation.

### Local Development Setup
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

## Deployment

I recommend [Heroku](https://www.heroku.com/) or AWS [EC2](https://aws.amazon.com/ec2) / [Lightsail](https://aws.amazon.com/lightsail/) for deployment and AWS s3 for asset hosting.

## Authors
* [Juliana Zhu](https://github.com/julianazhu)

## Acknowledgments

* *Justin Lambert* - for the code reviews and the support.
* *Jake Scott* - for enduring approximately one million NaNoWriMos together.
* *StoryNexus* - for the inspiration.
