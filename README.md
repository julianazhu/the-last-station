# The Last Station

This is a choose-your-own adventure game I began writing for [National Novel Writing Month](https://nanowrimo.org/) 2014 designed to run on [StoryNexus](www.storynexus.com) which was completed before I realised that StoryNexus was no longer actively supported, so I ended up writing a game engine.

## Getting Started

At the moment, this app is only able to run on your local machine but I will eventually get it to the point where it can be distributed and used (at your own risk!). 

Currently in order to create your own story, you need to use the backend story admin interface under localhost:3000/stories/ where you can add "stories" which link up to one another to create a narrative, and "qualities" which describe the character's progression, status, and inventory.  

The intro sequence (character creation and beginning narrative steps) are hard-coded in various html views under "thelaststation\app\views\characters".

### Prerequisites
* Ruby - 2.5.0
* Bundler - 1.17.3
* PostgreSQL - 14
  * **Note to self**: If you're still using WSL on Windows, install/run/use postgres from the command line *for the love of god!!!*

### Local Development Setup
Edit the `config/database.yml` to match your local Postgres connection details, then run:

```
 bundle install
 bin/rails db:environment:set RAILS_ENV=development
 rake db:schema:load
 bundle exec rails s
```

## Deployment

I recommend [Heroku](https://www.heroku.com/) or AWS [EC2](https://aws.amazon.com/ec2) / [Lightsail](https://aws.amazon.com/lightsail/) for deployment and AWS s3 for asset hosting.

## Authors
* [Juliana Zhu](https://github.com/riadre)

## License

This project is licensed under the [The Non-Profit Open Software License version 3.0 (NPOSL-3.0)](https://opensource.org/licenses/NPOSL-3.0)

## Acknowledgments

* *Justin Lambert* - for the code reviews and the support.
* *Jake Scott* - for enduring approximately one million NaNoWriMos together.
* *StoryNexus* - for the inspiration.
